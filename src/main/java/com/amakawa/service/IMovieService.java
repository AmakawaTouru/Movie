package com.amakawa.service;

import com.amakawa.dto.MovieDto;
import com.amakawa.pojo.Movie;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface IMovieService {
    List<Movie> findAllMovie(Integer status);
    Movie findMovieById(Long id);
    Integer addMovie(MovieDto movieDto);
    Integer updateMovie(MovieDto movieDto);
    Integer rmMovie(Long id);
    Integer upMovie(Long id);
    Integer reUpMovie(Long id);
    Integer getMovieCommentNum(Long id);
    Double getScore(Long id);
    Integer updateScore(Long id,Double score,Integer num);
    List<Movie> sortMovieByCount(Integer status);
    List<Movie> sortMovieByDate(Integer status);
    List<Movie> sortMovieByScore(Integer status);
    List<Movie> findMoviesLikeType(String type);
    List<Movie> sortAllMovie(String order, String type, String area, Integer status);
}
