package ru.hpclab.hl.module1.repository;

import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;

import ru.hpclab.hl.module1.model.User;
import java.util.UUID;

public interface JpaUserRepository extends JpaRepository<User, UUID> {
}