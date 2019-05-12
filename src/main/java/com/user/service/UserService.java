package com.user.service;

import com.user.dao.UserMapper;
import com.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserAccountAndPassword(Map<String, Object> param) {
        return userMapper.getUserAccountAndPassword(param);
    }

    public User getUserInfoByAccount(Map<String, Object> param) {
        return userMapper.getUserInfoByAccount(param);
    }

    public void addUserInfo(User user) {
        userMapper.addUserInfo(user);
    }

    public void addUserXueji(User user) {
        userMapper.addUserXueji(user);
    }

    public Map<String,Object> getUserXuejiById(Map<String, Object> param) {
        return userMapper.getUserXuejiById(param);
    }
}
