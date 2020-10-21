<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
				</div>
			</div>
		</div>
	</div>
</form>