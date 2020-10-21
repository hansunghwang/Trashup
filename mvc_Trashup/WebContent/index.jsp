<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="common_header.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="topnav.jsp" %>

<%
int num =0;
%>

<div class="row">
  <div class="leftcolumn"> 
  	
  
	<c:choose>
		<c:when test="${fn:length(list) gt 0}">
			<c:forEach items="${list}" var="dto">
				<div class="card cardLeft">
				      <h3>${dto.title}</h3>
				      <font style="float:right" color="grey">작성일: ${dto.wDate}</font><br>
				      <hr>
				     <div class="fakeimg">
					<c:if test="${dto.saveFile != null}">
					      <img src="<%=ROOT %>/fileUpload/${dto.saveFile}" class="imgCircle" alt="게시물<%=++num %>" width="100%" height="100%">
					</c:if>
					 </div>
				 		  <p>${dto.category}</p>
				          <p>${dto.content}</p>
				          <hr>
					      <a onclick="alert('좋아요')" class="likeButton" title="like"><img src="<%=ROOT %>/img/하트.png" width = "25" height="20"></a>
				    </div>
			   
			</c:forEach>
		</c:when>
		<c:otherwise>

		  	<div class="card cardLeft">
		  	게시물이 없습니다.
		  	</div>
	  	</c:otherwise>
	 </c:choose>
   </div>

  <div class="rightcolumn">
    <div class="card rightCard">
		<c:if test="${sName != null}">
			<h2>My Trash</h2>
	          <div class="fakeimg">
	      	  	<img src="<%=ROOT %>/img/뚱이침.jpg" style="border-radius:50%; width:80%; height:100%">
	      	  	
	      	  </div>
	      	  <br>
	      	  <hr>
	      	  <p><b>${sNickname}</b> 님의 새 메시지</p>
		      <p>서울시 서초구 *** 에 있는 쓰레기가 아직 수거가 안됐어요!</p>
		      <p>서울시 서대문구 *** 에 있는 쓰...</p>
		      <p>서울시 마포구 *** 에 있는 쓰레...</p>
		      <p>서울시 중구 *** 에 있는 쓰레기...</p>
		</c:if>
		<c:if test="${sName == null}">
		  <h2>My Trash</h2>
	          <div class="fakeimg" >
	      	  </div>
	      	  <hr>
	      	  <h4>로그인이 필요합니다.</h4>
		</c:if>     
    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>


<!-- 레이어팝업, 모달창 -->
<form class="loginForm" name="memLogin" method="post" action="loginProc.do${resMsg}" onsubmit="return pwCheck()">
	<div class="modal" id="login">
		<div class="modal-dialog">
			<div class="container">
				<a href="javascript:history.back();" class="close-modal">close</a>
				<div class="loginCon">
					<h2 >로그인</h2>
					<input type="text" name="id" maxlength="20" size="20" placeholder="아이디(이메일 형식)" required><br>
					<input type="password" name="pw" maxlength="20" size="20" placeholder="비밀번호 입력" required>
					<input type="submit" value="로그인">
					<input type="hidden" name="pageChoose" value="0">
				</div>
			</div>
		</div>
	</div>
</form>


<div class="modal" id="msgPop">
	<div class="modal-dialog">
		<div class="container">
			<a href="home.do" class="close-modal">close</a>
			<div class="loginCon">
			<p>회원가입이 완료되었습니다!</p>
			<button type="button" onclick="location.href='home.do'"> 홈으로</button>
			<button type="button" onclick="location.href='home.do#login'"> 로그인</button>
			</div>
		</div>
	</div>
</div>

<div> 
	<form name="mode">
		<input type="hidden" name="preView" value="<c:out value="${preView}"/>">
		<input type="hidden" name="stateRes" value="<c:out value="${stateRes}"/>">
	</form>
</div>

<script src="JS/w3js.js"></script>

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
