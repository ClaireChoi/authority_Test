<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="script/jquery-3.1.1.min.js" type="text/javascript"></script>
<style>
	div#wrapper {
		width : 1000px;
		margin : 0 auto;
		text-align:center;
	}
	label, input{
		display : inline-block;
		margin : 10px;
	}
	input {
		height : 22px;
		border : 1px dotted #aaa;
	}
	.title {
		width : 100px;
	}
	a, a:link, a:visited, a:hover, a:active {
		padding-top : 10px;
		text-decoration : none;
		color : white;
		font-weight:bolder;
		display : inline-block;
		width : 20%;
		height: 30px;
		background-color : #00aefe;
		font-size:1em;
		border-radius: 20px;
	}
</style>
<script>
//필요한 코드 작성할 것
	$(function(){
		
		$('#loginBtn').on('click', function(){
			$('#login').submit();
		});//loginBtn clicked
		
	});//onload

</script>
</head>
<body>
<div id="wrapper">
<h2>[ 관리자 화면 ] </h2>
<div>
	<s:if test="#session.loginId == null">
		<s:form id="login" action="login" method="post" theme="simple">
			<label class="title">아이디 </label><input type="text" id="userId" name="userId" /><br />
			<label class="title">비밀번호</label><input type="password" id="userPassword" name="userPassword" /><br />
			<a id="loginBtn" href="#">로그인 </a> 
		</s:form>
	</s:if>
		
	<s:else>
		<p><s:property value="#session.loginName"/>님, 로그인 중...</p>
		<a href="logout">로그아웃</a>
		<a href="listView">회원관리 화면 이동</a>
	</s:else>
</div>
</div>
</body>
</html>