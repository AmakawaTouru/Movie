package com.amakawa.mapper;

import com.amakawa.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    List<Comment> findCommentByMid(@Param("mid") Long movie_id);
    Integer addComemnt(@Param("c")Comment comment);
    Comment findCommentByid(@Param("id") Long id);
    Integer updateComment(@Param("c") Comment comment);
    Integer deleteComment(@Param("id") Long id);
}
