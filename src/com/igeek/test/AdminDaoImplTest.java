package com.igeek.test;

import com.igeek.Impl.BaseDao;
import com.igeek.pojo.Admin;
import com.igeek.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

public class AdminDaoImplTest extends BaseDao {

    @Test
    public void queryadminByadname() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Admin admin = querydForOne(Admin.class, conn, "select * from t_admin where adname = ?", "admin");
            System.out.println(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }

    @Test
    public void queryadminByadnameAndPassword() {
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnectiondruid();
            Admin admin = querydForOne(Admin.class, conn, "select * from t_admin where adname = ? and password = ?", "admin","admin");
            System.out.println(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.closeConnection(conn);
        }
    }
}