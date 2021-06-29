<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/login_head.jsp" %>    
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
var a="${msg}";
if(a.length>1){
    
    $(window).load(function() {
        alert(a);        
    });   
};

</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#btnLogin").click(function(){
		if($('#loginid').val() == "" && $("#loginpwd").val() == "" ){
			alert("로그인 을 입력해주세요.");
			$("#loginid").focus();
		}else if($('#loginid').val() == ""){
			alert("로그인 을 입력해주세요.");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == ""){
			alert("비밀번호를  입력해주세요.");
			$("#loginpwd").focus();		
		}else{
			alert("환영합니다.See0gan 관리자 페이지 입니다.");
			
				$("#form_login").attr({ "method":"POST"
					                  ,"action":"login.sgg"}).submit();			
	}
	
	});
});
</script>

<title>관리자 로그인</title>
</head>
<body class="signup-pages">



    <div class="signup-box">
        <div class="signup-logo">
            <b>see0gan</b></b>  관리자
        </div>

        <div class="signup-box-body">
            <p class="box-msg">Please Sign In</p>

            <form name="form_login" method="POST"  id="form_login" >
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="id" id="id" placeholder="ID" />
                    <span class="feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="PASSWORD" />
                    <span class="feedback"></span>
                    
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <label class="btn">
                            <input type ="checkbox" path="rememberId"/> 아이디 기억하기
                        </label>
                    </div>
                    <div class="col-xs-3">
                        <button type="submit" class="btn btn-style" id="btnLogin" >관리자 로그인</button>
                    </div>
                </div>
            </form>
            
        </div>
    </div>

</body>
</html>