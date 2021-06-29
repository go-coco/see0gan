<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
// 	$("#home").click(function(){
// 		location.href="/booking/index.sgg";
// 	});
	
	$("#mypage").click(function(){
		location.href="/booking/bookHisSelect.sgg";
	});
});
</script>
<body>
<div class="wrap">
<header class="header">
	<!-- main header -->
	<%@include file="../common/header.jsp" %>
	<!-- sub header -->
	 
	<!-- <div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>공간등록</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div>  -->
	
</header>
<div class="content_wrap">
<section id="sp_contents" class="sp_contents">

<form name="goForm" id="goForm">
<h2 class="heading--new">예약이 완료 되었습니다</h2>
<div class="pay_finish">
			<div class ="sp_btn_bottom">
		    	<span class="btn_wrap">
					<input class="btn_home" type="button" id="home" value="홈으로"/>
				</span>
				<span class="btn_wrap">
					<input class="btn_mypage" type="button" id="mypage" value="예약 내역 보기"/>
				</span>
		    </div>
</div>
</form>

</section>
</div>
<div>
<footer class="footer">
	<%@include file="../common/footer.jsp" %>
</footer>
</div>
</body>
</html>