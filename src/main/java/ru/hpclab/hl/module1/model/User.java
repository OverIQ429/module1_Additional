package ru.hpclab.hl.module1.model;


import org.springframework.lang.NonNull;

import java.time.LocalDateTime;
import java.util.UUID;
import jakarta.persistence.*;
import java.util.UUID;
import java.time.LocalDate;
@Entity // Добавляем аннотацию @Entity
@Table(name = "users") // Указываем имя таблицы в базе данных
public class User {

    @Id // Помечаем поле identifier как первичный ключ
    @GeneratedValue(strategy = GenerationType.UUID) // Генерируем UUID автоматически
    @Column(name = "identifier")
    @NonNull
    private UUID identifier;
    @Column(name = "fio")
    @NonNull
    private String fio;
    @Column(name = "email")
    @NonNull
    private String email;
    @Column(name = "registration_date")
    @NonNull
    private LocalDateTime registrationDate;

    public User(@NonNull UUID identifier, @NonNull String fio, @NonNull String email) {
        this.identifier = identifier;
        this.fio = fio;
        this.email = email;
    }

    public User() {
    }

    @NonNull
    public UUID getIdentifier() {
        return identifier;
    }

    public void setIdentifier(@NonNull UUID identifier) {
        this.identifier = identifier;
    }

    @NonNull
    public String getFio() {
        return fio;
    }

    public void setFio(@NonNull String fio) {
        this.fio = fio;
    }

    @NonNull
    public String getEmail() {
        return email;
    }

    @NonNull
    public LocalDateTime getRegistrationDate() { //getter for new field
        return registrationDate;
    }

    public void setRegistrationDate(@NonNull LocalDateTime registrationDate) { //setter for new field
        this.registrationDate = registrationDate;
    }

    public void setEmail(@NonNull String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "identifier=" + identifier +
                ", fio='" + fio + '\'' +
                ", email='" + email + '\'' +
                ", registrationDate=" + registrationDate +
                '}';
    }
}
