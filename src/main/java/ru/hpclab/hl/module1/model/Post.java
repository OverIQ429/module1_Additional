package ru.hpclab.hl.module1.model;


import org.springframework.lang.NonNull;

import java.time.LocalDateTime;
import java.util.UUID;

public class Post {

    @NonNull
    private UUID identifier;
    @NonNull
    private String Text;
    @NonNull
    private LocalDateTime publicationDate;

    @NonNull
    private UUID owner;

    public Post(@NonNull UUID identifier, @NonNull String Text, @NonNull UUID owner) {
        this.identifier = identifier;
        this.Text = Text;
        this.owner = owner;
    }

    public Post() {
    }

    @NonNull
    public UUID getIdentifier() {
        return identifier;
    }

    public void setIdentifier(@NonNull UUID identifier) {
        this.identifier = identifier;
    }

    @NonNull
    public UUID getOwner() {
        return owner;
    }

    public void setOwner(@NonNull UUID owner) {
        this.owner = owner;
    }

    @NonNull
    public String getText() {
        return Text;
    }

    public void setText(@NonNull String Text) {
        this.Text = Text;
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
        return "Post{" +
                "identifier=" + identifier +
                ", text='" + Text + '\'' +
                ", publicationDate=" + publicationDate +
                '}';
    }
}
