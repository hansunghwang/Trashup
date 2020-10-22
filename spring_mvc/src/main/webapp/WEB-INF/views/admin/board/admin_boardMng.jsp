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
	<div id="admin_boardContents" class="noticePageStyle">
		<p class="notice">▣ 게시물 관리</p>
		<br>
		<br>
		
		<c:choose>
			<c:when test="${fn:length(list) gt 0}">
				<font class="noticeCnt">총 ${fn:length(list)} 건</font>
				
				<table border="1">
					<tr>
						<td class="smallLine">순번</td>
						<td class="third">제목</td>
						<td class="second">작성자</td>
						<td class="second">작성일자</td>
						<td class="smallLine">조회수</td>		
					</tr>			
			
					<c:forEach items="${list}" var="dto">
						<tr align="center" onClick="location.href='boardCon.bo?seqNum=${dto.seqNum}'" style="cursor:pointer">
						<td class='firstLine'> <%=++num %></td>	
						<td class='second'>
							<c:choose>
								<c:when test="${fn:length(dto.title) gt 16}">
								<c:out value="${fn:substring(dto.title, 0, 15)}">...
								</c:out></c:when>
								<c:otherwise>
									<c:out value="${dto.title}"></c:out>
								</c:otherwise>
							</c:choose>
						</td>
						<td class='third'>${dto.id} </td>
						<td class='third'>${dto.wDate} </td>
						<td class='lastLine'>${dto.cnt} </td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<br>
				<hr>
				<br>
				<font style="margin-left:50px">등록된 게시물이 없습니다.</font><br>
			</c:otherwise>
		</c:choose>
	</div>		
	<%@ include file="../footer.jsp" %>
</c:if>

<%@ include file="../common/preAction.jsp" %>

</body>
</html>