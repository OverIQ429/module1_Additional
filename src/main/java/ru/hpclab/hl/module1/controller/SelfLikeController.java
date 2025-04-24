package ru.hpclab.hl.module1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.hpclab.hl.module1.service.SelfLikesService;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping
public class SelfLikeController {

    private final SelfLikesService selfLikesService;

    @Autowired
    public SelfLikeController(SelfLikesService selfLikesService) {
        this.selfLikesService = selfLikesService;
    }

    @GetMapping("/users/selflikes")
    public List<Map<String, Object>> getselflikesUsers() {
        return selfLikesService.getSelflikesUser();
    }
}
