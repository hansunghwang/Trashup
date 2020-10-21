package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DB;
import dto.Board;
import dto.Notice;

public class FAQDao {
	
	Connection conn = DB.getConnect();
	
	
	public List<Notice> getFAQList(){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<Notice>();
		
		String sql = "select seqNum, title, content, id, to_char(mDate, 'yyyy\"년\"mm\"월\"dd\"일') mDate, "
					+ "to_char(wDate, 'yyyy\"년\"mm\"월\"dd\"일') wDate, cnt " 
					+ "from notice order by seqNum desc";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice();
				
				n.setSeqNum(rs.getInt("seqNum"));
				n.setTitle(rs.getString("title"));
				n.setContent(rs.getString("content"));
				n.setId(rs.getString("id"));
				n.setmDate(rs.getString("mDate"));
				n.setwDate(rs.getString("wDate"));
				n.setCnt(rs.getInt("cnt"));
				
				list.add(n);
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
		return list; 	
	}

	public Notice getFAQContent(String seqNum) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Notice n = null;
		
		String sql = "select seqNum, title, content, id, filePath, saveFile, uploadFile, "
				+ "to_char(mDate, 'yyyy\"년\"mm\"월\"dd\"일') mDate, " 
				+ "to_char(wDate, 'yyyy\"년\"mm\"월\"dd\"일') wDate, "
				+ "decode(isOpen, 'Y', '공개', 'N', '비공개') isOpen, cnt " 
				+ "from notice where seqNum = ? order by seqNum desc";
		
		try {
			stmt = conn.prepareStatement(sql);
			System.out.println(seqNum);
			stmt.setString(1, seqNum);
			rs = stmt.executeQuery();		
			if(rs.next()) {
				n = new Notice();
				n.setSeqNum(rs.getInt("seqNum"));
				n.setTitle(rs.getString("title"));
				n.setContent(rs.getString("content"));
				n.setId(rs.getString("id"));
				n.setmDate(rs.getString("mDate"));
				n.setwDate(rs.getString("wDate"));
				n.setIsOpen(rs.getString("isOpen"));
				n.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}
	
	public void delFAQCon(String seqNum) {
		PreparedStatement stmt = null;
		int rs = 0; 
		String sql = "delete from notice where seqNum = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqNum);
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

	}

	public void updateFAQ(Notice notice) {
		PreparedStatement stmt = null;
		int rs = 0;
		
		String sql = "update notice " + 
				"set title = ?, " + 
				"    content = ?, " + 
				"    isOpen = ?, " + 
				"    mDate = sysdate " + 
				"where seqNum = ?";	
		
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, notice.getTitle());
			stmt.setString(2, notice.getContent());
			stmt.setString(3, notice.getIsOpen());
			stmt.setInt(4, notice.getSeqNum());
			
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
	}
	
	
	public void insertFAQ(Notice notice) {
		
		PreparedStatement stmt = null;
		int rs = 0;
		
		String sql = "insert into notice (seqNum, title, content, id, isOpen, filePath, saveFile, uploadFile) " + 
					 "values (NOTICE_SEQNUM.nextval, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, notice.getTitle());
			stmt.setString(2, notice.getContent());
			stmt.setString(3, notice.getId());
			stmt.setString(4, notice.getIsOpen());
			
			
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
		
		
		
		
		
		
		
	}
}
