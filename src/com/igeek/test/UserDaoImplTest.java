package com.igeek.test;

import com.igeek.Impl.BaseDao;
import com.igeek.pojo.User;
import com.igeek.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

public class UserDaoImplTest extends BaseDao {
    //private UserDao userdao = new UserDaoImpl();

    @Test
    public void insertOne() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int i = this.update(conn, "insert into t_user values(?,?,?,?,?)", 1, "张三", "174545", "男", "1754225455");
            System.out.println("操作："+(i>0?true:false));
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }


    @Test
    public void queryUserByUsername() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            User user = querydForOne(User.class, conn, "select * from t_user where username = ?", "zcb");
            System.out.println(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }

    }

    @Test
    public void queryUserByUsernameAndPassword() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            User user = querydForOne(User.class, conn, "select * from t_user where username = ? and password = ?", "zcb",123456);
            System.out.println(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }


    @Test
    public void saveUser() {
        User user = new User("张三","654123","奥特曼","14755@qq.com","147554741");
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            int i = update(conn, "insert into t_user values(?,?,?,?,?,?)", user.getId(), user.getUsername(), user.getPassword(), user.getNickname(), user.getEmail(), user.getPhone());
            System.out.println("操作"+(i>0?true:false));
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }


    }
}