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
			<c:forEach items="${list}" var="dto">
				<p>▣ 공지사항</p>
				<h3>${dto.title}</h3>
				<font style="float:right" color="grey">작성일: ${dto.wDate}</font>
				<hr>
				<div class="fakeimg">
					<img src="/filepath/${dto.saveFile}" class="imgCircle" alt="게시물<%=++num %>" width="100%" height="100%">
				</div>
				<p>${dto.content}</p>
				<hr>
				<a onclick="alert('좋아요')" class="likeButton" title="like"><img src="<%=ROOT %>/img/하트.png" width = "25" height="20"></a>
			</c:forEach>
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
					<input type="hidden" name="pageChoose" value="3">
					<c:forEach items="${list}" var="dto">
						<input type="hidden" name="seqNum" value="${dto.seqNum}">
					</c:forEach>
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
