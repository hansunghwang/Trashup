<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="com.trashup.mapper.*" %>

<% 

request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("pw");

//1. db연결
Connection conn = DB.getConnect();

//2. sql문 작성
String sql = "SELECT count(*) cnt FROM tup_member WHERE ID = ? and password = ?";

//3. sql문 실행
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1,id);
stmt.setString(2,password);
ResultSet rs = stmt.executeQuery();

//4. id중복검사 결과 값
rs.next();
out.print(rs.getString("cnt"));

%>