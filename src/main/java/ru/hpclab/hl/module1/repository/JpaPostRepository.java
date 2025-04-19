package ru.hpclab.hl.module1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.hpclab.hl.module1.model.Post;

import java.util.UUID;

public interface JpaPostRepository extends JpaRepository<Post, UUID> {
}