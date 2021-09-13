package com.igeek.Impl;

import com.igeek.dao.AdminDao;
import com.igeek.pojo.Admin;

import java.sql.Connection;

public class AdminDaoImpl extends BaseDao implements AdminDao {


    @Override
    public Admin queryadminByadnameAndPassword(Connection conn, String adname, String password) {
        String sql = "select * from t_admin where adname = ? and password = ?";
        Admin admin = querydForOne(Admin.class, conn, sql, adname, password);
        return admin;
    }
}
