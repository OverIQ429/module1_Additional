package ru.hpclab.hl.module1.client;

import ru.hpclab.hl.module1.model.Post;
import ru.hpclab.hl.module1.model.User;

import java.util.List;
import java.util.UUID;

public interface CrudServiceClient {
    List<User> getAllUsers();
    Post getPostById(UUID id);  // Новый метод

    User getUserById(UUID userId);
}