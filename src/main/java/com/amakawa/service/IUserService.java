package com.amakawa.service;

import com.amakawa.pojo.User;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IUserService {
    User login(String name,String password);
    Integer addUser(String name,String password,String email);
    List<User> findUserByName(String name);
    List<User> findUserLikeName(String name);
    PageInfo<User> findAllUserBySplitPage(Integer page, Integer limit, String keyword);
    Integer updateUserInfo(User user);
}
