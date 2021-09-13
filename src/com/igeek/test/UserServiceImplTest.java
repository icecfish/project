package com.igeek.test;

import com.igeek.Impl.UserDaoImpl;
import com.igeek.dao.UserDao;
import com.igeek.pojo.User;
import com.igeek.service.UserService;
import com.igeek.service.UserServiceImpl;
import com.igeek.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.Assert.*;

public class UserServiceImplTest {
//    UserDao userDao = new UserDaoImpl();
    @Test
    public void registUser() {

    }

    @Test
    public void login() {
        Connection conn = null;

        try {
            conn = JDBCUtils.getConnectiondruid();
            UserService user = new UserServiceImpl();
            User login = user.login(conn, "zcb", "123456");
            System.out.println(login);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void existUsername() {
        Connection conn = null;

        try {
            conn = JDBCUtils.getConnectiondruid();
            UserService user = new UserServiceImpl();
            if (user.existUsername(conn,"zuoze66666")) {
                System.out.println("已存在");
            }else{

                System.out.println("不存在");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }
}