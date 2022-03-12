package com.amakawa.pojo;
import lombok.Data;

@Data
public class User {
    private long userId;
    private String userAccount;
    private String userPassword;
    private String userEmail;
    private String userPortrait;
    private int userLevel;
}
