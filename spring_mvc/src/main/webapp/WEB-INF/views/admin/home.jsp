<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="header.jsp" %>


</head>
<body class="loginPageBody">
<div class="loginBox">
	<form class="formSet" name="adminLogin" method="post" action="loginProc.do">
			<h2>관리 시스템</h2>
			<input class="boxSize interBox" type="text" name="id" maxlength="20" size="15" placeholder="관리자 아이디 입력" required><br>
			<input class="boxSize" type="password" name="pw" maxlength="20" size="15" placeholder="관리자 비밀번호 입력" required>
			<br>
			
			<input type="submit" class="loginButton" value="로그인">
		<br>		
	</form>
</div>

<div> 
	<form name="mode">
		<input type="hidden" name="preView" value="<c:out value="${preView}"/>">
		<input type="hidden" name="stateRes" value="<c:out value="${stateRes}"/>">
	</form>
</div>

<script type="text/javascript">

window.onload = function(){
	var preView = document.forms["mode"]["preView"].value;
	var stateRes = document.forms["mode"]["stateRes"].value;
	
	if(preView == "login" && stateRes == "pwFail") {
		alert('입력정보를 확인해 주세요');
		history.back();
	} else if( preView == "login" && stateRes == "fail") {
		alert('존재하지 않는 정보입니다');
		history.back();
	} 
}

</script>

</body>
</html>