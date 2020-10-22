package com.trashup.www;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class jdbcTest {
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:db";
	private static final String user = "rty10203";
	private static final String pw = "0114";
	
	@Test
	public void getConnect() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("jdbc 연결 성공");
		}catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		}catch (SQLException e) {
			System.out.println("Oracle 연결 실패");
		}
		
	}		
}
