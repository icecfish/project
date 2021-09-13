package com.igeek.service;

import com.igeek.Impl.AdminDaoImpl;
import com.igeek.dao.AdminDao;
import com.igeek.pojo.Admin;

import java.sql.Connection;

public class AdminServiceImpl implements AdminService{
    AdminDao adminDao = new AdminDaoImpl();

    @Override
    public Admin login(Connection conn, String adname,String password) {
        Admin admin = adminDao.queryadminByadnameAndPassword(conn, adname, password);
        return admin;
    }


}
