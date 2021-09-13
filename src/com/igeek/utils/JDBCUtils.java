package com.igeek.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {
//	//获得数据库连接
//	public static Connection getConnection() throws Exception {
//		InputStream is = ClassLoader.getSystemClassLoader().getResourceAsStream("jdbc.properties");
//
//		Properties pros = new Properties();
//		pros.load(is);
//
//		String user = pros.getProperty("user");
//		String url = pros.getProperty("url");
//		String password = pros.getProperty("password");
//		String driverClass = pros.getProperty("driverClass");
//
//		Class.forName(driverClass);
//
//		Connection conn = DriverManager.getConnection(url, user, password);
//
//		return conn;
//	}
	//关闭连接
	public static void closeConnection(Connection conn, PreparedStatement ps) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

//	//使用c3p0数据库连接池连接
//	private static ComboPooledDataSource cpds = new ComboPooledDataSource("helloc3p0");
//	public static Connection getConnection1() throws Exception {
//		Connection conn = cpds.getConnection();
//		return conn;
//	}

//关闭带结果集的数据库连接
	public static void closeConnection(Connection conn,PreparedStatement ps,ResultSet rs) {
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		try {
			if(ps!=null)
				ps.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	public static void closeConnection(Connection conn) {
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	/*
	 *
	 *使用druid数据连接池连接数据库
	 */
	private static DruidDataSource datesource;
	static {
		try {
			Properties pros = new Properties();
			InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
			pros.load(is);
			datesource = (DruidDataSource) DruidDataSourceFactory.createDataSource(pros);
		}catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	public static Connection getConnectiondruid() throws SQLException {
		Connection conn = datesource.getConnection();
		return conn;
	}
}
