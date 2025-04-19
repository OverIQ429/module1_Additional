package ru.hpclab.hl.module1.controller.exeption;

import java.sql.*;

public class DatabaseTest {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/Social-NetWork"; // Замените на свой URL
        String user = "jimmy"; // Замените на свое имя пользователя
        String password = "jimmy"; // Замените на свой пароль

        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement()) {

            String sql = "INSERT INTO users (id, fio) VALUES ('ecc314d2-26a4-4bfc-8c63-572faff4863a', 'sad')"; // Замените на свой SQL
            int rowsInserted = statement.executeUpdate(sql);

            if (rowsInserted > 0) {
                System.out.println("Данные успешно записаны!");
            } else {
                System.out.println("Не удалось записать данные.");
            }

        } catch (SQLException e) {
            System.err.println("Ошибка при записи данных: " + e.getMessage());
        }
    }
}