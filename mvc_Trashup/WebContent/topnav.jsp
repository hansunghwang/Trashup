<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set value="${sessName}" var="sName"/>
<c:set value="${sessNickname}" var="sNickname"/>

<div class="topnav">
	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()" title="Menu">
      <!-- <i class="fa fa-bars"></i> -->
      <img src="<%=ROOT %>/img/plusmenu.png" class="topnavIcon" style="height:20px; width:20px; margin-top:4px; margin-bottom:2.5px;" >
    </a>
  	<div class="topnavHidden">
	  <a href="#" class="topnavLeft fichIcon" title="Notice"><img src="<%=ROOT %>/img/notice.png" class="topnavIcon" style="height:30px; width:30px;"></a>
	  <a href="<%=ROOT %>/tupMap.do" class="topnavLeft" title="Map"><img src="<%=ROOT %>/img/map.png" class="topnavIcon"></a> 
		
		<c:if test="${sName != null}">
			<a href="boardRegForm.bo" class="topnavLeft" title="Tup"><img src="<%=ROOT %>/img/tuptrees.png" class="topnavIcon"></a>
			<a href="#" class="topnavRight" onclick="logoutCheck()" title="Logout"><img src="<%=ROOT %>/img/logout.png" class="topnavIcon"></a>
			<a href="myPage.do" class="topnavRight" title="mypage" ><img src="<%=ROOT %>/img/mypage.png" class="topnavIcon"></a>
		</c:if>
		
		<c:if test="${sName == null}">
			<a href="memReg.do" class="topnavRight" title="Sign-in"><img src="<%=ROOT %>/img/signin.png" class="topnavIcon"></a>
			<a href="#login" class="topnavRight" title="Login"><img src="<%=ROOT %>/img/login.png" class="topnavIcon"></a>
		</c:if>
		
		<form name="search" method="post" action="search.bo">
		<c:if test="${keyword != null}">
	  		<input type="text" name="keyword" placeholder="제목 검색" value="${keyword}">
		</c:if>
		<c:if test="${keyword == null}">
	  		<input type="text" name="keyword" placeholder="제목 검색">
	  	</c:if>
	  	<input type="submit" value="검색">
  	</form>
  	</div> 
</div>



<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large sidebar-font" style="display:none" id="mySidebar">
  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button">NOTICE!</a>
  <a href="<%=ROOT %>/tupMap.do" onclick="w3_close()" class="w3-bar-item w3-button">MAP!</a>
  
	<c:if test="${sName != null}">
	    <a href="boardRegForm.bo" onclick="w3_close()" class="w3-bar-item w3-button">TUP!</a>  
	    <a href="myPage.do" onclick="w3_close()" class="w3-bar-item w3-button">MYPAGE!</a>
	    <a href="#" onclick="logoutCheck()" class="w3-bar-item w3-button">LOGOUT!</a>
	</c:if>
	
	<c:if test="${sName == null}">
	    <a href="#login" onclick="w3_close()" class="w3-bar-item w3-button">LOGIN!</a>
	    <a href="<%=ROOT%>/member/memRegForm.jsp"" onclick="w3_close()" class="w3-bar-item w3-button">SIGN-IN!</a>
	</c:if>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16 sidebar-closeButton">Close.. ×</a>
</nav>