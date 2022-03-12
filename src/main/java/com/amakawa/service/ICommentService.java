package com.amakawa.service;

import com.amakawa.dto.CommentDto;
import com.amakawa.pojo.Comment;

import java.util.List;

public interface ICommentService {
    Integer addComemnt(Comment comment);
    List<CommentDto> findCommentByMid(Long mid);
    Comment findCommentByid(Long id);
    Integer updateComment(Comment comment);
    Integer deleteComment(Long cid);

}
