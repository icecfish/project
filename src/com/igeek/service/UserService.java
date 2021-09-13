package com.igeek.service;

import com.igeek.pojo.User;

import java.sql.Connection;
import java.util.List;

public interface UserService {

    void registUser(Connection conn, User user);
    User login(Connection conn, String username,String password);

    boolean existUsername(Connection conn, String username);

    List<User> getAllUser(Connection conn);
}
