<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>

</head>
<body>
<%@ include file="menu.jsp" %>
<c:if test="${sessGrade == '1' || sessGrade == '2'}">
	<p>회원 등록 건수: ${regCnt}</p>
	<p>회원탈퇴요청 건수: ${delCnt}</p>

	<%@ include file="footer.jsp" %>

</c:if>
</body>
</html>