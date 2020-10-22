<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String ROOT = "/resources";
%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="keywords" content="HTML, CSS, XML, JavaScript">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trash Up</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Pangolin&display=swap');

</style>
<head>
<link rel="stylesheet" href="/css/HansungStyle.css">
<link rel="stylesheet" href="/css/tab.css">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
      $( document ).ready( function() {
        var jbOffset = $( '.topnav' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.topnav' ).addClass( 'topnavFixed' );
            $( '.row' ).addClass( 'rowScroll' );
            //$( '.w3-sidebar' ).addClass( 'w3-sidebarScroll' );
          }
          else {
            $( '.topnav' ).removeClass( 'topnavFixed' );
            $( '.row' ).removeClass( 'rowScroll' );
            //$( '.w3-sidebar' ).removeClass( 'w3-sidebarScroll' );
            
          }
        });
      } );
      
      $( document ).ready( function() {
          var jbOffset = $( '.topnav' ).offset();
          $( window ).scroll( function() {
            if ( $( document ).scrollTop() > jbOffset.top -5.1 ) {
              $( '.w3-sidebar' ).addClass( 'w3-sidebarScroll' );
            }
            else {
              $( '.w3-sidebar' ).removeClass( 'w3-sidebarScroll' );
              
            }
          });
        } );
    </script>
</head>

<body>