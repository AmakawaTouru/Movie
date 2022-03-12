package com.amakawa.mapper;

import com.amakawa.dto.MovieDto;
import com.amakawa.pojo.Movie;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieMapper {
    //根据状态查询电影
    List<Movie> findAllMovie(@Param("status") Integer status);
    //根据电影ID查找
    Movie findMovieById(@Param("id") Long id);
    //增加电影
    Integer addMovie(@Param("mv")MovieDto mv);
    //修改电影
    Integer updateMovie(@Param("mv")MovieDto mv);
    //上映电影改变状态为下架
    Integer rmMovie(@Param("id") Long id);
    //上映
    Integer upMovie(@Param("id") Long id);
    //重新上架
    Integer reUpMovie(@Param("id") Long id);
    //查询评论人数
    Integer getMovieCommentNum(@Param("id") Long id);
    //查询分数
    Double getScore(@Param("id") Long id);
    //更新分数
    Integer updateScore(@Param("id") Long id,@Param("score") Double score,@Param("num") Integer num);
    //根据评价人数来进行
    List<Movie> sortMovieByCount(@Param("status") Integer status);
    //根据日期来进行排序
    List<Movie> sortMovieByDate(@Param("status") Integer status);
    //根据分数来进行排序
    List<Movie> sortMovieByScore(@Param("status") Integer status);
    //用于查找不同的电影类型
    List<Movie> findMoviesLikeType(@Param("type") String type);
    List<Movie> sortAllMovie(@Param("order") String order,
                             @Param("type") String type,
                             @Param("area") String area,
                             @Param("status") Integer status);
}

