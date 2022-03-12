package com.amakawa.controller;

import com.alibaba.fastjson.JSONObject;
import com.amakawa.dto.CommentDto;
import com.amakawa.pojo.Comment;
import com.amakawa.pojo.User;
import com.amakawa.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private ICommentService commentService;

    @ResponseBody
    @RequestMapping("/addCommentByUser")
    public JSONObject addCommentByUser(@RequestParam("movie_id") Long movie_id,
                                       @RequestParam("comment_content") String comment_content,
                                       HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        JSONObject obj = new JSONObject();
        if(user == null) {
            obj.put("code",200);
            obj.put("msg", "您未登录,登录之后才可评论~");
        }else {
            Comment comment = new Comment();
            comment.setCommentContent(comment_content);
            comment.setCommentMovie(movie_id);
            comment.setCommentUser(user.getUserId());
            comment.setCommentTime(new Date());
            Integer rs = commentService.addComemnt(comment);
            if(rs > 0) {
                obj.put("code", 0);
                obj.put("msg", "评论成功~");
            }else {
                obj.put("code",200);
                obj.put("msg", "评论失败~");
            }
        }
        return obj;
    }

    @ResponseBody
    @RequestMapping("findCommentByMid")
    public JSONObject findCommentByMid(@RequestParam("movie_id") Long movie_id) {
        JSONObject json = new JSONObject();
        List<CommentDto> comments = commentService.findCommentByMid(movie_id);
        json.put("data",comments);
        return json;
    }

    @ResponseBody
    @RequestMapping("updateComment")
    public JSONObject updateComment(@RequestParam("comment_id") Long cid,
                                    @RequestParam("comment_content") String content){
        JSONObject json = new JSONObject();
        Comment comment = new Comment();
        comment.setCommentId(cid);
        comment.setCommentTime(new Date());
        comment.setCommentContent(content);
        Integer rs = commentService.updateComment(comment);
        if(rs > 0) {
            json.put("code", 0);
            json.put("msg", "修改成功~");
        }else {
            json.put("code",200);
            json.put("msg", "修改失败~");
        }
        return json;
    }

    @ResponseBody
    @RequestMapping("deleteComemnt")
    public JSONObject deleteComment(@RequestParam("comment_id")long comment_id) {
        JSONObject json = new JSONObject();
        Integer rs = commentService.deleteComment(comment_id);
        if(rs > 0) {
            json.put("code", 0);
            json.put("msg", "删除成功~");
        }else {
            json.put("code", 200);
            json.put("msg", "删除失败~");
        }
        return json;
    }

}
