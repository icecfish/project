package com.igeek.service;

import com.igeek.Impl.UserDaoImpl;
import com.igeek.dao.UserDao;
import com.igeek.pojo.User;

import java.sql.Connection;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();
    @Override
    public void registUser(Connection conn,User user) {
        userDao.saveUser(conn, user);
    }


    @Override
    public User login(Connection conn,String username,String password) {
            User user1 = userDao.queryUserByUsernameAndPassword(conn,username,password);
            return user1;
    }

    @Override
    public boolean existUsername(Connection conn,String username) {
            if (userDao.queryUserByUsername(conn, username) == null) {
                return false;
            }
            return true;
        }

    @Override
    public List<User> getAllUser(Connection conn) {
        return userDao.queryAllUser(conn);
    }
}
