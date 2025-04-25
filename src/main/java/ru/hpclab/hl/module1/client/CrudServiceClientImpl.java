package ru.hpclab.hl.module1.client;

import io.micrometer.observation.Observation;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import ru.hpclab.hl.module1.model.User;
import ru.hpclab.hl.module1.model.Post;

import java.util.List;
import java.util.UUID;

@Component
public class CrudServiceClientImpl implements CrudServiceClient {
    private final RestTemplate restTemplate;
    private final String crudServiceUrl = "http://crud-service:8080";

    public CrudServiceClientImpl(RestTemplate restTemplate, UserCache userCache) {
        this.restTemplate = restTemplate;
    }

    @Override
    public Post getPostById(UUID id) {
        return restTemplate.getForObject(
                crudServiceUrl + "/posts/" + id,
                Post.class
        );
    }

    @Override
    public List<User> getAllUsers() {
        return restTemplate.exchange(
                crudServiceUrl + "/users",
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<User>>() {}
        ).getBody();
    }

    @Override
    public User getUserById(UUID id) {
        return restTemplate.getForObject(
                crudServiceUrl + "/users/" + id,
                User.class
        );
    }
}