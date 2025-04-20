package ru.hpclab.hl.module1.service;

import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import ru.hpclab.hl.module1.model.Likes;
import ru.hpclab.hl.module1.repository.JpaLikesRepository;
import java.util.List;
import java.util.UUID;
import ru.hpclab.hl.module1.repository.JpaPostRepository;
import ru.hpclab.hl.module1.model.Post;
@Service
public class LikesService {

    private static final Logger logger = LoggerFactory.getLogger(LikesService.class);
    private final JpaLikesRepository likesRepository;


    public void clearAllLikes() {
        likesRepository.deleteAll();
    }

    public LikesService(JpaLikesRepository likesRepository) {
        this.likesRepository = likesRepository;
    }

    public List<Likes> getAllLikes() {
        return likesRepository.findAll();
    }

    public Likes getLikesById(String id) {
        return likesRepository.findById(UUID.fromString(id)).orElse(null);
    }

    public Likes saveLikes(Likes likes) {
        return likesRepository.save(likes);
    }

    public void deleteLikes(String id) {
        likesRepository.deleteById(UUID.fromString(id));
    }

    public Likes updateLikes(String id, Likes likes) {
        likes.setIdentifier(UUID.fromString(id));
        return likesRepository.save(likes);
    }

//    public Likes addLike(UUID userId, UUID postId) {
//        // Проверяем, существует ли уже лайк от этого пользователя на этот пост
//        Post post = postRepository.findById(postId).orElse(null);
//        if (post.getOwner().equals(userId)) {
//            logger.warn("Пользователь {} поставил лайк своему собственному посту {}", userId, postId);
//        }
//
//        Likes like = new Likes();
//        like.setUserId(userId);
//        like.setPostId(postId);
//
//        return likesRepository.save(like);
//    }
}
