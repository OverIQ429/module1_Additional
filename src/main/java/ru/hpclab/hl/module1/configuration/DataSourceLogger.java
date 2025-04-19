package ru.hpclab.hl.module1.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@Component
public class DataSourceLogger {

    private static final Logger logger = LoggerFactory.getLogger(DataSourceLogger.class);

    @Autowired
    private DataSource dataSource;

    @EventListener(ApplicationReadyEvent.class)
    public void logDataSourceInfo() {
        try (Connection connection = dataSource.getConnection()) {
            String url = connection.getMetaData().getURL();
            logger.info("Строка подключения из DataSource (автоматически настроенного Spring Boot'ом): {}", url);
        } catch (SQLException e) {
            logger.error("Ошибка при получении строки подключения: ", e);
        }
    }
}