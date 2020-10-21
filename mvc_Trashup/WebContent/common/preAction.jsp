<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div>
	<form name="mode">
		<input type="hidden" name="preAction" value="${preAction}">
		<input type="hidden" name="preActRes" value="${preActRes}">
	</form>
</div>

<script type="text/javascript">
window.onload = function(){
	var preAction = document.forms["mode"]["preAction"].value;
	var preActRes = document.forms["mode"]["preActRes"].value;
	
	if (preAction == "noticeDelete" && preActRes == "deleted"){
		alert('공지가 삭제 되었습니다.')
	}
	if (preAction == "noticeModify" && preActRes == "modified"){
		alert('공지가 수정 되었습니다.')
	} 	
	if (preAction == "boardDelete" && preActRes == "deleted"){
		alert('게시물이 삭제 되었습니다.')
	}
}

</script>