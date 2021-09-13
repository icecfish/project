package com.igeek.dao;

import com.igeek.pojo.Admin;

import java.sql.Connection;

public interface AdminDao {


    //根据用户名密码查询用户
    Admin queryadminByadnameAndPassword(Connection conn,String adname,String password);


}
