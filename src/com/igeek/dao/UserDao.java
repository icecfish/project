package com.igeek.dao;

import com.igeek.pojo.User;

import java.sql.Connection;
import java.util.List;

public interface UserDao {

    //根据用户名查用户信息
    User queryUserByUsername(Connection conn,String username);

    //根据用户名和密码查用户信息
    User queryUserByUsernameAndPassword(Connection conn,String username,String password);

    //保存用户
    int saveUser(Connection conn,User user);

    List<User> queryAllUser(Connection conn);
}
