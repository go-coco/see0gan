<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>īī���� �α���</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	
	
	
	<script>
	
	
		$(document).ready(function(){
			Kakao.init("f3f16431996c7651ced04130f1e7a87a");
		
	
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
	
		
		
		function getKakaotalkUserProfile(){
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
					$("#kakao-profile").append(res.properties.nickname);
					$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"���� ������ ����"}));
				},
				fail: function(error) {
					console.log(error);
				}
			});
		}
		function createKakaotalkLogin(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		//	var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"�α���"});
			$("#custom-login-btn").click(function(){
				Kakao.Auth.login({
					persistAccessToken: true,
					persistRefreshToken: true,
					success: function(authObj) {
						getKakaotalkUserProfile();
						createKakaotalkLogout();
					},
					fail: function(err) {
						console.log(err);
					}
				});
			});
			$("#kakao-logged-group").prepend(loginBtn)
		}
		function createKakaotalkLogout(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"�α׾ƿ�"});
			logoutBtn.click(function(){
				Kakao.Auth.logout();
				createKakaotalkLogin();
				$("#kakao-profile").text("");
			});
			$("#kakao-logged-group").prepend(logoutBtn);
		}
	
		});
		
	</script>
</head>
<body>
<a id="custom-login-btn" href="javascript:createKakaotalkLogin">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>