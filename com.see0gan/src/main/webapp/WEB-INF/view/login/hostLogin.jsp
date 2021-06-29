<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.see0gan.login.vo.GuestVO"%>
<%@ page import="com.see0gan.login.vo.HostVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/logjoin.css">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	var inval_Arr = new Array(5).fill(false);
	
	$('.email').blur(function(){
		if(emailJ.test($('.email').val())){
			$('#email_check').text('');
			$('.email').css('border-color','#ccc');
		}else{
			$('#email_check').text('이메일의 형식이 올바르지 않습니다.');
			$('.email').css('border-color','red');
		}
	});
	$('.pw').blur(function(){
		if(pwJ.test($('.pw').val())){
			$('#pw_check').text('');
			$('.pw').css('border-color','#ccc');
		}else{
			$('#pw_check').text('4~12자리의 문자 또는 숫자를 입력해주세요');
			$('.pw').css('border-color','red');
		}
	});

	$("#btn-submit").click(function(){
		var key =  $("#idVal").attr("name");
		console.log("현재 상태 >>> : " + key);
		if("TBU_EMAIL" == key){
			
	
			$("#form-login").attr({
				action : "/guest/loginCheck.sgg",
				method : "POST",
				enctype : "application/x-www-form-urlencoded"
			}).submit();
		}
		if("TBH_EMAIL" == key){

			$("#form-login").attr({
				action : "/host/loginCheck.sgg",
				method : "POST",
				enctype : "application/x-www-form-urlencoded"
			}).submit();
		}
	});
});

function checkOnly(chk){
	var chkVal = "";
    var obj = document.getElementsByName("change");
    for(var i=0; i < obj.length; i++){ 
    	//alert("obj["+i+"].checked >>> : " + obj[i].checked);
        if(obj[i] != chk){
        	obj[i].checked = false;
        }       
    }
    console.log($(chk).val());
    chkVal = $(chk).val();
    if("TBU_EMAIL" == chkVal){
    	$("#idVal").attr("name","TBU_EMAIL");
    	$("#pwVal").attr("name","TBU_PASSWORD");
    	
    }
	if("TBH_EMAIL" == chkVal){
		$("#idVal").attr("name","TBH_EMAIL");
    	$("#pwVal").attr("name","TBH_PASSWORD");	
    }
//     document.getElementById("tbsp_pay_method").value = $(chk).val();

}
</script>
</head>
<body>
<%
		HttpSession httpSession = request.getSession(true);

	GuestVO svo = (GuestVO) httpSession.getAttribute("user");
	HostVO hvo = (HostVO) httpSession.getAttribute("HostVO");;
	if (hvo != null) {
		%>
		<script>
			window.history.back(-1);
		</script>
		
		<%
	}else if(svo != null){
		%>
		<script>
			alert("호스트 로그인이 필요합니다.");
			window.history.back(-1);
		</script>
		
		<%
	}
%>
<div class="wrap">
<header class="header">
	<%@include file="../common/header.jsp" %>
</header>
<div class="content_wrap">
	<h1>로그인</h1>
	<div class="log_join_wrap">
		<form name ="form-login" id="form-login" class="log_join_form">
			<input type="text" class="email" placeholder ="이메일" name="TBU_EMAIL" id="idVal"/>
			<div class="form_check" id="email_check"></div>
			<input type="password" class="pw" placeholder ="비밀번호" name="TBU_PASSWORD" id="pwVal"/>
			<div class="form_check" id="pw_check"></div>
			<div class="g_h_select_wrap">
				<input type="checkbox" class="g_h_select_box" name="change" id="change" onclick="checkOnly(this)" value="TBU_EMAIL">
				<label class="g_h_select g_select" for="change">게스트</label>
				<input type="checkbox" class="g_h_select_box" name="change" id="host"onclick="checkOnly(this)" value="TBH_EMAIL"/>
				<label class="g_h_select h_select" for="host">호스트</label>
			</div>
			<input type="button" id="btn-submit" class="btn-submit" value="로그인"/>
		</form>
		<div class="no_mem">아직 스페이스 클라우드 회원이 아니신가요? <br>
			<a href="/guest/join.sgg" class="join_link">게스트 회원가입</a>
			<a href="/host/join.sgg" class="join_link">호스트 회원가입</a>
		</div>
	</div>
</div>
</div>
</body>
</html>
