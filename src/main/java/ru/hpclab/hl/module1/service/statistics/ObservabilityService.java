package ru.hpclab.hl.module1.service.statistics;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.stream.Collectors;
@Service
public class ObservabilityService {
    private static final Instant PENDING_STOP = null;

    private final List<Integer> intervals;

    private final int delay;

    private final Set<Timing> timings = new ConcurrentSkipListSet<>(Comparator.comparing(Timing::getStart));

    public ObservabilityService(List<Integer> intervals, int delay) {
        this.intervals = intervals;
        this.delay = delay;
    }

    public void start(String name) {
        Timing timing = new Timing(name, Instant.now(), PENDING_STOP);
        timings.add(timing);
    }

    public void stop(String name) {
        Instant stopTime = Instant.now();
        Optional<Timing> timingOpt = timings.stream()
                .filter(t -> t.getName().equals(name) && t.getStop() == PENDING_STOP)
                .findFirst();

        if (timingOpt.isPresent()) {
            Timing timing = timingOpt.get();
            timing.setStop(stopTime);
        }
    }

    private void removeOldTimings(Instant now, int maxInterval) {
        timings.removeIf(timing -> now.minusSeconds(maxInterval).isAfter(timing.getStart()));
    }

    private Set<String> getUniqueNamesByTiming(List<Timing> timings) {
        return timings.stream().map(Timing::getName)
                .collect(Collectors.toSet());
    }

    @Async(value = "applicationTaskExecutor")
    @Scheduled(fixedDelayString = "${service.statistic.observability.delay}")
    public void getStatistics() {
        List<Timing> snapshot = new ArrayList<>(timings);
        Instant now = Instant.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
                .withZone(ZoneId.systemDefault());

        int maxInterval = intervals.stream().max(Integer::compare).get();
        removeOldTimings(now, maxInterval);

        Set<String> uniqueNames = getUniqueNamesByTiming(snapshot);

        // сюда собираем статистику и потом выводим единым выводом
        Map<String, Map<Integer, Statistic>> stats = new HashMap<>();

        for (String name : uniqueNames) {
            Map<Integer, Statistic> intervalStats = new HashMap<>();
            for (int interval : intervals) {
                List<Timing> filteredTimings = snapshot.stream()
                        .filter(t -> t.getStop() != PENDING_STOP
                                && !t.getStart().isBefore(now.minusSeconds(interval))
                                && !t.getStart().isAfter(now)
                                && t.getName().equals(name))
                        .toList();

                if (!filteredTimings.isEmpty()) {
                    double averageDuration = filteredTimings.stream()
                            .mapToLong(t -> Duration.between(t.getStart(), t.getStop()).toMillis())
                            .average().getAsDouble();

                    int callCount = filteredTimings.size();
                    intervalStats.put(interval, new Statistic(averageDuration / 1000, callCount));
                }
            }
            if (!intervalStats.isEmpty()) {
                stats.put(name, intervalStats);
            }
        }

        // Теперь централизованный вывод:
        String timestamp = "[" + formatter.format(now) + "]";
        System.out.println("\nPrint observability statistics in delay: " + delay);

        for (Map.Entry<String, Map<Integer, Statistic>> entry : stats.entrySet()) {
            String name = entry.getKey();
            Map<Integer, Statistic> intervalStats = entry.getValue();

            for (Map.Entry<Integer, Statistic> statEntry : intervalStats.entrySet()) {
                int interval = statEntry.getKey();
                Statistic stat = statEntry.getValue();
                System.out.println(timestamp + " - " + interval + " : " + name +
                        " - avg: " + stat.getAverage() + " s., calls: " + stat.getCallCount());
            }
        }
    }

    // Вспомогательный класс для хранения статистики
    class Statistic {
        private final double average;
        private final int callCount;

        public Statistic(double average, int callCount) {
            this.average = average;
            this.callCount = callCount;
        }

        public double getAverage() {
            return average;
        }

        public int getCallCount() {
            return callCount;
        }
    }
}