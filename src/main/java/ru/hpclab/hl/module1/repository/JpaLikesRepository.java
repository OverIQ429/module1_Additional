package ru.hpclab.hl.module1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.hpclab.hl.module1.model.Likes;

import java.util.UUID;

public interface JpaLikesRepository extends JpaRepository<Likes, UUID> {

}