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

<c:if test="${sId != null}">
	<div class="row">
	  <div class="card cardMypage">
	    <div class="display-middle">
	    	<div class="tap-bar">
	    		<button class="bar-button taplink" onclick="openLink(event, '게시물조회')">게시물 조회</button>
	    		<button class="bar-button taplink" onclick="openLink(event, '친구조회')">친구 조회</button>
	    		<button class="bar-button taplink" onclick="location.href='memDetail.do'">개인정보 조회</button>
	    	</div> 
	    	
    		<div id="게시물조회" class="tap-container mylink">		    
	    		<%@ include file="../board/myBoardList.jsp" %>
	    	</div>
		    
	    	
	    	<div id="친구조회" class="tap-container mylink">
	    		<%-- <%@ include file="#" %> --%>
	    	</div>
	     </div>
	  </div>
	</div>

</c:if>

<%@ include file="../footer.jsp" %>

<script>
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

<script src="/js/w3js.js">


</script>

</body>
</html>
