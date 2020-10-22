<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

<%
int num =0;
%>
<div class="row">
	<div class="leftcolumn"> 
		<div class="card cardLeft"> 	
			<p class="notice">▣ 도움말</p>
			<br>
			<br>
			<c:choose>
				<c:when test="${fn:length(list) gt 0}">
					<font class="noticeCount">총 ${fn:length(list)} 건</font>
					
					<table border="1" style="margin-left:5%">
						<tr>
							<td class="smallLine">순번</td>
							<td class="third">제목</td>
							<td class="second">작성자</td>
							<td class="second">작성일자</td>
						</tr>			
				
						<c:forEach items="${list}" var="dto">
							<tr align="center" onClick="location.href='helpCon.he?seqNum=${dto.seqNum}'" style="cursor:pointer">
							<td> <%=++num %></td>	
							<td>
								<c:choose>
									<c:when test="${fn:length(dto.title) gt 16}">
									<c:out value="${fn:substring(dto.title, 0, 15)}">...
									</c:out></c:when>
									<c:otherwise>
										<c:out value="${dto.title}"></c:out>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.nickName}</td>
							<td>${dto.wDate} </td>
							</tr>
						</c:forEach>
					</table>
					<br>
					<br>
				</c:when>
				<c:otherwise>
					<br>
					<hr>
					<br>
					<font style="margin-left:50px">등록된 도움말이 없습니다.</font><br>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

<%@ include file="../common/myMessage.jsp" %>

</div>

<%@ include file="../footer.jsp" %>

<!-- 레이어팝업, 모달창 -->
<form class="loginForm" name="memLogin" method="post" action="loginProc.do" onsubmit="return pwCheck()">
	<div class="modal" id="login">
		<div class="modal-dialog">
			<div class="container">
				<a href="javascript:history.back();" class="close-modal">close</a>
				<div class="loginCon">
				<h2 >로그인</h2>
					<input type="text" name="id" maxlength="20" size="20" placeholder="아이디(이메일 형식)" required><br>
					<input type="password" name="pw" maxlength="20" size="20" placeholder="비밀번호 입력" required>
					<input type="submit" value="로그인">
					<input type="hidden" name="pageChoose" value="2">
				</div>
			</div>
		</div>
	</div>
</form>

<div> 
	<form name="mode">
		<input type="hidden" name="preView" value="<c:out value="${preView}"/>">
		<input type="hidden" name="stateRes" value="<c:out value="${stateRes}"/>">
	</form>
</div>

<script src="/js/w3js.js"></script>

<script type="text/javascript">

window.onload = function(){
	var preView = document.forms["mode"]["preView"].value;
	var stateRes = document.forms["mode"]["stateRes"].value;
	
	if(preView == "login" && stateRes == "pwFail") {
		alert('회원정보를 확인해 주세요');
		history.back();
	} else if( preView == "login" && stateRes == "fail") {
		alert('존재하지 않는 회원입니다.');
		history.back();
	}
}

</script>

</body>
</html>
