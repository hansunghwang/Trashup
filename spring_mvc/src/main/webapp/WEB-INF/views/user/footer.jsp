<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="footer">
    개인정보처리방침 <br>
  Address: 서울시 강남구 강남동 123-1234 <br>
  Tell: 070-2222-1111<br>
   사업자등록번호: 0000-0000-00-0000
</div>


<script>

function logoutCheck(){
	if(!confirm("로그아웃 하시겠습니까?")){
		return false;
	} else {
		location.href="/member/logoutProc";
	}
}
</script>

