<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.login.vo.GuestVO"%>
<%@ page import="com.see0gan.login.vo.HostVO"%>
<%
		HttpSession httpSession = request.getSession(true);

	GuestVO svo = (GuestVO) httpSession.getAttribute("user");
	HostVO hvo = null;
	if (svo == null) {
		hvo = (HostVO) httpSession.getAttribute("HostVO");
	}
	if(svo == null && hvo == null){
		%>
		<script>
			alert("로그인이 필요한 서비스입니다.");
			location.href="/host/hostLogin.sgg";
		</script>
		<%
		}
	String mnum = null;
	String mnick = null;
	if (svo != null) {
		mnum = svo.getTBU_GUESTID();
		mnick = svo.getTBU_NICKNAME();
	} else if (hvo != null) {
		mnum = hvo.getTBH_NUM();
		mnick = hvo.getTBH_NICKNAME();
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<style type="text/css">
a {
	color: inherit;
	text-decoration: none;
}

body {
	font-weight: 500;
}

.wrapper {
	display: flex;
	text-align: center;
}

.mp_body {
	background-color: white;
	width: 40%;
}

.mp_blank {
	width: 60%;
}

.mp_title {
	background-color: #fed636;
	height: 170px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.mp_list {
	height: 50px;
	font-size: 20px;
	border-bottom: 1px solid;
	border-color: silver;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-left: 20px;
	padding-right: 20px;
}

.blue {
	display: flex;
	justify-content: center;
	background-color: #6d3afb;
	color: #fed636;
}

.bottom {
	height: 200px;
	background-color: #f6f6f6;
	align-items: flex-start;
	padding-top: 50px;
	text-align: center;
}

.log_out{
	font-size: 20px;
	margin-bottom: 30px;
}

.home{
	color: #704de5;
}
</style>
</head>
<body>
	<div class="header_wrapper">
		<header class="header">
			<%@include file="../common/header.jsp" %>
			<!-- sub header -->
			<!-- 
			<div class="subheader_wrap">
				<button class="btn_back" onclick="location.href='#'">
					<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
				</button>
				<h2>공간등록</h2>
				<button class="btn_menu" onclick="location.href='#'">
					<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
				</button>
			</div> 
			-->
		</header>
	</div>
	<div class="wrapper">
		<div class="mp_body">
			<div class="mp_title">
				<h2>마이페이지</h2>
			</div>
			<div class="mp_list home" onclick="location.href='main.jsp'" style="cursor: pointer;">
				<span>시공간 홈</span><span>></span>
			</div>
			<div class="mp_list" onclick="location.href='myinfo.sgg'" style="cursor: pointer;">
				<span>프로필 관리</span><span>></span>
			</div>
			<div class="mp_list" onclick="location.href='/booking/bookHisSelect.sgg'" style="cursor: pointer;">
				<span>예약 리스트</span><span>></span>
			</div>
			<div class="mp_list" onclick="location.href='noticeSelectAllPage.sgg'" style="cursor: pointer;">
				<span>공지사항</span><span>></span>
			</div>
			<div class="mp_list" onclick="location.href='oneSelectAllU.sgg?onemnum=<%=mnum%>'" style="cursor: pointer;">
				<span>1:1문의</span><span>></span>
			</div>
			<div class="bottom">
				<div class="log_out" style="cursor: pointer;">
					<a href="logOut.sgg">로그아웃</a>
				</div>
				<div>Powered by © SEE0GAN Corp.</div>
			</div>
			<div class="mp_list blue" style="cursor: pointer;">
				<a href="/host/hostCenter.sgg">호스트센터로 이동</a>
			</div>
		</div>
		<div class="mp_blank"></div>
	</div>
</body>
</html>