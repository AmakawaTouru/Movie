package com.amakawa.controller;

import com.alibaba.fastjson.JSONObject;
import com.amakawa.pojo.User;
import com.amakawa.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/logpgae")
    public String login(){
        return "login";
    }


    /**
     * 登录功能，返回json格式的内容。
     * @param user_name
     * @param user_pwd
     * @param request
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public JSONObject login(String user_name, String user_pwd, HttpServletRequest request){
        JSONObject json = new JSONObject();
        User user = userService.login(user_name, user_pwd);
        if( user != null ){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            //普通用户
            if(user.getUserLevel() == 0){
                json.put("msg", "usersuccess");
                json.put("data", user);
                return json;
            }else{
                //管理员
                json.put("msg", "adminsuccess");
                json.put("data", user);
                return json;
            }
        }
        json.put("msg", "fail");
        return json;
    }




    /**
     * 注册功能
     * @param user_name
     * @param user_pwd
     * @param user_email
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public JSONObject register(String user_name,String user_pwd,String user_email){
        List<User> users = userService.findUserByName(user_name);
        System.out.println(users);
        JSONObject json = new JSONObject();
        if(!users.isEmpty()){
            //如果列表里面不为空，说明已经注册过了。
            json.put("msg", "fail");
        }else{
            //如果为空，说明可以注册.
            Integer integer = userService.addUser(user_name, user_pwd, user_email);
            if(integer > 0){
                json.put("msg", "success");
            }else{
                json.put("msg","fail");
            }
        }
        return json;
    }


    /**
     * 退出登录
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "mainPage";
    }

    /**
     * 用于给后台管理系统显示所有用户
     * 使用通过PageInfo来传输。
     * @param page 分页，当前页数
     * @param limit 每页多少条数
     * @param keyword 搜索的关键字
     * @return
     */
    @RequestMapping("/findAllUser")
    @ResponseBody
    public JSONObject findAllUser(@RequestParam(value = "page",defaultValue = "1") Integer page,@RequestParam(value = "limit",defaultValue = "10") Integer limit, String keyword){
        JSONObject json = new JSONObject();
        PageInfo<User> pageInfo = userService.findAllUserBySplitPage(page, limit, keyword);
        json.put("code", 0);
        json.put("msg", "");
        json.put("count",pageInfo.getTotal());
        json.put("data", pageInfo.getList());
        return json;
    }

    /**
     * 通过like语句来进行模糊查询用户。
     * @param page
     * @param limit
     * @param user_name
     * @return
     */
    @RequestMapping("/findUserInfosByName")
    @ResponseBody
    public JSONObject findUserInfosByName(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                          @RequestParam(value = "limit",defaultValue = "10") Integer limit,
                                          @RequestParam("user_name") String user_name){
        JSONObject json = new JSONObject();
        PageHelper.startPage(page, limit);
        List<User> users = userService.findUserLikeName(user_name);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        json.put("code", 0);
        json.put("msg", "");
        json.put("count",pageInfo.getTotal());
        json.put("data", pageInfo.getList());
        return json;
    }

    /**
     * 编辑用户信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public JSONObject updateUser(User user){
        JSONObject json = new JSONObject();
        Integer rs = userService.updateUserInfo(user);
        if( rs > 0 ){
            json.put("msg", "success");
        }else{
            json.put("msg", "fail");
        }
        return json;
    }




}
