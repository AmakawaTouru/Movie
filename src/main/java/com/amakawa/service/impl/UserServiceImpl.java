package com.amakawa.service.impl;

import com.amakawa.mapper.UserMapper;
import com.amakawa.pojo.User;
import com.amakawa.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录账户
     * @param name 账户
     * @param password 密码
     * @return 如果有对应用户，返回用户，没有返回null
     */
    @Override
    public User login(String name, String password) {
        List<User> users = userMapper.findUserByName(name);
        for(User user:users){
            if( user.getUserPassword().equals(password) ){
                return user;
            }
        }
        return null;
    }

    @Override
    public List<User> findUserByName(String name) {
        //直接返回。
        return userMapper.findUserByName(name);
    }

    /**
     * 注册用户
     * @param name
     * @param password
     * @param email
     * @return
     */
    @Override
    public Integer addUser(String name, String password, String email) {
        //头像的信息暂时随便填
        String portraint = "123";
        //返回添加用户信息。
        return userMapper.addUser(name, password, email, portraint);
    }

    /**
     * 使用分页返回用户
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<User> findAllUserBySplitPage(Integer page,Integer limit,String keyword) {
        PageHelper.startPage(page, limit);
        List<User> list = null;
        //如果keyword不为空，那么就要模糊查询用户
        if(keyword != null && !keyword.trim().equals("")){
            list = userMapper.findAllUserByKeyWord(keyword);
        }else{
            list = userMapper.findAllUser();
        }
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    /**
     * 事务更新用户信息
     * @param user
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public Integer updateUserInfo(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public List<User> findUserLikeName(String name) {
        return userMapper.findAllUserByKeyWord(name);
    }
}
