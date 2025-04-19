package ru.hpclab.hl.module1.service;

import org.springframework.stereotype.Service;
import ru.hpclab.hl.module1.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.hpclab.hl.module1.repository.JpaUserRepository;

import java.util.List;
import java.util.UUID;

@Service
public class UserService {

    private final JpaUserRepository userRepository;
    private static final Logger logger = LoggerFactory.getLogger(UserService.class); // Исправлена инициализация логгера


    public UserService(JpaUserRepository  userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(String id) {
        logger.info("Получение пользователя по ID: {}", id);
        return userRepository.findById(UUID.fromString(id)).orElse(null);
    }

//    public void clearAllUsers() {
//        userRepository.deleteAll();
//    }
    public User saveUser(User user) {
        logger.info("Сохранение пользователя: {}", user);
        User savedUser = userRepository.save(user);
        logger.info("Пользователь успешно сохранен: {}", savedUser);
        return userRepository.save(user);
    }

    public void deleteUser(String id) {
        logger.info("Удаление пользователя с ID: {}", id);
        userRepository.deleteById(UUID.fromString(id));
        logger.info("Пользователь с ID {} успешно удален", id);
    }

    public User updateUser(String id, User user) {
        logger.info("Обновление пользователя с ID: {}, Данные: {}", id, user);
        user.setIdentifier(UUID.fromString(id));
        User updatedUser = userRepository.save(user);
        logger.info("Пользователь с ID {} успешно обновлен", id);
        return updatedUser;
    }
}
