<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE SELECT</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">
	$(document).ready(function() {

		// 공지 수정(U)
		$(document).on("click", "#U", function() {
			$("#NoticeUpdateForm").attr({
				"method" : "POST",
				"action" : "noticeUpdateForm.sgg"
			}).submit();
		});

		// 공지 삭제(D)
		$(document).on("click", "#D", function() {
			$("#NoticeUpdateForm").attr({
				"method" : "POST",
				"action" : "noticeDelete.sgg"
			}).submit();
		});

		// 돌아가(C)
		$(document).on("click", "#C", function() {
			location.href = "noticeSelectAllPage.sgg";
		});

	})
</script>
<style type="text/css">
.wrapper {
	display: flex;
}
.nt_body {
	width: 60%;
}
.nt_blank {
	width: 40%;
}
.nt_title {
	font-size: 30px;
	font-weight: 500;
	text-align: center;
}

.nt_content {
	height: 500px;
	font-size: 18px;
	border: 1px solid #4d4e50;
	padding: 20px;
}

.nt_subject {
	display: flex;
	align-items: center;
	background-color: #4d4e50;
	font-weight: 300;
	font-size: 22px;
	color: white;
	height: 40px;
	padding: 10px;
	margin-top: 50px;
}
.nt_bottom {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		Object obj = request.getAttribute("listS");
	List<MypageVO> list = (List) obj;
	MypageVO mpvo = null;

	if (list.size() == 1) {
		mpvo = list.get(0);
	}
	;
	%>
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
		<div class="nt_body">
		<form name="NoticeUpdateForm" id="NoticeUpdateForm">
			<div class="nt_title">
				<span>공지사항</span>
			</div>
			<div class="nt_subject">
				<span><%=mpvo.getNtsubject()%></span>
			</div>
			<input type="hidden" id="ntnum" name="ntnum"
				value="<%=mpvo.getNtnum()%>">
			<div class="nt_content"><%=mpvo.getNtcontent()%></div>
			<div class="nt_bottom">
				<div class="nt_date">
					<span style="font-size: 14px;">등록: <%=mpvo.getNtinsertdate()%></span>
				</div>
				<div class="btns">
					<input type="button" class="btn" value="수정" id="U">
					<input type="button" class="btn" value="삭제" id="D">
					<input type="button" class="btn" value="돌아가기" id="C">
				</div>
			</div>
		</form>
	</div>
	<div class="nt_blank"></div>
	</div>
</body>
</html>