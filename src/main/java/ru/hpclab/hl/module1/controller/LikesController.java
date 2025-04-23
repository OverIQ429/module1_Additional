package ru.hpclab.hl.module1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.hpclab.hl.module1.model.Likes;
import ru.hpclab.hl.module1.service.LikesService;
import java.util.List;

@RestController
@RequestMapping
public class LikesController {

    private final LikesService likesService;

    @Autowired
    public LikesController(LikesService likesService) {
        this.likesService = likesService;
    }

    @GetMapping("/likes")
    public List<Likes> getLikes() {
        return likesService.getAllLikes();
    }

    @GetMapping("/likes/{id}")
    public Likes getLikesById(@PathVariable String id) {
        return likesService.getLikesById(id);
    }

    @DeleteMapping("/likes/{id}")
    public void deleteLikes(@PathVariable String id) {
        likesService.deleteLikes(id);
    }

    @DeleteMapping("/likes/clear")
    public void clearAllLikes() {
        likesService.clearAllLikes();
    }

    @PostMapping(value = "/likes/")
    public Likes saveLikes(@RequestBody Likes likes) {
        return likesService.saveLikes(likes);
    }

    @PutMapping(value = "/likes/{id}")
    public Likes updateLikes(@PathVariable(required = false) String id, @RequestBody Likes likes) {
        return likesService.updateLikes(id, likes);
    }

    @GetMapping("/likes/selflikes")
    public List<Likes> get_selfLikes() {
        return likesService.getAllLikes();
    }

}
