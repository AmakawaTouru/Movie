package com.amakawa.dto;

import com.amakawa.pojo.Comment;
import com.amakawa.pojo.User;
import lombok.Data;

import java.util.Date;
@Data
public class CommentDto {
    private long commentId;
    private User commentUser;
    private MovieDto commentMovie;
    private String commentTime;
    private String commentContent;

    public CommentDto() {
    }

    public CommentDto(Comment comment) {
        commentId = comment.getCommentId();
        commentContent = comment.getCommentContent();
    }

    public CommentDto(long commentId, User commentUser, MovieDto commentMovie, String commentTime, String commentContent) {
        this.commentId = commentId;
        this.commentUser = commentUser;
        this.commentMovie = commentMovie;
        this.commentTime = commentTime;
        this.commentContent = commentContent;
    }
}
