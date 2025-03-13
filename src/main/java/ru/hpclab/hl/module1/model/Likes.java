package ru.hpclab.hl.module1.model;


import org.springframework.lang.NonNull;

import java.time.LocalDateTime;
import java.util.UUID;

public class Likes {

    @NonNull
    private UUID identifier;
    @NonNull
    private String fio;
    @NonNull
    private LocalDateTime publicationDate;

    @NonNull
    private UUID postId;

    @NonNull
    private UUID userId;

    public Likes( @NonNull String fio, @NonNull UUID identifier, @NonNull UUID postId, @NonNull UUID userId) {
        this.identifier = identifier;
        this.fio = fio;
        this.postId = postId;
        this.userId = userId;
    }

    public Likes() {
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public UUID getPostId() {
        return postId;
    }

    public void setPostId(UUID postId) {
        this.postId = postId;
    }

    @NonNull
    public UUID getIdentifier() {
        return identifier;
    }

    public void setIdentifier(@NonNull UUID identifier) {
        this.identifier = identifier;
    }

    @NonNull
    public String getfio() {
        return fio;
    }

    public void setfio(@NonNull String fio) {
        this.fio = fio;
    }

    @NonNull
    public LocalDateTime getPublicationDate() { //getter for new field
        return publicationDate;
    }

    public void setPublicationDate(@NonNull LocalDateTime publicationDate) { //setter for new field
        this.publicationDate = publicationDate;
    }

    @Override
    public String toString() {
        return "Likes{" +
                "identifier_post=" + identifier +
                ", post=" + postId + '\'' +
                ", fio='" + fio + '\'' +
                ", publicationDate=" + publicationDate +
                '}';
    }

}
