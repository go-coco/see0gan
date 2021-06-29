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
	if (hvo == null) {
	}
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성하기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">
	$(document).ready(function() {

		$(document).on("click", "#obtn", function() {
			console.log("obtn >>> : ");
			$('#OneForm').attr({
				'action' : 'oneInsert.sgg',
				'method' : 'POST',
				'enctype' : 'application/x-www-forms'
			}).submit();
		});
	});
</script>
<style type="text/css">
.wrapper {
	display: flex;
}

.one_title {
	text-align: center;
}

.one_body {
	width: 40%;
}

.one_blank {
	width: 60%;
}

.one_content {
	height: 200px;
	padding: 20px;
	font-size: 18px;
	border: 1px solid gray;
}

.one_ctitle {
	background-color: #4d4e50;
	padding: 20px;
	font-size: 20px;
	color: white;
	text-align: center;
}

.one_bottom {
	padding-top: 10px;
	padding-left: 5px;
	padding-right: 5px;
	display: flex;
	justify-content: flex-end;
}

textarea {
	resize: none;
	width: 100%;
	height: 100%;
	font-size: 18px;
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
		<div class="one_body">
			<form action="oneInsert.sgg" method="POST"
				enctype="multipart/form-data" name="OneForm" id="OneForm">
				<div class="one_title">
					<h2>문의 작성하기</h2>
				</div>
				<input name="onemnum" value="<%=mnum%>" type="hidden"> <input
					name="onenick" value="<%=mnick%>" type="hidden">
				<div class="one_ctitle">
					<span>문의 내용</span>
				</div>
				<div class="one_content">
					<textarea class="form-control" name="onecontent" id="onecontent" placeholder="문의내용을 입력해주세요"></textarea>
				</div>
				<div class="one_bottom">
					<input type="button" class="btn" value="등록" id="obtn">
				</div>
			</form>
		</div>
		<div class="blank"></div>
	</div>
</body>
</html>