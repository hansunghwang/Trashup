<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../header.jsp" %>

<%
int num= 0;
%>
</head>
<body>


<%@ include file="../menu.jsp" %>
<c:if test="${sessGrade == '1' || sessGrade == '2'}">
	<div id="noticeContents" class="noticePageStyle">
		<p class="notice">◎회원리스트</p>
		<br>
		<br>
		<br>
		<form name="memSearch" method="post" action="memList.do">
			<input type="radio" name="code" value="0" checked> 전체	
			<input type="radio" name="code" value="3" <c:if test="${radio == '3'}">checked</c:if>> 일반회원
			<input type="radio" name="code" value="2" <c:if test="${radio == '2'}">checked</c:if>> 운영자
			<input type="radio" name="code" value="1" <c:if test="${radio == '1'}">checked</c:if>> 관리자
			<c:if test="${keyword != null}">
	  			<input type="text" name="keyword" placeholder="이름을 입력하세요" value="${keyword}">
			</c:if>
			<c:if test="${keyword == null}">
	  			<input type="text" name="keyword" placeholder="이름을 입력하세요">
	  		</c:if>
	  		<input type="submit" value="검색">
		</form>
		<br>
		
		<c:choose>
			<c:when test="${fn:length(list) gt 0}">
				<font class="">인원수 ${fn:length(list)}명</font>
				
				<table border="1">
					<tr>
						<td class="smallLine">순번</td>
						<td class="third">ID</td>
						<td class="second">이름</td>
						<td class="smallLine">등급</td>
						<td class="second">가입일자</td>
						<td class="second">탈퇴요청일자</td>		
					</tr>			
			
					<c:forEach items="${list}" var="dto">
						<tr align="center" onClick="location.href='#?seqNum=#'" style="cursor:pointer">
						<td> <%=++num %></td>	
						<td>${dto.id } </td>
						<td>${dto.name} </td>
						<td>${dto.grade} </td>
						<td>${dto.rDate} </td>
						<td>${dto.delDate} </td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<br>
				<hr>
				<br>
				<font style="margin-left:50px">회원이 없습니다.</font><br>
			</c:otherwise>
		</c:choose>
	</div>	
			
	<%@ include file="../footer.jsp" %>
</c:if>

<%@ include file="../common/preAction.jsp" %>
</body>
</html>