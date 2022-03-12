package com.amakawa.pojo;

import lombok.Data;

@Data
public class Movie {
    private long movieId;
    private String movieName;
    private String movieForeignName;
    private String movieDirector;
    private String movieActors;
    private String movieTypes;
    private String movieRegion;
    private String movieLanguage;
    //上映日期需要处理成Date格式。
    private String movieRelease;
    private String moviePoster;
    private String movieLength;
    private String movieIntroduction;
    private float movieScore;
    private int movieCommentNum;
    private float movieBoxOffice;
    private int movieStatus;
}
