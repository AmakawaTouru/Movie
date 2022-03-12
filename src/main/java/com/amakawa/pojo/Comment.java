package com.amakawa.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Comment {
    private long commentId;
    private long commentUser;
    private long commentMovie;
    private Date commentTime;
    private String commentContent;
}
