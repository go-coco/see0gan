<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.booking.vo.BookingVO" %>
<%@ page import="java.util.List" %>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
  background-color: #eee;
  border: 1px dashed #4b2e83;
  width: 560px;
}

.panel-title {
  text-align: center;
  font-size: 40px;
  font-style: italic;
}

.panel{
	margin: auto;
	text-align: center;
	font-size: 20px;
}

.content_wrap{
	padding-bottom: 200px;
		
}

</style>
<link rel="stylesheet" href="/resources/css/common.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%

HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
	Object obj = request.getAttribute("listAll");
	
	List<BookingVO> listBooking = (List)obj;
	int nCnt = listBooking.size();
	System.out.println("nCnt >>> : " + nCnt);
%>
<script type="text/javascript">
function goDetail(index){
	document.getElementById("index").value = index;
		$("#selectDetail").attr({
			action : "/booking/selectDetail.sgg",
			method : "POST",
			enctype : "application/x-www-form-urlencoded"
		}).submit();
}

</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
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
<h3 class="panel-title">예약리스트</h3>
<div class="content_wrap">
<div>
<form id="selectDetail">
	<table border="1" class="panel">

	<tr class="container"> 
		<td>선택</td>
		<td>예약번호</td>
		<td>공간이름</td>
		<td>예약자이름</td>
		<td>예약인원</td>
		<td>예약날짜</td>
		<td>예약시간시작</td>
		<td>예약시간끝</td>
		<td>예약상태</td>
		
	</tr>

<%
for(int i=0; i<nCnt; i++){		
	BookingVO bkvo = listBooking.get(i);	
%>	
	<tr>
		<td><input type="button" value="조회"  onclick = "goDetail(<%= i%>)" value="<%= bkvo.getTbsp_bok_num() %>" class="panel"/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_num" value="<%= bkvo.getTbsp_bok_num()%>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_name" value="<%= bkvo.getTbsp_name()%>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbu_name" value="<%= bkvo.getTbu_name() %>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_person" value="<%= bkvo.getTbsp_bok_person()%>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_date" value="<%= bkvo.getTbsp_bok_date() %>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_time_s" value="<%= bkvo.getTbsp_bok_time_s()%>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_time_e" value="<%= bkvo.getTbsp_bok_time_e()%>" class="panel" readonly/></td>
		<td><input type="text" name="getBookingVOList[<%= i %>].tbsp_bok_status" value="<%= bkvo.getTbsp_bok_status()%>" class="panel" readonly/></td>
		<input type="hidden" name="getBookingVOList[<%= i %>].tbsp_num" id="tbsp_num" value="<%= bkvo.getTbsp_num()%>" class="panel"/>
		
	</tr>
<%
}//end of for
%>	
<input type="hidden" name="index" id="index" value=""/>	
<input type="hidden" name="tbu_guestid" id="tbu_guestid" value="<%= svo.getTBU_GUESTID()%>"/>
	</table>
</form>
</div>
</div>
<footer class="footer">
	<%@include file="../common/footer.jsp" %>
</footer>
</div>

</body>
</html>
