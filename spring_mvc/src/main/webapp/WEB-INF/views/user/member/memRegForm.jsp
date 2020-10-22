<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

<div class="row">
  <div class="card cardReg">	
		<h2 class="h1Reg">회원가입</h2>
		<form class="formSet" name="memReg" method="post" action="/member/memRegProc#msgPop" onsubmit="return formCheck()">
			<div id="memRegInput">
				<input type="text" name="id" maxlength="20" size="20" placeholder="이메일 계정" onchange="idDoubleCheck()" required>
				<span id="idCheckRes" style="font-size:10px; color:red"></span>
				
				<input type="hidden" name="isIdCheck" id="isIdCheck" value="0"><br>			
			
				<input type="password" name="pw" maxlength="20" size="20" placeholder="패스워드" required><br>
				<input type="password" name="pwConfirm" maxlength="20" size="20" placeholder="비밀번호 확인" onchange="pwDoubleCheck()" required>
				<span id="pwCheckRes" style="font-size:10px; color:red"></span>
				 <br>			   
				 
				<input type="hidden" name="isPwCheck" id="isPwCheck" value="0"><br>
				
				<input type="text" name="name" maxlength="20" size="20" placeholder="이름" required> <br>
				<input type="text" name="nickname" maxlength="20" size="20" placeholder="별명" required> <br>
				
				 <br>
				
				<input type="submit" value="회원등록">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</div>

<%@ include file="../footer.jsp" %>

<!-- 레이어팝업, 모달창 -->
<form class="loginForm" name="memLogin" method="post" action="loginProc" onsubmit="return pwCheck()">
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

<script>

function formCheck(){
	var isIdCheck = document.getElementById("isIdCheck").value;
	var isPwCheck = document.getElementById("isPwCheck").value;
	if (isIdCheck == "0" || isPwCheck == "0"){
		alert("회원정보를 확인해 주세요");
		return false;
	} else if (!confirm("가입을 진행 하시겠습니까?")){
		return false;
	}
	
}
	
function pwDoubleCheck() {
	var pw = document.forms["memReg"]["pw"].value;
	var pwConfirm = document.forms["memReg"]["pwConfirm"].value;
	var msg ="";
	
	if (pw == pwConfirm) {
		document.getElementById("isPwCheck").value = "1";
		msg = "비밀번호가 일치합니다";
	} else {
		document.getElementById("isPwCheck").value = "0";
		msg = "비밀번호가 일치하지 않습니다";
	}
	
	document.getElementById('pwCheckRes').innerHTML = msg;
	
}
	

</script>

<script type="text/javascript" src="/js/idDoubleCheck.js"></script>

<script src="/js/w3js.js"></script>

</body>
</html>