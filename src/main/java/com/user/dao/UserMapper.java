package com.user.dao;

import com.user.model.User;
import org.omg.CORBA.OBJ_ADAPTER;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    User getUserAccountAndPassword(Map<String, Object> param);

    User getUserInfoByAccount(Map<String, Object> param);

    void addUserInfo(User user);

    void addUserXueji(User user);

    Map<String, Object> getUserXuejiById(Map<String, Object> param);
}
