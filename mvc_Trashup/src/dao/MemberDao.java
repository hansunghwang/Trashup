package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import common.DB;
import common.LogPreparedStatement;
import dto.Member;

public class MemberDao {
	
	Connection conn = DB.getConnect();
	PreparedStatement stmt = null;
	
	
	//회원 등록
	public int insertMember(Member m) {		
		int rs = 0;			
		String sql = "INSERT INTO tup_member(id, password, name, nickname)"
					+ "	VALUES (?, ?, ?, ?)";		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m.getId());
			stmt.setString(2, m.getPassword());
			stmt.setString(3, m.getName());
			stmt.setString(4, m.getNickname());			
			rs = stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return rs;					
	}
	
	//로그인
	public Map<String, String> loginMember(String id, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		
		String sql = "SELECT * FROM tup_member where id = ?";
		
		try {
			LogPreparedStatement stmt = new LogPreparedStatement(conn, sql); 	//sql문을 출력해주기 위해서 사용
			stmt.setString(1, id);		
			ResultSet rs = stmt.executeQuery();	
			
			if(rs.next()) {
				//패스워드 비교
				if(pw.equals(rs.getString("password"))){
					map.put("login", "ok");
					map.put("name", rs.getString("name"));
					map.put("nickname", rs.getString("nickname"));
					map.put("admin", rs.getString("admin"));
				} else {
					map.put("login", "pwFail");
				}
			} else {
				map.put("login", "fail");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}				
		return map;		
	}
	

}
