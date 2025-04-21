import os
import time
import subprocess
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime

class PerformanceTester:
    def __init__(self):
        self.results_dir = f"results_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        os.makedirs(self.results_dir, exist_ok=True)

        # Конфигурация тестов
        self.cpu_steps = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0]
        self.ratios = ['5_95', '50_50', '95_5']
        self.test_duration = 300  # 5 минут в секундах
        self.jmeter_scenarios = {
            'local_to_server': 'tests/local_scenario.jmx',
            'server_to_server': 'tests/server_scenario.jmx'
        }

        # Настройки Docker
        self.docker_compose_file = 'docker-compose.yml'
        self.backup_compose_file = 'docker-compose.backup.yml'

        # Создаем резервную копию docker-compose файла
        self._backup_compose_file()

    def _backup_compose_file(self):
        """Создает резервную копию docker-compose файла"""
        with open(self.docker_compose_file, 'r') as f:
            with open(self.backup_compose_file, 'w') as bf:
                bf.write(f.read())

    def _update_compose_file(self, cpu_limit, ratio):
        """Обновляет docker-compose файл с новыми параметрами"""
        with open(self.docker_compose_file, 'r') as f:
            content = f.read()

        # Обновляем лимиты CPU
        content = self._update_config(content, 'cpus:', f"cpus: '{cpu_limit}'")

        # Обновляем соотношение read/write
        content = self._update_config(content, 'READ_WRITE_RATIO:', f'READ_WRITE_RATIO: {ratio}')

        with open(self.docker_compose_file, 'w') as f:
            f.write(content)

    def _update_config(self, content, key, new_value):
        """Вспомогательная функция для обновления конфига"""
        lines = content.split('\n')
        for i, line in enumerate(lines):
            if key in line:
                lines[i] = f'      {new_value}'
                break
        return '\n'.join(lines)

    def _run_docker_compose(self):
        """Перезапускает docker-compose"""
        subprocess.run(['docker-compose', 'down'], check=True)
        subprocess.run(['docker-compose', 'up', '-d'], check=True)
        time.sleep(30)  # Ожидаем инициализации сервисов

    def _run_jmeter_test(self, scenario_file, ratio, cpu):
        """Запускает JMeter тест"""
        result_file = os.path.join(
            self.results_dir,
            f"{os.path.basename(scenario_file).replace('.jmx', '')}_{ratio}_{cpu}cpus.jtl"
        )

        cmd = [
            'jmeter', '-n', '-t', scenario_file,
            '-l', result_file,
            '-Jduration', str(self.test_duration),
            '-Jratio', ratio
        ]

        subprocess.run(cmd, check=True)
        return result_file

    def _collect_docker_stats(self, test_name, ratio, cpu):
        """Собирает статистику Docker"""
        stats_file = os.path.join(
            self.results_dir,
            f"docker_stats_{test_name}_{ratio}_{cpu}cpus.csv"
        )

        # Собираем статистику каждые 5 секунд
        start_time = time.time()
        with open(stats_file, 'w') as f:
            f.write("timestamp,container,cpu_perc,mem_usage\n")

            while time.time() - start_time < self.test_duration:
                result = subprocess.run(
                    ['docker', 'stats', '--no-stream', '--format', '{{.Container}},{{.CPUPerc}},{{.MemUsage}}'],
                    capture_output=True, text=True
                )

                timestamp = datetime.now().isoformat()
                for line in result.stdout.split('\n'):
                    if line.strip():
                        f.write(f"{timestamp},{line}\n")

                time.sleep(5)

    def run_tests(self):
        """Основной метод для запуска всех тестов"""
        results = []

        for test_name, scenario_file in self.jmeter_scenarios.items():
            for ratio in self.ratios:
                for cpu in self.cpu_steps:
                    print(f"Running {test_name} with ratio {ratio} and {cpu} CPUs")

                    # Обновляем конфигурацию
                    self._update_compose_file(cpu, ratio)

                    # Перезапускаем сервисы
                    self._run_docker_compose()

                    # Запускаем тест JMeter в фоне
                    jmeter_process = subprocess.Popen([
                        'jmeter', '-n', '-t', scenario_file,
                        '-l', os.path.join(self.results_dir, f'{test_name}_{ratio}_{cpu}cpus.jtl'),
                        '-Jduration', str(self.test_duration),
                        '-Jratio', ratio
                    ])

                    # Собираем статистику Docker
                    self._collect_docker_stats(test_name, ratio, cpu)

                    # Дожидаемся завершения JMeter
                    jmeter_process.wait()

                    # Парсим результаты JMeter
                    jmeter_results = self._parse_jmeter_results(
                        os.path.join(self.results_dir, f'{test_name}_{ratio}_{cpu}cpus.jtl')
                    )

                    # Добавляем метаданные
                    jmeter_results.update({
                        'test_name': test_name,
                        'ratio': ratio,
                        'cpu': cpu
                    })

                    results.append(jmeter_results)

                    # Сохраняем промежуточные результаты
                    pd.DataFrame(results).to_csv(
                        os.path.join(self.results_dir, 'all_results.csv'),
                        index=False
                    )

        # Восстанавливаем оригинальный docker-compose файл
        self._restore_compose_file()

        return results

    def _parse_jmeter_results(self, jtl_file):
        """Парсит результаты JMeter из .jtl файла"""
        df = pd.read_csv(jtl_file)

        return {
            'response_time_avg': df['elapsed'].mean(),
            'response_time_90p': df['elapsed'].quantile(0.9),
            'throughput': len(df) / self.test_duration,
            'error_rate': df[df['success'] == False].shape[0] / len(df) if len(df) > 0 else 0
        }

    def _restore_compose_file(self):
        """Восстанавливает оригинальный docker-compose файл"""
        with open(self.backup_compose_file, 'r') as f:
            with open(self.docker_compose_file, 'w') as bf:
                bf.write(f.read())
        os.remove(self.backup_compose_file)

    def analyze_results(self):
        """Анализирует результаты и строит графики"""
        results_file = os.path.join(self.results_dir, 'all_results.csv')
        if not os.path.exists(results_file):
            raise FileNotFoundError("No test results found")

        df = pd.read_csv(results_file)

        # График времени отклика от количества CPU
        plt.figure(figsize=(15, 10))
        sns.set_theme(style="whitegrid")

        g = sns.FacetGrid(df, col="ratio", hue="test_name", height=5)
        g.map(sns.lineplot, "cpu", "response_time_avg")
        g.map(sns.scatterplot, "cpu", "response_time_avg")
        g.add_legend()
        g.set_axis_labels("CPU Cores", "Average Response Time (ms)")
        g.set_titles("Read/Write Ratio: {col_name}")

        plt.savefig(os.path.join(self.results_dir, 'response_time_vs_cpus.png'))
        plt.close()

        # Дополнительные графики
        self._plot_additional_metrics(df)

    def _plot_additional_metrics(self, df):
        """Строит дополнительные графики метрик"""
        metrics = ['response_time_90p', 'throughput', 'error_rate']

        for metric in metrics:
            plt.figure(figsize=(15, 10))
            sns.set_theme(style="whitegrid")

            g = sns.FacetGrid(df, col="ratio", hue="test_name", height=5)
            g.map(sns.lineplot, "cpu", metric)
            g.map(sns.scatterplot, "cpu", metric)
            g.add_legend()
            g.set_axis_labels("CPU Cores", metric.replace('_', ' ').title())
            g.set_titles("Read/Write Ratio: {col_name}")

            plt.savefig(os.path.join(self.results_dir, f'{metric}_vs_cpus.png'))
            plt.close()


if __name__ == "__main__":
    tester = PerformanceTester()

    # Запуск тестов
    print("Starting performance tests...")
    results = tester.run_tests()

    # Анализ результатов
    print("Analyzing results...")
    tester.analyze_results()

    print(f"Testing completed. Results saved in {tester.results_dir}")