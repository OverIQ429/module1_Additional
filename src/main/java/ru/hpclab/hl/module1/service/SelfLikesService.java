package ru.hpclab.hl.module1.service;

import org.springframework.stereotype.Service;
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
public class SelfLikesService {

    private final JpaUserRepository userRepository;
    private final JpaPostRepository postRepository;
    private final JpaLikesRepository likesRepository;
    private static final Logger logger = LoggerFactory.getLogger(SelfLikesService.class); // Исправлена инициализация логгера


    public SelfLikesService(JpaUserRepository  userRepository, JpaPostRepository postRepository, JpaLikesRepository likesRepository) {
        this.userRepository = userRepository;
        this.postRepository = postRepository;
        this.likesRepository = likesRepository;
    }


    public User getUserById(UUID id) {
        logger.info("Получение пользователя по ID: {}", id);
        return userRepository.findById(id).orElse(null);
    }

    public List<Map<String, Object>> getSelflikesUser() {
        List<Likes> allLikes = likesRepository.findAll();
        Map<UUID, Post> postCache = postRepository.findAll().stream()
                .collect(Collectors.toMap(Post::getIdentifier, post -> post));

        // Мапа для хранения данных о пользователях и их самолайках
        Map<UUID, Map<String, Object>> userDataMap = new HashMap<>();

        for (Likes like : allLikes) {
            Post post = postCache.get(like.getPostId());
            if (post != null && post.getOwner() != null && post.getOwner().equals(like.getUserId())) {
                // Если пользователь уже есть в мапе, увеличиваем счетчик
                if (userDataMap.containsKey(like.getUserId())) {
                    Map<String, Object> userInfo = userDataMap.get(like.getUserId());
                    userInfo.put("selfLikeCount", (Integer) userInfo.get("selfLikeCount") + 1);
                }
                // Иначе добавляем нового пользователя
                else {
                    User user = getUserById(like.getUserId());
                    Map<String, Object> userInfo = new HashMap<>();
                    userInfo.put("fio", user.getFio());
                    userInfo.put("userId", like.getUserId());
                    userInfo.put("selfLikeCount", 1);
                    userDataMap.put(like.getUserId(), userInfo);
                }
            }
        }

        // Преобразуем в список и сортируем
        List<Map<String, Object>> result = new ArrayList<>(userDataMap.values());
        result.sort((a, b) -> ((Integer) b.get("selfLikeCount")).compareTo((Integer) a.get("selfLikeCount")));

        return result;
    }
}
