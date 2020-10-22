<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:set value="${sessId}" var="sId"/>
<c:set value="${sessName}" var="sName"/>

<div class="mainBox">
	<c:if test="${sessGrade == '1' || sessGrade == '2'}">
		<div class="header">
			<font class="mainText">관리자 시스템</font>
		</div>
	    
		<div class="menu">
			<div class="menuButton">
				<a href="main.ad">HOME </a>
				<a href="notice.ad"> 공지사항 </a>
				<a href="boardMng.bo"> 게시물관리</a>
				<a href="help.he"> 도움말관리</a>
				<a href="memList.do"> 회원관리</a>
				<a href="memDel.do"> 탈퇴회원관리</a>
				
				<a href="logout.do" style="float:right">로그아웃</a>
				<font class="adminNameId">${sName} (${sId})</font>
				
			</div>
		</div>
	</c:if>
