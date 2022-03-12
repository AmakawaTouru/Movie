package com.amakawa.dto;

import com.amakawa.pojo.Movie;
import lombok.Data;

import java.util.Date;

@Data
public class MovieDto {
    private long movieId;
    private String movieName;
    private String movieForeignName;
    private String movieDirector;
    private String movieActors;
    private String movieTypes;
    private String movieRegion;
    private String movieLanguage;
    private Date movieRelease;
    private String moviePoster;
    private String movieLength;
    private String movieIntroduction;
    private float movieScore;
    private int movieCommentNum;
    private float movieBoxOffice;
    private int movieStatus;

    public MovieDto() {
    }

    public MovieDto(long movieId, String movieName, String movieForeignName, String movieDirector, String movieActors, String movieTypes, String movieRegion, String movieLanguage, Date movieRelease, String moviePoster, String movieLength, String movieIntroduction, float movieScore, int movieCommentNum, float movieBoxOffice, int movieStatus) {
        this.movieId = movieId;
        this.movieName = movieName;
        this.movieForeignName = movieForeignName;
        this.movieDirector = movieDirector;
        this.movieActors = movieActors;
        this.movieTypes = movieTypes;
        this.movieRegion = movieRegion;
        this.movieLanguage = movieLanguage;
        this.movieRelease = movieRelease;
        this.moviePoster = moviePoster;
        this.movieLength = movieLength;
        this.movieIntroduction = movieIntroduction;
        this.movieScore = movieScore;
        this.movieCommentNum = movieCommentNum;
        this.movieBoxOffice = movieBoxOffice;
        this.movieStatus = movieStatus;
    }

    public MovieDto(Movie movie) {
        movieId = movie.getMovieId();
        movieName = movie.getMovieName();
        movieForeignName = movie.getMovieForeignName();
        movieDirector = movie.getMovieDirector();
        movieActors = movie.getMovieActors();
        movieTypes = movie.getMovieTypes();
        movieRegion = movie.getMovieRegion();
        movieLanguage = movie.getMovieLanguage();
        movieLength = movie.getMovieLength();
        movieIntroduction = movie.getMovieIntroduction();
        movieScore = movie.getMovieScore();
        movieCommentNum = movie.getMovieCommentNum();
        movieBoxOffice = movie.getMovieBoxOffice();
        movieStatus = movie.getMovieStatus();
    }




}
