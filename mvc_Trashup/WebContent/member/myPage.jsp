<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

<% 

//modifyProc에서 가져온 값
String div_sel_value = "1";
if (request.getParameter("div_sel_value") != null){
	div_sel_value = request.getParameter("div_sel_value");
}
%>

<form name="form_div_sel">
	<input type="hidden" name="div_sel_value" value="<%=div_sel_value %>">
</form>

<c:if test="${sName != null}">
	<div class="row">
	  <div class="card cardMypage">
	    <div class="display-middle">
	    	<div class="tap-bar">
	    		<button class="bar-button taplink" onclick="openLink(event, '회원정보수정')">회원정보 수정</button>
	    		<button class="bar-button taplink" onclick="openLink(event, '비밀번호변경')">비밀번호 변경</button>
	    		<button class="bar-button taplink" onclick="openLink(event, '게시물조회')">게시물 조회</button>
	    	</div> 
	    	
	    		<!-- 비밀번호 확인 -->
			    <div class="pwCheck" id="pwCheck" style="text-align:center">
				    	<input type="password" id="pw" name="pw" maxlength="10" size="20" placeholder="패스워드" required>
				    	<input type="button" value="확인" onclick="pwCheck('${sessId }','<%=ROOT%>')"><br>  	  
				    	<span id="pwCheckRes" style="font-size:10px; color:red"></span>
				    	<input name="isPwCheck" type="hidden" value="">
			    	<!-- </form> -->
			    </div> 
			    
	    	<div id="mypageMemInfo" Style="display:none">
		    	<div id="회원정보수정" class="tap-container mylink">		    
		    		<%@ include file="memModifyForm.jsp" %>
		    	</div>   
		    	
		    	<div id="비밀번호변경" class="tap-container mylink">
		    		<%@ include file="pwChangeForm.jsp" %>
		    	</div>
		    	
		    	<div id="게시물조회" class="tap-container mylink">
		    		<%@ include file="myBoardModifyForm.jsp" %>
		    	</div>
	    	</div>
	     </div>
	  </div>
	</div>

</c:if>

<%@ include file="../footer.jsp" %>

<script>

function pwCheck(id, ROOT){
	var pw = document.getElementById("pw").value;
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4) { //서버 갔다 옴
			if(xhr.status === 200) {
				var data = xhr.responseText.trim();
				console.log(data);
				if(data == "0"){
					document.getElementById("pwCheckRes").innerHTML = "비밀번호가 맞지 않습니다.";
				} else {
					document.getElementById("pwCheck").style.display = "none";
					document.getElementById("mypageMemInfo").style.display = "block";
				}
			} else {
				console.log('서버 에러(403, 404)');
			}
		}
	};
	var url = ROOT + "/member/pwSearch.jsp";

	xhr.open("post", url, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("id=" + id + "&pw=" + pw);
}

var div_sel_value = document.forms["form_div_sel"]["div_sel_value"].value;
window.onload = div_sel(div_sel_value);

function div_sel(div_sel_value) {
	switch (div_sel_value){
		case "1": 
			document.getElementById("pwCheck").style.display = "block";
			document.getElementById("mypageMemInfo").style.display = "none";
			break;
		
		case "2":
			document.getElementById("pwCheck").style.display = "none";
			document.getElementById("mypageMemInfo").style.display = "block";
			break;

			break;
		default:
	}
	
}	

function openLink(evt, linkName){
	var i, x, tablinks;
	
	x = document.getElementsByClassName("mylink");
	for (i=0; i < x.length; i++){
		x[i].style.display = "none";
	}
	
	tablinks = document.getElementsByClassName("taplink");
	for(i=0; i < x.length; i++){
		tablinks[i].className = tablinks[i].className.replace(" tap-color", "")
	}
	
	document.getElementById(linkName).style.display = "block";
	evt.currentTarget.className += " tap-color";
}

document.getElementsByClassName("taplink")[0].click();

</script>

<script src="../JS/w3js.js">


</script>

</body>
</html>
