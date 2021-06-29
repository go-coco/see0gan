<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1><br>

<form id="form-email">
<input type="text" name="receiveMail" placeholder="이메일"><br>
<input type="button" id="btn-send" placeholder="이메일"><br>
</form>

<script>
$(document).ready(function(){

	$("#btn-send").on("click",function(e){
	$("#form-email").attr({
		action : "/guest/p.sgg",
		method : "POST",
		enctype : "application/x-www-form-urlencoded"
	}).submit();

 	

	
 });

});

</script>

<jsp:forward page="/login/guestLogin.sgg">
	<jsp:param value="" name=""/>
</jsp:forward>


</body>
</html>