package com.trashup.mapper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trashup.domain.Member;
import com.trashup.domain.UploadFiles;

import oracle.jdbc.OracleTypes;


@Repository
public class MemberDaoImp implements MemberDao {
	
	Logger log = LoggerFactory.getLogger(MemberDaoImp.class);
	Connection conn = DB.getConnect();
	CallableStatement cstmt= null;
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "mapper.MemberMapper";
	
	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace+".getTime");
	}
	
	@Override
	public Member loginProc(Member member) {
		return sqlSession.selectOne(namespace+".loginProc", member);
	}
	
	@Override
	public int idDoubleCheck(String id) {
		
		PreparedStatement stmt = null;
		int val = 0;
		
		String sql = "SELECT count(*) as cnt FROM tup_member WHERE id = ?";
		
		try {
			stmt = conn.prepareStatement(sql);
		
			stmt.setString(1, id);
			ResultSet  rs = stmt.executeQuery();
			rs.next();
			
			
			val = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return val;
	}		
	
	
	//회원 등록
	@Override
	public void insertMember(Member m) {
		String sql = "{call insertMember(?, ?, ?, ?)}";	
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, m.getId());
			cstmt.setString(2, m.getPw());
			cstmt.setString(3, m.getName());
			cstmt.setString(4, m.getNickname());			
			cstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
//				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}						
	}
	
	//로그인
	public Map<String, String> loginMember(String id, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		ResultSet rs = null;
		
		String sql = "{call loginMember(?, ?)}"; 
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();	
			
			rs = (ResultSet) cstmt.getObject(2);
			
			if(rs.next()) {
				//패스워드 비교
				if(pw.equals(rs.getString("password"))){
					map.put("login", "ok");
					map.put("name", rs.getString("name"));
					map.put("nickname", rs.getString("nickname"));
					map.put("grade", rs.getString("grade"));
					map.put("thumbnail", rs.getString("thumbnail"));
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
				if(rs != null) rs.close();
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}				
		return map;		
	}

	public int updateMember(Member m) {
		int rs = 0;
		
		String sql = "{call updateMember(?, ?, ?, ?)}";
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, m.getId());
			cstmt.setString(2, m.getName());
			cstmt.setString(3, m.getNickname());
			cstmt.setNString(4, m.getPw());
			rs = cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return rs;
		
	}

	public void deleteMember(String id) {
		
		String sql = "{call deleteMember(?)}";
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		
	}

	public String getMyProfile(String id) {
		String thumbnail = null;
		
		String sql = "{call getMyProfile(? ,?)}";
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, OracleTypes.VARCHAR);
			cstmt.executeQuery();
			
			thumbnail = cstmt.getString(2);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return thumbnail;
		
	}

	public void insertProfile(String id, UploadFiles uf, String fileCheck, String delCheck, String oldFileCheck) {
		ResultSet rs = null;
		String sql;
		try {
			if(oldFileCheck.equals("fileYes")) {
				if(fileCheck != null) {
					
					System.out.println("업로드파일: " + uf.getUploadFile());
					System.out.println("세이브파일: " + uf.getSaveFile());
					System.out.println("세이브패스: " + uf.getSavePath());
					System.out.println("파일사이즈: " + uf.getFileSize());
					System.out.println("파일타입: " + uf.getFileType());
					System.out.println("썸네일: " + uf.getThumbnail());
					System.out.println("넘어오는 아이디: " + id);
					
					sql = "{call updateThumbnail(?, ?, ?, ?, ?, ?, ?, ?)}";
					
					cstmt = conn.prepareCall(sql);
					
					cstmt.setString(1, uf.getUploadFile());
					cstmt.setString(2, uf.getSaveFile());
					cstmt.setString(3, uf.getSavePath());
					cstmt.setInt(4, uf.getFileSize());
					cstmt.setString(5, uf.getFileType());
					cstmt.setString(6, uf.getThumbnail());
					cstmt.setString(7, id);
					cstmt.setString(8, "3");
					
					cstmt.executeUpdate();
					
				} else {
					if (delCheck.equals("imgNo")) {
						sql = "{call deleteThumbnail(?, ?)}";		
						cstmt = conn.prepareCall(sql);
						cstmt.setString(1, id);
						cstmt.setString(2, "3");
						cstmt.executeUpdate();
					}
				}
			} else {
				if (fileCheck != null) {
					sql = "SELECT FILES_SEQNUM.NEXTVAL AS seqNum FROM dual";
					
					rs = conn.prepareStatement(sql).executeQuery();
					rs.next();
					String seqNum = rs.getString("seqNum");
					
					
					sql = "{call insertFiles(?, ?, ? ,? ,? ,? ,?, ?, ?, ?)}";
					
					cstmt = conn.prepareCall(sql);
					
					cstmt.setInt(1, 0);
					cstmt.setString(2, uf.getUploadFile());
					cstmt.setString(3, uf.getSaveFile());
					cstmt.setString(4, uf.getSavePath());
					cstmt.setInt(5, uf.getFileSize());
					cstmt.setString(6, uf.getFileType());
					cstmt.setString(7, uf.getThumbnail());
					cstmt.setString(8, "3");
					cstmt.setInt(9, Integer.valueOf(seqNum));
					cstmt.setString(10, id);
					
					cstmt.executeUpdate();
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)  rs.close();
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	

	
}
