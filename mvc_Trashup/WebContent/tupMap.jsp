<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="common.*" %>
<%@ include file="common_header.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="topnav.jsp" %>

<div class="row">
  <div class="cardMap"> 
	  <div class="card cardLeft">
	  	  <div id="map" style="width:100%; height: 700px;"></div> 
		  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOvaqN07Wg9fs3WkA4EkcPYYy7hnEAIAM&callback=initMap&region=kr">
		  </script> 
	  	  <script src="./JS/mapMarkup.js"></script>
	   </div>
  </div>

  <div class="rightcolumn cardMapRight">
    <div class="card cardMapRight">
		<c:if test="${sName != null}">
			<h2>My Trash</h2>
	          <div class="fakeimg" style="height:20%; width:50%">
	      	  	<img src="<%=ROOT %>/img/뚱이침.jpg" style="border-radius:50%; width:100%; height:100%">
	      	  	
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
	          <div class="fakeimg" style="height:20%; width:50%">
	      	  </div>
	      	  <hr>
	      	  <h4>로그인이 필요합니다.</h4>
		</c:if>
      
      </div>
  </div>
</div>

<%@ include file="footer.jsp" %>

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
					<input type="hidden" name="pageChoose" value="1">
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