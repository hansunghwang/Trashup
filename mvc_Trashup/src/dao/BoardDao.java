package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DB;
import dto.Board;
import dto.UploadFiles;

public class BoardDao {
	
	Connection conn = DB.getConnect();
	
	
	public List<Board> getBoardList(){
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		
		String sql = "SELECT seqNum, title, content, id, "
					+ "(SELECT savePath FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) savePath, "
					+ "(SELECT saveFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) saveFile,  "
					+ "(SELECT uploadFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) uploadFile,  "
					+ "to_char(mDate, 'yyyy\"년\"mm\"월\"dd\"일') mDate, " 
					+ "to_char(wDate, 'yyyy\"년\"mm\"월\"dd\"일') wDate, isOpen, cnt, category " 
					+ "FROM tup_board tb "
					+ "WHERE isOpen = 'Y' AND isDel = 'N' "
					+ "ORDER BY seqNum DESC";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
									
			
			while(rs.next()) {
				Board b = new Board();
				
				b.setSeqNum(rs.getInt("seqNum"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setSavePath(rs.getString("savePath"));
				b.setSaveFile(rs.getString("saveFile"));
				b.setUploadFile(rs.getString("uploadFile"));
				b.setmDate(rs.getString("mDate"));
				b.setwDate(rs.getString("wDate"));
				b.setIsOpen(rs.getString("isOpen"));
				b.setCnt(rs.getInt("cnt"));
				
				String category = "";
				
				if(rs.getString("category").equals("Y")) {
				sql = "SELECT " + 
						"    (SELECT codename FROM code c WHERE c.category = 'trash_sort' AND t.code = c.code) codeName " + 
						"FROM tup_tag t " + 
						"WHERE t.board_seqNum = ?";
				
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, rs.getInt("seqNum"));
					ResultSet rs2 = stmt.executeQuery();
					
					while(rs2.next()) {
						category += "#" + rs2.getString("codeName") + " ";
					}	
				}
				
				b.setCategory(category);
				list.add(b);
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
		return list; 
				
	}
	
	public Board getBoardContent(String seqNum){
		
			
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT seqNum, title, content, id, "
				+ "(SELECT savePath FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) savePath, "
				+ "(SELECT saveFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) saveFile,  "
				+ "(SELECT uploadFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) uploadFile,  "
				+ "to_char(mDate, 'yyyy\"년\"mm\"월\"dd\"일') mDate, " 
				+ "to_char(wDate, 'yyyy\"년\"mm\"월\"dd\"일') wDate, category, isOpen, cnt " 
				+ "FROM tup_board tb "
				+ "WHERE seqNum = ?  "
				+ "ORDER BY seqNum DESC";
		
		Board b = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqNum);				
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				b = new Board();	
				b.setSeqNum(rs.getInt("seqNum"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setSavePath(rs.getString("savePath"));
				b.setSaveFile(rs.getString("saveFile"));
				b.setUploadFile(rs.getString("uploadFile"));
				b.setmDate(rs.getString("mDate"));
				b.setwDate(rs.getString("wDate"));
				b.setCategory(rs.getString("category"));
				b.setIsOpen(rs.getString("isOpen"));
				b.setCnt(rs.getInt("cnt"));			
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
			
			return b;	
	}
	
	public void delBoardCon(String seqNum) {
		PreparedStatement stmt = null;
		int rs = 0; 
		String sql = "DELETE FROM tup_board WHERE seqNum = ?";
		
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqNum);
			rs = stmt.executeUpdate();
			System.out.println("삭제할 게시물: " + seqNum);
			
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


	public void insertBoard(Board b, UploadFiles uf, int cnt) {
		
		System.out.println("dao로 넘어온 값: " + b.getId());
		
		PreparedStatement stmt = null;
		
		String sql = "SELECT BOARD_SEQNUM.NEXTVAL AS seqNum FROM dual";
				
		
		try {
			// seqNum 가져오기
			ResultSet rs = conn.prepareStatement(sql).executeQuery();
			 rs.next();
			 String seqNum = rs.getString("seqNum");
			
			// 게시물 insert
			sql = "INSERT INTO tup_board (seqNum, title, content, isOpen, id, category) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(seqNum));
			stmt.setString(2, b.getTitle());
			stmt.setString(3, b.getContent());
			stmt.setString(4, b.getIsOpen());
			stmt.setString(5, b.getId());
			
			if(cnt > 0) {
				stmt.setString(6, "Y");
			} else {
				stmt.setString(6, "N");
			}
			
			
			stmt.executeUpdate();
			
			if (cnt > 0) { 			
				String str = b.getCategory();
				String[] category = str.split("#");			
				System.out.println(str);
	
				for(int i = 0; i < cnt; i++) {		
				sql = "INSERT INTO tup_tag (seqNum, board_seqNum, code) "
					+ "VALUES (tag_seqNum.NEXTVAL, ?, ?)";			
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, Integer.parseInt(seqNum));
				stmt.setString(2, category[i]);
						
				stmt.executeUpdate();
				}			
			}
			
			if(uf.getSaveFile() != null) {
				// 파일 insert
				sql = "INSERT INTO files (seqNum,, category, ref_seqNum, uploadFile, saveFile, savePath, fileSize, fileType, thumbnail) "
					+ "VALUES (files_seqNum.NEXTVAL, 'board', ?, ? ,? ,? ,? ,?, ?)";
				
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, Integer.parseInt(seqNum));
				stmt.setString(2, uf.getUploadFile());
				stmt.setString(3, uf.getSaveFile());
				stmt.setString(4, uf.getSavePath());
				stmt.setInt(5, uf.getFileSize());
				stmt.setString(6, uf.getFileType());
				stmt.setString(7, uf.getThumbnail());
			
				stmt.executeUpdate();
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
		
	}

	
	public List<Board> searchBoard(String keyword) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		System.out.println(keyword);
		
		String sql = "SELECT seqNum, title, content, id, "
					+ "(SELECT savePath FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) savePath, "
					+ "(SELECT saveFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) saveFile,  "
					+ "(SELECT uploadFile FROM files f WHERE category = 'board' AND f.ref_seqNum = tb.seqNum) uploadFile,  "
					+ "to_char(mDate, 'yyyy\"년\"mm\"월\"dd\"일') mDate, " 
					+ "to_char(wDate, 'yyyy\"년\"mm\"월\"dd\"일') wDate, isOpen, cnt, category " 
					+ "FROM tup_board tb "
					+ "WHERE isOpen = 'Y' AND isDel = 'N' AND title like  '%' || ? || '%' "
					+ "ORDER BY seqNum DESC";
		
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, keyword);
			
			rs = stmt.executeQuery();
									
			
			while(rs.next()) {
				Board b = new Board();
				
				b.setSeqNum(rs.getInt("seqNum"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setSavePath(rs.getString("savePath"));
				b.setSaveFile(rs.getString("saveFile"));
				b.setUploadFile(rs.getString("uploadFile"));
				b.setmDate(rs.getString("mDate"));
				b.setwDate(rs.getString("wDate"));
				b.setIsOpen(rs.getString("isOpen"));
				b.setCnt(rs.getInt("cnt"));
				
				String category = "";
				
				if(rs.getString("category").equals("Y")) {
				sql = "SELECT " + 
						"    (SELECT codename FROM code c WHERE c.category = 'trash_sort' AND t.code = c.code) codeName " + 
						"FROM tup_tag t " + 
						"WHERE t.board_seqNum = ?";
				
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, rs.getInt("seqNum"));
					ResultSet rs2 = stmt.executeQuery();
					
					while(rs2.next()) {
						category += "#" + rs2.getString("codeName") + " ";
					}	
				}
				
				b.setCategory(category);
				list.add(b);
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
		return list; 
		
	}

	
}
