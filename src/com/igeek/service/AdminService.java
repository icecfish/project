package com.igeek.service;

import com.igeek.pojo.Admin;

import java.sql.Connection;

public interface AdminService {

    Admin login(Connection conn,String adname,String password);
}
