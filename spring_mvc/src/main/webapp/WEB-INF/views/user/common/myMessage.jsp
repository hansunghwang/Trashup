<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <div class="rightcolumn">
    <div class="card rightCard">
		<c:if test="${sName != null}">
			<h2>My Trash</h2>
				<h2>${sThumbnail}</h2>
	          <div class="fakeimg">
		          <img src=
					<c:if test="${sThumbnail != null}">
						"<%=ROOT %>/fileUpload/thumbnail/${sThumbnail}" 
					</c:if>
					<c:if test="${sThumbnail == null}">
						"/img/뚱이침.jpg"
					</c:if>
				style="border-radius:50%; width:120px; height:100px">
		
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


