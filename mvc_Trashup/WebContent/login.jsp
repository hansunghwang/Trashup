<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Info</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
	//아이디
	String id = request.getParameter("email");
	
	//비밀번호
	String pw = request.getParameter("pw");

	out.print("로그인 정보" + "<br>");
	out.print("ID : " + id + "<br>");
	out.print("PW : " + pw);
	
	
	%>

</body>
</html>