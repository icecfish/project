package com.igeek.Impl;

import com.igeek.dao.UserDao;
import com.igeek.pojo.User;

import java.sql.Connection;
import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {

    @Override
    public User queryUserByUsername(Connection conn, String username) {
        String sql = "select * from t_user where username = ?";
        User user = querydForOne(User.class, conn, sql, username);
        return user;
    }

    @Override
    public User queryUserByUsernameAndPassword(Connection conn, String username, String password) {
        String sql = "select * from t_user where username = ? and password = ?";
        User user = querydForOne(User.class, conn, sql, username, password);
        return user;
    }

    @Override
    public int saveUser(Connection conn, User user) {
        String sql = "insert into t_user(username,`password`,nickname,email,phone) values(?,?,?,?,?)";
        int i = update(conn, sql,user.getUsername(),user.getPassword(),user.getNickname(),user.getEmail(),user.getPhone());
        return i;
    }

    @Override
    public List<User> queryAllUser(Connection conn) {
        String sql="select * from t_user";
        return queryForList(User.class,conn,sql);
    }

}
