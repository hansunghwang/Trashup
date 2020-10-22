package com.trashup.mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@192.168.10.148:1521:trashup";
	private static final String user = "rty10203";
	private static final String pw = "0114";
	
//	private static final String driver = "com.mysql.jdbc.Driver";
//	private static final String url = "jdbc:mysql://192.168.10.148:1521:trashup?useSSL=false";
//	private static final String user = "master";
//	private static final String pw = "2222";
	
	public static Connection getConnect() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
		}catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		}catch (SQLException e) {
			System.out.println("Oracle 연결 실패");
		}
		
		return conn;
	}
	

}
