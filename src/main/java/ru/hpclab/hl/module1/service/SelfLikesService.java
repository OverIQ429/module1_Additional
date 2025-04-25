package ru.hpclab.hl.module1.service;

import org.springframework.stereotype.Service;
import ru.hpclab.hl.module1.client.CrudServiceClient;
import ru.hpclab.hl.module1.client.UserCache;
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

    private final UserCache userCache;
    private final CrudServiceClient crudServiceClient;
    private final JpaLikesRepository likesRepository;
    private static final Logger logger = LoggerFactory.getLogger(SelfLikesService.class); // Исправлена инициализация логгера


    public SelfLikesService(JpaUserRepository  userRepository, CrudServiceClient crudServiceClient, JpaPostRepository postRepository, UserCache userCache, JpaLikesRepository likesRepository) {
        this.userRepository = userRepository;
        this.crudServiceClient = crudServiceClient;
        this.userCache = userCache;
        this.likesRepository = likesRepository;
    }


    public User getUserById(UUID id) {
        logger.info("Получение пользователя по ID: {}", id);
        return userRepository.findById(id).orElse(null);
    }

    public List<Map<String, Object>> getSelflikesUser() {
        List<Likes> allLikes = likesRepository.findAll();
        Map<UUID, Map<String, Object>> userDataMap = new HashMap<>();

        for (Likes like : allLikes) {

            Post post = crudServiceClient.getPostById(like.getPostId());
            User user = userCache.get(like.getUserId());
            if (user == null) {
                user = crudServiceClient.getUserById(like.getUserId());
                if (user != null) {
                    userCache.put(like.getUserId(), user);
                }
            }

            if (post != null && post.getOwner() != null && post.getOwner().equals(user.getIdentifier())) {
                if (userDataMap.containsKey(like.getUserId())) {
                    Map<String, Object> userInfo = userDataMap.get(like.getUserId());
                    userInfo.put("selfLikeCount", (Integer) userInfo.get("selfLikeCount") + 1);
                }
                else {
                    Map<String, Object> userInfo = new HashMap<>();
                    userInfo.put("fio", user.getFio());
                    userInfo.put("userId", like.getUserId());
                    userInfo.put("selfLikeCount", 1);
                    userDataMap.put(like.getUserId(), userInfo);
                }
            }
        }

        List<Map<String, Object>> result = new ArrayList<>(userDataMap.values());
        result.sort((a, b) -> ((Integer) b.get("selfLikeCount")).compareTo((Integer) a.get("selfLikeCount")));

        return result;
    }
}
