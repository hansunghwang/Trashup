<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form class="loginForm" name="memLogin" method="post">
	<div class="modal" id="mapModal">
		<div class="modal-dialog">
			<div class="container">
				<a href="javascript:history.back();" class="close-modal">close</a>
				<div class="loginCon">
				<div id="map" style="width:100%; height: 700px;"></div> 
				  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOvaqN07Wg9fs3WkA4EkcPYYy7hnEAIAM&callback=initMap&region=kr">
				  </script> 
			  	  <script src="./JS/mapMarkup.js"></script>
				</div>
			</div>
		</div>
	</div>
</form>