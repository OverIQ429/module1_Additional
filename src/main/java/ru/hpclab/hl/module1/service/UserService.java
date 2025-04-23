package ru.hpclab.hl.module1.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.hpclab.hl.module1.model.Likes;
import ru.hpclab.hl.module1.model.Post;
import ru.hpclab.hl.module1.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.hpclab.hl.module1.repository.JpaLikesRepository;
import ru.hpclab.hl.module1.repository.JpaPostRepository;
import ru.hpclab.hl.module1.repository.JpaUserRepository;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final JpaUserRepository userRepository;
    private final JpaPostRepository postRepository;
    private final JpaLikesRepository likesRepository;
    private static final Logger logger = LoggerFactory.getLogger(UserService.class); // Исправлена инициализация логгера


    public UserService(JpaUserRepository  userRepository, JpaPostRepository postRepository, JpaLikesRepository likesRepository) {
        this.userRepository = userRepository;
        this.postRepository = postRepository;
        this.likesRepository = likesRepository;
    }

    @Transactional
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(String id) {
        logger.info("Получение пользователя по ID: {}", id);
        return userRepository.findById(UUID.fromString(id)).orElse(null);
    }

    public void clearAllUsers() {
        userRepository.deleteAll();
    }
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

    public List<Map<String, Object>> getSelflikesUser() {
        List<Map<String, Object>> result = new ArrayList<>();
        List<Likes> allLikes = likesRepository.findAll();
        List<User> allUsers = userRepository.findAll();

        // Создаем временный кэш постов для оптимизации
        Map<UUID, Post> postCache = postRepository.findAll().stream()
                .collect(Collectors.toMap(Post::getIdentifier, post -> post));

        for (User user : allUsers) {
            int selfLikeCount = 0;
            List<Map<String, Object>> selfLikedPosts = new ArrayList<>();

            for (Likes like : allLikes) {
                Post post = postCache.get(like.getPostId());
                if (post != null && post.getOwner().equals(like.getUserId())) {
                    selfLikeCount++;

                    // Добавляем информацию о посте
                    Map<String, Object> postInfo = new HashMap<>();
                    postInfo.put("postId", post.getIdentifier());
                    selfLikedPosts.add(postInfo);
                }
            }

            if (selfLikeCount > 0) {
                Map<String, Object> userInfo = new HashMap<>();
                userInfo.put("userId", user.getIdentifier());
                userInfo.put("selfLikeCount", selfLikeCount);
                userInfo.put("selfLikedPosts", selfLikedPosts);
                result.add(userInfo);
            }
        }

        // Сортируем по количеству самолайков (по убыванию)
        result.sort((a, b) -> ((Integer)b.get("selfLikeCount")).compareTo((Integer)a.get("selfLikeCount")));

        return result;
    }
}
