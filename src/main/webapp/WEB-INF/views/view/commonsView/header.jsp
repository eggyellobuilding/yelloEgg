<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Yello egg</title>
    <script type="text/javascript" src="js/httpRequest.js"></script>
    <!-- 부트스트랩 -->
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
    <link href="/yelloMovie/css/view/header.css" rel="stylesheet">
</head>

<script type="text/javascript">

  function loginForm() {

		sendRequest('memberLoginForm.do',null,loginFormResult,'GET');
	}
	function loginFormResult() {
		if(XHR.readyState==4){
			if(XHR.status==200){
				var loginForm=XHR.responseText;
				var divNode=document.getElementById('divLogin');
				window.alert(divNode);
				if(divNode.hasChildNodes()){
					while(divNode.hasChildNodes()){
						divNode.removeChild(divNode.firstChild);
					}
				}else{
					divNode.style.display='block';
					divNode.style.height='56%';
					divNode.style.left='900px';
					divNode.innerHTML=loginForm;
				}
				
			}
		}
	}
	function loginState(memberIdx) {

		sendRequest('memberLoginState.do','memberIdx='+memberIdx,loginStateResult,'GET');
	}
	function loginStateResult() {
		if(XHR.readyState==4){
			if(XHR.status==200){
				var loginImfo=XHR.responseText;
				var divNode=document.getElementById('divLogin');
				
				if(divNode.hasChildNodes()){
					while(divNode.hasChildNodes()){
						divNode.removeChild(divNode.firstChild);
					}
				}else{
					divNode.style.display='block';
					divNode.style.height='63%';
					divNode.style.left='920px';
					divNode.innerHTML=loginImfo;
				}
			
				
			}
		}
	}
  </script>
<body> 
	<div class="container">
		<ul class="nav nav-tabs navbar-fixed-top " style="padding-left: 26%; background-color: white; width:110%;">
			<li class="header logo"><a href="main.do"><img src="/yelloMovie/img/log.PNG" class="img-rounded" height="20" width="100"></a></li>
			<li class="header"><a href="movieBoxOffice.do" style="margin: 0px;">영화</a></li>
			<li class="header"><a href="scheduleInfo.do" style="margin: 0px;">상영시간표</a></li>
			<li class="header"><a href="#" style="margin: 0px;">스토어</a></li>
			<li class="header"><a href="#" style="margin: 0px;">공지&이벤트</a></li>
			<li class="header"><a href="#" style="margin: 0px;">빠른예매</a></li>
			<c:if test="${!empty mdto}">
				<li class="header" style="width:13%;"><a href="#" style="margin: 0px;" onclick="loginState(${memberIdx})"><small>${sessionScope.mdto.id}님</small></a></li>			
			</c:if>
			<c:if test="${empty mdto}">
				<li class="header" style="width:11%;"><a href="#" style="margin: 0px;" onclick="loginForm()">로그인</a></li>			
			</c:if>
			
		</ul>
	</div>
	<div id="headerAllMenu"	style="position: absolute;left:26%;top:50px;">
		<div class="btn-group">
			<a class="btn dropdown-toggle btn btn-warning" data-toggle="dropdown"
				href="#" id="allMenu"> <span class="icon-align-justify"></span>전체메뉴
			</a>
			<ul class="dropdown-menu">
				<li>영화</li>
				<li><a tabindex="0" href="#">asd</a></li>
				<li><a tabindex="0" href="#">asdasdas</a></li>
			</ul>
		</div>
	</div>
<div id="divLogin"></div>
</body>
</html>