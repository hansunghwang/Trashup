<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${sId != null}">
	<div id="noticeContents" class="noticePageStyle">
		<div id="myBoardList">
			<a onclick="formChange()" class="likeButton" title="like" style="cursor:pointer">
				<img src=
					<c:if test="${sThumbnail != null}">
						"${sThumbnail}" 
					</c:if>
					<c:if test="${sThumbnail == null}">
						"/img/뚱이침.jpg"
					</c:if>
				style="border-radius:50%; width:150px; height:130px">
			</a>
			<p class="myBoard">${sNickname}님의 게시물</p>
			<c:choose>
				<c:when test="${fn:length(list) gt 0}">
				<font class="noticeCnt">총 ${fn:length(list)} 개의 게시물</font>
				<br>
					<c:forEach items="${list}" var="dto">
						<div class="myBoardAll">	
								<div class="myBoardStyle">
									<a href="myBoardDetail#${dto['seqNum']}" style="width:60x;height:100px">
										<img src="#" style="width:100%;height:100%">
									</a>
								</div>	
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<br>
					<hr>
					<br>
					<font style="margin-left:50px">등록된 게시물이 없습니다.</font><br>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 프로핀 사진 수정 -->
		<div id="myProfile" style="display:none">
			<p class="myBoard">${sNickname}님의 프로필</p>
			<form name="profileUpdate" method="post" action="profileUpdate" onsubmit="return modifyConfirm()" enctype="multipart/form-data">
			
				<input type="file" name='file1' style='display:none;' accept="image/*" value="업로드" onchange="setThumbnail(event)">
				<input type='hidden' name='file2' id='file2'>
				
				<div id="xImg" <c:if test="${sThumbnail == null}"> style="display:none"</c:if>>	
					<a style="cursor:pointer"><img src="/img/빨강엑스.jpg" style="float:right; width:20px; height:20px; margin-right:50px" onclick="imageNone(); changeCheck()"></a>
				</div>
				
				<div <c:if test="${sThumbnail == null}"> style="display:none"</c:if> id="oldImg" class="profileStyle">
					<a style="cursor:pointer">
						<img src="${sThumbnail}" style="border-radius:50%; width:80%; height:50%" 
							onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>
					</a>
				</div>
					
				<div <c:if test="${sThumbnail != null}"> style="display:none" </c:if> id="image_plus" class="profileStyle">
					<a style="cursor:pointer">
						<img src="/img/menuplus.png" style="border-radius:50%; width:250px; height:250px; margin-top:25px; margin-left:28%" 
							onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>
					</a>
				</div>
				
				<div style="display:none" id="image_container" class="profileStyle">
				</div>
				
				<input name="delCheck" type="hidden" value="imgYes">
				<input type="hidden" name="oldFileCheck" value=
					<c:if test="${sThumbnail == null}"> "fileNo" </c:if>
					<c:if test="${sThumbnail != null}"> "fileYes" </c:if>>
				<input type="hidden" id="changing" value="notChanged">
				<input type="submit" value="등록">
			</form>
		</div>
	</div>
</c:if>
<script>
function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		img.id = 'img';
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		
		document.getElementById("changing").value = "changed";
		document.getElementById("image_container").style.display = "block";
		document.getElementById("oldImg").style.display = "none";
		document.getElementById("image_plus").style.display = "none";
		document.getElementById("xImg").style.display = "block";
		document.forms["profileUpdate"]["delCheck"].value = "imgYes";
} 

function formChange() {
	document.getElementById("myBoardList").style.display="none";
	document.getElementById("myProfile").style.display="block";
}

function changeCheck(){
	document.getElementById("changing").value = "changed";
}

function imageNone() {
	
	document.getElementById("oldImg").style.display = "none";
	document.getElementById("image_plus").style.display = "block";
	document.getElementById("xImg").style.display = "none";
	document.getElementById("image_container").style.display = "none";
	document.forms["profileUpdate"]["delCheck"].value = "imgNo";
	document.getElementById("changing").value = "changed";
	
	if (document.getElementById("image_container") != null) {
		var div = document.getElementById("image_container");
		var img = document.getElementById("img");
		div.removeChild(img);
	}
}

function modifyConfirm() {
	if(document.getElementById("changing").value == "changed"){
		if (!confirm("등록 하시겠습니까?")){	
			return false;
		}
	} else {
		alert('사진을 업로드 해주세요');
		return false;
	}
}

</script>