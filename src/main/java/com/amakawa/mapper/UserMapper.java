package com.amakawa.mapper;

import com.amakawa.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //根据用户名来找
    List<User> findUserByName(@Param("name") String name);
    //根据用户ID来找
    User findUserById(@Param("id") Long id);
    //插入一个用户
    Integer addUser(@Param("name") String name,@Param("pwd") String pwd,@Param("email") String email,@Param("portraint") String portraint);
    //查找全部用户
    List<User> findAllUser();
    //模糊查询用户
    List<User> findAllUserByKeyWord(@Param("keyword") String keyword);
    //更新用户信息
    Integer updateUser(User user);
}
