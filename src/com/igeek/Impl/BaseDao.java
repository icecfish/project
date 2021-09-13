package com.igeek.Impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

//提供适用于任何任何类的CRUD
public abstract class BaseDao {
	//查询某个值
	public <E> E getValue(Connection conn,String sql,Object...args){
		E e = null;
		try {

			e = (E)new QueryRunner().query(conn, sql, new ScalarHandler(), args);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return e;
	}
	/*
	增删改操作
	返回值为影响的行数
	 */
	public int update(Connection conn, String sql, Object... args) {
		int count=0;
		try {

			count = new QueryRunner().update(conn, sql, args);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return count;
	}
	/*
	查询多个对象
	返回值为查询到的集合
	 */
	public <T> List<T> queryForList(Class<T> clazz, Connection conn, String sql, Object...args){
		List<T> list=null;
		try {
			BeanListHandler<T> handler = new BeanListHandler<>(clazz);
			list = new QueryRunner().query(conn, sql, handler, args);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return list;
	}
	/*
	查询单个对象
	返回值为查询到的对象
	 */
	public <T> T querydForOne(Class<T> clazz, Connection conn, String sql, Object...args){
		T t=null;
		try {
			BeanHandler<T> handler = new BeanHandler<>(clazz);
			t = new QueryRunner().query(conn, sql, handler, args);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return t;
	}

//	public int update(Connection conn, String sql, Object... args) {
//		PreparedStatement ps = null;
//		try {
//			ps = conn.prepareStatement(sql);
//			for (int i = 0; i < args.length; i++) {
//				ps.setObject(i + 1, args[i]);
//			}
//			return ps.executeUpdate();
//		} catch (Exception e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		} finally {
//			JDBCUtils.closeConnection(null, ps);
//		}
//		return 0;
//	}
////单条查询
//	public <T> T getInstance(Connection conn, Class<T> clazz, String sql, Object... args) {
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		try {
//			ps = conn.prepareStatement(sql);
//			for (int i = 0; i < args.length; i++) {
//				ps.setObject(i + 1, args[i]);
//			}
//			rs = ps.executeQuery();
//			// 获取结果的元数据:ResuLtSetMetaData
//			ResultSetMetaData rsmd = rs.getMetaData();
//			// 通过ResultSetMetaData获取结果集中的列数
//			int columnCount = rsmd.getColumnCount();
//			if (rs.next()) {
//				T t = clazz.newInstance();
//				for (int i = 0; i < columnCount; i++) {
//					// 获取列值
//					Object columnValue = rs.getObject(i + 1);
//
//					// 获取每个列的列名
//					String columnLabel = rsmd.getColumnLabel(i + 1);
//
//					// 给t对象指定的columnName属性，赋值为columnValue，通过反射
//					Field field = clazz.getDeclaredField(columnLabel);
//					field.setAccessible(true);
//					field.set(t, columnValue);
//				}
//				return t;
//			}
//		} catch (Exception e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		} finally {
//			JDBCUtils.closeConnection(null, ps, rs);
//		}
//		return null;
//
//	}
//	//多条查询
//	public <T> List<T> getForList(Connection conn, Class<T> clazz, String sql, Object... args) {
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		List<T> obj = new ArrayList<>();
//		try {
//			ps = conn.prepareStatement(sql);
//			for (int i = 0; i < args.length; i++) {
//				ps.setObject(i + 1, args[i]);
//			}
//			rs = ps.executeQuery();
//			// 获取结果的元数据:ResuLtSetMetaData
//			ResultSetMetaData rsmd = rs.getMetaData();
//			// 通过ResultSetMetaData获取结果集中的列数
//			int columnCount = rsmd.getColumnCount();
//			while (rs.next()) {
//				T t = clazz.newInstance();
//				for (int i = 0; i < columnCount; i++) {
//					// 获取列值
//					Object columnValue = rs.getObject(i + 1);
//
//					// 获取每个列的列名
//					String columnLabel = rsmd.getColumnLabel(i + 1);
//
//					// 给t对象指定的columnName属性，赋值为columnValue，通过反射
//					Field field = clazz.getDeclaredField(columnLabel);
//					field.setAccessible(true);
//					field.set(t, columnValue);
//				}
//				obj.add(t);
//			}
//			return obj;
//		} catch (Exception e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		} finally {
//			JDBCUtils.closeConnection(null, ps, rs);
//		}
//		return null;
//
//	}
//	//用于查询特殊值的方法
//	public <E> E getValue(Connection conn,String sql,Object...args) {
//		PreparedStatement ps=null;
//		ResultSet rs=null;
//		try {
//			ps = conn.prepareStatement(sql);
//			for(int i =0;i<args.length;i++) {
//				ps.setObject(i+1,args[i]);
//			}
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				return (E) (rs.getObject(1));
//			}
//		} catch (SQLException e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		}finally {
//			JDBCUtils.closeConnection(null, ps, rs);
//		}
//		return null;
//	}
}
