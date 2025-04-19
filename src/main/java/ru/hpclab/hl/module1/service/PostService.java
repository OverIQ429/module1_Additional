package ru.hpclab.hl.module1.service;

import ru.hpclab.hl.module1.model.Post;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import java.util.UUID;
import ru.hpclab.hl.module1.repository.JpaPostRepository;
@Service
public class PostService {

    private final JpaPostRepository postRepository;

//    public void clearAllPosts() {
//        postRepository.deleteAll();
//    }
    @Autowired
    public PostService(JpaPostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    public Post getPostById(String id) {
        return postRepository.findById(UUID.fromString(id)).orElse(null);
    }

    public Post savePost(Post post) {
        return postRepository.save(post);
    }

    public void deletePost(String id) {
        postRepository.deleteById(UUID.fromString(id));;
    }

    public Post updatePost(String id, Post post) {
        post.setIdentifier(UUID.fromString(id));
        return postRepository.save(post);
    }
}
