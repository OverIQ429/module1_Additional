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

    public Likes( @NonNull String fio, @NonNull UUID identifier) {
        this.identifier = identifier;
        this.fio = fio;
    }

    public Likes() {
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
                ", fio='" + fio + '\'' +
                ", publicationDate=" + publicationDate +
                '}';
    }

}
