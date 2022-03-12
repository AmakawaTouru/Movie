package com.amakawa.service.impl;

import com.amakawa.dto.CommentDto;
import com.amakawa.dto.MovieDto;
import com.amakawa.mapper.CommentMapper;
import com.amakawa.mapper.MovieMapper;
import com.amakawa.mapper.UserMapper;
import com.amakawa.pojo.Comment;
import com.amakawa.pojo.Movie;
import com.amakawa.pojo.User;
import com.amakawa.service.ICommentService;
import com.amakawa.util.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentService implements ICommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MovieMapper movieMapper;

    @Override
    public Integer addComemnt(Comment comment) {
        return commentMapper.addComemnt(comment);
    }

    @Transactional
    @Override
    public List<CommentDto> findCommentByMid(Long mid) {
        List<Comment> clist = commentMapper.findCommentByMid(mid);
        Movie m = movieMapper.findMovieById(mid);
        MovieDto mdto = new MovieDto(m);
        Date date = DateFormatUtils.StringToDate("yyyy-MM-dd", m.getMovieRelease());
        mdto.setMovieRelease(date);
        List<CommentDto> cdtoList = new ArrayList<>();
        for (Comment c:clist){
            CommentDto commentDto = new CommentDto(c);
            long uid = c.getCommentUser();
            User user = userMapper.findUserById(uid);
            String dateTime = DateFormatUtils.DateToString("yyyy-MM-dd HH:mm:ss", c.getCommentTime());
            commentDto.setCommentTime(dateTime);
            commentDto.setCommentUser(user);
            commentDto.setCommentMovie(mdto);
            cdtoList.add(commentDto);
        }
        return cdtoList;
    }

    @Override
    public Comment findCommentByid(Long id) {
        return commentMapper.findCommentByid(id);
    }

    @Override
    public Integer updateComment(Comment comment) {
        return commentMapper.updateComment(comment);
    }

    @Override
    public Integer deleteComment(Long cid) {
        return commentMapper.deleteComment(cid);
    }
}
