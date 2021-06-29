<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO"%>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Object obj = request.getAttribute("listS");
List<MypageVO> list = (List) obj;
MypageVO mpvo = null;

if (list.size() == 1) {
	mpvo = list.get(0);
} ;
System.out.println("mpvo.getOnemnum() >>> : " + mpvo.getOnemnum());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONE SELECT</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">
	$(document).ready(function() {

		// 문의 수정(U)
		$(document).on("click", "#U", function() {
			$("#OneUpdateForm").attr({
				"method" : "POST",
				"action" : "oneUpdateForm.sgg"
			}).submit();
		});

		// 문의 삭제(D)
		$(document).on("click", "#D", function() {
			$("#OneUpdateForm").attr({
				"method" : "POST",
				"action" : "oneDelete.sgg"
			}).submit();
		});

		// 돌아가기(C)
		$(document).on("click", "#C", function() {
			history.go(-1);
		});

	})
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
	justify-content: space-between;
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
			<form name="OneUpdateForm" id="OneUpdateForm">
				<input type="hidden" id="onenum" name="onenum"
					value="<%=mpvo.getOnenum()%>">
				<div>
					<input type='hidden' name='onemnum' value='<%=mpvo.getOnemnum()%>'>
				</div>
				<div class="one_ctitle">
					<span>문의내용</span>
				</div>
				<div class="one_content"><%=mpvo.getOnecontent()%></div>
				<div class="one_bottom">
					<div class="one_date">
						<span style="font-size: 14px;">등록: <%=mpvo.getOneinsertdate()%></span>
					</div>
					<div class="btns">
						<input type="button" class="btn" value="수정" id="U"> <input
							type="button" class="btn" value="삭제" id="D"> <input
							type="button" class="btn" value="돌아가기" id="C">
					</div>
				</div>
			</form>
		</div>
		<div class=""></div>
	</div>
</body>
</html>