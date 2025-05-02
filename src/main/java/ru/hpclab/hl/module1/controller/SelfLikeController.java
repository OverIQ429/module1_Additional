package ru.hpclab.hl.module1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.hpclab.hl.module1.service.SelfLikesService;
import ru.hpclab.hl.module1.service.statistics.ObservabilityService;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping
public class SelfLikeController {

    private final SelfLikesService selfLikesService;
    private final ObservabilityService observabilityService;
    @Autowired
    public SelfLikeController(SelfLikesService selfLikesService, ObservabilityService observabilityService) {
        this.selfLikesService = selfLikesService;
        this.observabilityService = observabilityService;
    }

    @GetMapping("/users/selflikes")
    public List<Map<String, Object>> getselflikesUsers() {
        this.observabilityService.start(getClass().getSimpleName() + ":create");
        List<Map<String, Object>> temp = selfLikesService.getSelflikesUser();
        this.observabilityService.stop(getClass().getSimpleName() + ":create");
        return temp;
    }
}
