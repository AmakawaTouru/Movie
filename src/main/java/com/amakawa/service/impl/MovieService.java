package com.amakawa.service.impl;

import com.amakawa.dto.MovieDto;
import com.amakawa.mapper.MovieMapper;
import com.amakawa.pojo.Movie;
import com.amakawa.service.IMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieService implements IMovieService {

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public List<Movie> findAllMovie(Integer status) {
        return movieMapper.findAllMovie(status);
    }

    @Override
    public Movie findMovieById(Long id) {
        return movieMapper.findMovieById(id);
    }

    @Override
    public Integer addMovie(MovieDto movieDto) {
        return movieMapper.addMovie(movieDto);
    }

    @Override
    public Integer updateMovie(MovieDto movieDto) {
        return movieMapper.updateMovie(movieDto);
    }

    @Override
    public Integer rmMovie(Long id) {
        return movieMapper.rmMovie(id);
    }

    @Override
    public Integer upMovie(Long id) {
        return movieMapper.upMovie(id);
    }

    @Override
    public Integer reUpMovie(Long id) {
        return movieMapper.reUpMovie(id);
    }

    @Override
    public Integer getMovieCommentNum(Long id) {
        return movieMapper.getMovieCommentNum(id);
    }

    @Override
    public Double getScore(Long id) {
        return movieMapper.getScore(id);
    }

    @Override
    public Integer updateScore(Long id, Double score,Integer num) {
        return movieMapper.updateScore(id,score,num);
    }

    @Override
    public List<Movie> sortMovieByCount(Integer status) {
        return movieMapper.sortMovieByCount(status);
    }

    @Override
    public List<Movie> sortMovieByDate(Integer status) {
        return movieMapper.sortMovieByDate(status);
    }

    @Override
    public List<Movie> sortMovieByScore(Integer status) {
        return movieMapper.sortMovieByScore(status);
    }

    @Override
    public List<Movie> findMoviesLikeType(String type) {
        return movieMapper.findMoviesLikeType(type);
    }

    @Override
    public List<Movie> sortAllMovie(String order, String type, String area, Integer status) {
        return movieMapper.sortAllMovie(order, type,area,status);
    }
}
