<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/login.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#btn-submit").on("click",function(e){
	$("#form-login").attr({
		action : "loginCheck.sgg",
		method : "POST",
		enctype : "application/x-www-form-urlencoded"
	}).submit();
});

});
</script>
</head>
<body>
<div class="wrap">
<header class="header">
	<%@include file="../common/header.jsp" %>
</header>
<div class="content_wrap">
	<h1>로그인</h1>
	<div class="login_wrap">
		<form name ="form-login" id="form-login" class="form-login">
			<input type ="text" placeholder ="이메일"  name="TBU_EMAIL">
			<input type ="password" placeholder ="비밀번호"  name="TBU_PASSWORD">
			<input type="button" id="btn-submit" class="btn-submit" value="이메일로 로그인"/>
		</form>
	<div class="no_mem">아직 스페이스 클라우드 회원이 아니신가요? <a href="#">회원가입</a></div>
	</div>
</div>
</div>
</body>
</html>