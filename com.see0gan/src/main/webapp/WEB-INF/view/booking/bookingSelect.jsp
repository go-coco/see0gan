<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.booking.vo.BookingVO" %>
<%@ page import="java.util.List" %>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>   
<%@ page import= "com.see0gan.login.vo.HostVO" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/resources/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
<% 
HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");

	Object obj = request.getAttribute("listS");
	List<BookingVO> list = (List)obj;
	BookingVO bkvo = null;
	if (list.size() == 1) {
		bkvo = list.get(0);
	};

int dateoff = 0;
System.out.println(bkvo.getTbsp_dayoff2());

if("월요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 1;
}else if("화요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 2;
}else if("수요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 3;
}else if("목요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 4;
}else if("금요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 5;
}else if("토요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 6;
}else if("일요일".equals(bkvo.getTbsp_dayoff2())){
	dateoff = 0;
}

%>
<script type="text/javascript">

$(document).ready(function(){
	// 조회 버튼 클릭시
	$("#time_Select").click(function(){
		// 날짜 선택기		
		var bokDate = $("#datePicker").val(); 
		var boktimeURL = "/booking/boktime.sgg";
    	var reqType = "POST";
    	var dataParam = {
   			tbsp_num : "<%= bkvo.getTbsp_num()%>",
   			tbsp_bok_date : bokDate
       	}
    	console.log("dataParma" + dataParam);
    	// 해당 날짜 예약 시간 조회
    	$.ajax({
    		url : boktimeURL,
    		type : reqType,
    		data : dataParam,
    		success : whenSuccess
    	});
    	
    	function whenSuccess(data){
    		
    		var book01 = data.data[0].book01;
    		var book02 = data.data[0].book02;
    		var book03 = data.data[0].book03;
    		var book04 = data.data[0].book04;
    		var book05 = data.data[0].book05;
    		var book06 = data.data[0].book06;
    		var book07 = data.data[0].book07;
    		var book08 = data.data[0].book08;
    		var book09 = data.data[0].book09;
    		var book10 = data.data[0].book10;
    		var book11 = data.data[0].book11;
    		var book12 = data.data[0].book12;
    		var book13 = data.data[0].book13;
    		var book14 = data.data[0].book14;
    		var book15 = data.data[0].book15;
    		var book16 = data.data[0].book16;
    		var book17 = data.data[0].book17;
    		var book18 = data.data[0].book18;
    		var book19 = data.data[0].book19;
    		var book20 = data.data[0].book20;
    		var book21 = data.data[0].book21;
    		var book22 = data.data[0].book22;
    		var book23 = data.data[0].book23;
    		var book24 = data.data[0].book24;

    		var arr = [
    				book01,book02,book03,book04,book05,book06,
    				book07,book08,book09,book10,book11,book12,
    				book13,book14,book15,book16,book17,book18,
    				book19,book20,book21,book22,book23,book24];
    		for (var i=0; i<24; i++){
    			if("Y" == arr[i]){
  					<%-- arr[i] = "<li class = 'time_list'><a class='time_box'><span class='time'>"+ i +"</span><span class='price book_able' id='" + (i+1) + "' onclick='timeClick(this)'><%=bkvo.getTbsp_cost()%></span></a></li>" --%>
    				arr[i] = "<td class='price book_able'  id='" + (i+1) + "' onclick='timeClick(this)'><%=bkvo.getTbsp_cost()%></td>"
    				
    			}else if ("N" == arr[i]){
    				<%-- arr[i] = "<li class = 'time_list'><a class='time_box'><span class='time'>"+ i +"</span><span class='price book_able' id='" + (i+1) + "' onclick='timeClick(this)'><%=bkvo.getTbsp_cost()%></span></a></li>" --%>
    				arr[i] = "<td class='price book_disable' id='" + (i+1) + "'></td>"
    			}
    		}
			console.log(arr[0]);
    		
			
    		$("#boktimeTrShow").children().remove();
    		var tag = null;
    		for (var i=0; i<24; i++){
    			tag += arr[i];
    		}
           	
     	  console.log(tag);
   	      $("#boktimeTrShow").append(tag);
    	}
		
	});
	
	var datePicker = $("#datePicker").datepicker({
		showOtherMonths: true,
	    selectOtherMonths: true,
	    minDate : -0,
	    maxDate : +365,
	    beforeShowDay: function(date){
			var day = date.getDay();
		<%-- 	return [(day != <%= dateoff %>)]; --%>

			var dateRange= [];
		    var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);

		    var startdate = "<%= bkvo.getTbsp_dayoff_start()%>";
		    
		    var enddate = "<%= bkvo.getTbsp_dayoff_end()%>";

		    for (var d = new Date(startdate); d <= new Date(enddate); d.setDate(d.getDate() + 1)) {
		          dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
		    }
		    return [dateRange.indexOf(dateString) == -1 &&  (day != <%= dateoff %>) ];
	    },
	    monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
		monthNamesShort: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
		dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
		dayNamesShort: [ "일","월","화","수","목","금","토" ],
		dayNamesMin: [ "일","월","화","수","목","금","토" ],
		yearSuffix: "년"
	});
	$("#refresh").click(function(){
		startTime = "";
		endTime = "";
		payamount = 0;
		clickedTimes = 0;
 		$(".book_able").removeClass("clicked");
		$("#startTime").html("&nbsp;");
		$("#endTime").html("&nbsp;");
		$("#payamount").html("&nbsp;");
	});
	
	$("#test").click(function(){
		var key =  $("#idVal").attr("name");
		console.log("현재 상태 >>> : " + key);
		if("TBU_EMAIL" == key){
			alert("게스트 로그인 전송");
		}
		if("TBH_EMAIL" == key){
			alert("호스트 로그인 전송");
		}
	});
	
	/* 인원 설정 */
	var spinner = $("#bok_person").spinner({
		min : 1,
		max : <%= bkvo.getTbsp_capacity() %>
	});
	
	/* 예약 정보 전송 */
	$("#booking").click(function(){
		var bookTime01 = "";
		var bookTime02 = "";
		var bookTime03 = "";
		var bookTime04 = "";
		var bookTime05 = "";
		var bookTime06 = "";
		var bookTime07 = "";
		var bookTime08 = "";
		var bookTime09 = "";
		var bookTime10 = "";
		var bookTime11 = "";
		var bookTime12 = "";
		var bookTime13 = "";
		var bookTime14 = "";
		var bookTime15 = "";
		var bookTime16 = "";
		var bookTime17 = "";
		var bookTime18 = "";
		var bookTime19 = "";
		var bookTime20 = "";
		var bookTime21 = "";
		var bookTime22 = "";
		var bookTime23 = "";
		var bookTime24 = "";
		
		
		var bok_time_start = document.getElementById('startTime').innerText;
		var bok_time_end = document.getElementById('endTime').innerText;
		var payamountSubmit = document.getElementById('payamount').innerText;
		
		var arrSubmit = {
			tbsp_num : "<%= bkvo.getTbsp_num() %>",
			bookTime1 : bookTime01,
			bookTime2 : bookTime02,
			bookTime3 : bookTime03,
			bookTime4 : bookTime04,
			bookTime5 : bookTime05,
			bookTime6 : bookTime06,
			bookTime7 : bookTime07,
			bookTime8 : bookTime08,
			bookTime9 : bookTime09,
			bookTime10 : bookTime10,
			bookTime11 : bookTime11,
			bookTime12 : bookTime12,
			bookTime13 : bookTime13,
			bookTime14 : bookTime14,
			bookTime15 : bookTime15,
			bookTime16 : bookTime16,
			bookTime17 : bookTime17,
			bookTime18 : bookTime18,
			bookTime19 : bookTime19,
			bookTime20 : bookTime20,
			bookTime21 : bookTime21,
			bookTime22 : bookTime22,
			bookTime23 : bookTime23,
			bookTime24 : bookTime24,
			payamount : payamountSubmit,
			"bok_person" : spinner.spinner( "value" ),
			"bok_date" : datePicker.val(),
			"bok_time_start" : bok_time_start,
			"bok_time_end" : bok_time_end,
			"tbsp_name" : "<%= bkvo.getTbsp_name()%>",
			"tbsp_img1" : "<%= bkvo.getTbsp_img1()%>",
		};
		for(var i = 1; i < 25; i++){
			var bokTime = "bookTime" + i;
			var hiddenData = "";
			if("price book_able clicked" == $("#"+i).attr("class") || "price book_disable clicked"==$("#"+i).attr("class") || "price book_disable"==$("#"+i).attr("class")){
				arrSubmit[bokTime] = "N";
			}
			else if("price book_able"==$("#"+i).attr("class")){
				arrSubmit[bokTime] = "Y";
			}
			console.log("arrSubmit['bookTime'][" + i + "] >>> : " + arrSubmit[bokTime]);
			
		}
		
		document.getElementById("bookTime1").value = arrSubmit['bookTime1'];
		document.getElementById("bookTime2").value = arrSubmit['bookTime2'];
		document.getElementById("bookTime3").value = arrSubmit['bookTime3'];
		document.getElementById("bookTime4").value = arrSubmit['bookTime4'];
		document.getElementById("bookTime5").value = arrSubmit['bookTime5'];
		document.getElementById("bookTime6").value = arrSubmit['bookTime6'];
		document.getElementById("bookTime7").value = arrSubmit['bookTime7'];
		document.getElementById("bookTime8").value = arrSubmit['bookTime8'];
		document.getElementById("bookTime9").value = arrSubmit['bookTime9'];
		document.getElementById("bookTime10").value = arrSubmit['bookTime10'];
		document.getElementById("bookTime11").value = arrSubmit['bookTime11'];
		document.getElementById("bookTime12").value = arrSubmit['bookTime12'];
		document.getElementById("bookTime13").value = arrSubmit['bookTime13'];
		document.getElementById("bookTime14").value = arrSubmit['bookTime14'];
		document.getElementById("bookTime15").value = arrSubmit['bookTime15'];
		document.getElementById("bookTime16").value = arrSubmit['bookTime16'];
		document.getElementById("bookTime17").value = arrSubmit['bookTime17'];
		document.getElementById("bookTime18").value = arrSubmit['bookTime18'];
		document.getElementById("bookTime19").value = arrSubmit['bookTime19'];
		document.getElementById("bookTime20").value = arrSubmit['bookTime20'];
		document.getElementById("bookTime21").value = arrSubmit['bookTime21'];
		document.getElementById("bookTime22").value = arrSubmit['bookTime22'];
		document.getElementById("bookTime23").value = arrSubmit['bookTime23'];
		document.getElementById("bookTime24").value = arrSubmit['bookTime24'];
		
		document.getElementById("hbok_time_start").value = arrSubmit['bok_time_start'];
		document.getElementById("hbok_time_end").value = arrSubmit['bok_time_end'];
		document.getElementById("hbok_date").value = arrSubmit['bok_date'];
		
		document.getElementById("hpayamount").value = arrSubmit['payamount'];
		document.getElementById("hbok_person").value = arrSubmit['bok_person'];
		
		
		console.log("bok_time_start >>> " + bok_time_start);
		console.log("bok_time_end >>> " + bok_time_end);
		console.log("bok_date >>> " + datePicker.val());
		console.log("arrSubmit['payamount'] >>>" + arrSubmit["payamount"]);
		console.log("bok_person >>> : " + spinner.spinner( "value" ));
		console.log("arrSubmit[bookTime1] >>> : " + arrSubmit['bookTime1']);
		
		if($("#datePicker").val() ==""){
			alert("날짜를 선택해주세요");
			return;
		};
		if(startTime == ""){
			alert("시간을 선택해주세요");
			return;
		}
		$("#bookingForm").attr({
			action : "/booking/bokHostSelect.sgg",
			method : "POST",
			enctype : "application/x-www-form-urlencoded"
		}).submit();
		
	});
	$("#Cancel").click(function(){
		window.history.go(-1);
	});
	
	
});

// 시간 클릭 이벤트
var clickedTimes = 0;

var startTime = "";


function timeClick(e){
	var endTime = "";
	var endTimeMax = "";
	var payamount=0;
	clickedTimes +=1;
	
	if(clickedTimes ==1){
		$(e).toggleClass("clicked");
		startTimeIndex = parseInt($(e).attr('id'))-1;
		endTimeIndex = startTimeIndex;
		if(startTimeIndex < 9){
			startTime += "0";
			endTime += "0";
		}

		startTime += startTimeIndex+":00" ;
		endTime += (startTimeIndex +1) + ":00";
		console.log("startTimeIndex >>> : " + startTimeIndex);

		
	}
	console.log("payamount >>> : " + payamount);
	
	if(clickedTimes >1){
		$(e).toggleClass("clicked");
		endTimeIndex = parseInt($(e).attr('id'))-1;
		if(endTimeIndex < 9){
			endTime += "0";
		}
		endTime += endTimeIndex+ 1 +":00" ;
		
		if(startTimeIndex > endTimeIndex){
			alert("시작시간 보다 종료시간이 빠릅니다.");
			$(e).removeClass("clicked");
			endTime="";
			console.log(" endTimeMax : >>> " + endTimeMax);
		}
		
		
	}
	
	if(endTimeIndex > startTimeIndex){
		var clicked = $(".clicked");
		$(clicked).not(clicked[0]).removeClass("clicked");
		$(e).toggleClass("clicked");
		for ( var i =startTimeIndex+1; i < endTimeIndex+1; i++){
		
			$("#"+i).addClass("clicked");
		}
	}
	
	for(var i=0; i < 24; i++){
		if("price book_able clicked" == $("#"+i).attr("class")){
			payamount += <%=bkvo.getTbsp_cost()%>;
		}
	}
	
	console.log("startTime >>> " + startTime);
	console.log("endTime >>> : " + endTime);
	console.log("payaount >>> : " + payamount);
	
	$("#startTime").html(startTime);
	$("#endTime").html(endTime);
	$("#payamount").html(payamount);
}



</script>	
			
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 

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
<div class="wrap">
<section id="sp_contents" class="sp_contents">
<form class = "formWidth" name="bookingForm" id="bookingForm">

<div class="heading">
			<h3><%= bkvo.getTbsp_name()%></h3>
			<p class="intro1"><%= bkvo.getTbsp_intro1()%></p>
</div>
		<div class="context-wrapper">
			<div class="flex_wrap">
				<div class="space_photo " style="background-image:url(/resources/img/<%= bkvo.getTbsp_img1()%>)"></div> 
				<p class="heading"><%= bkvo.getTbsp_intro2()%></p>
				
				<div>
				<ul class="list_detail">
					<li>
						<span class="tit">공간유형</span>
						<span class="data"><%= bkvo.getTbsp_type()%></span>
					</li>
					<li>
						<span class="tit">시간당금액</span>
						<span class="data"><%= bkvo.getTbsp_cost()%> 원</span>
					</li>
					<li>
						<span class="tit">최대수용인원</span>
						<span class="data"><%= bkvo.getTbsp_capacity()%></span>
					</li>
					<li>
						<span class="tit">이용시간</span>
						<span class="data"><%= bkvo.getTbsp_time_start()%> ~ <%= bkvo.getTbsp_time_end()%></span>
					</li>
				</ul>
				<div class="heading agree_con">
				<h4>예약 정보 입력</h4>
				<span class="required">*</span>
				</div>
				</div>
				<p class="heading">날짜 선택</p> 
					<input type="text" name="date" id="datePicker" size="20">
					<input type="button" id="time_Select" value="조회"/>
					<input type="button" id="refresh" value="새로고침"/>
					<input type="hidden" id="tbsp_dayoff2" value="<%= dateoff%>" />
				
				<div>
				<p class="heading">시간 선택</p>
				
				</div>
				<table class="scrolltable">
							<tr id="boktimeTr"> 
						      <th class="time-range" style="padding : 5px;"><span class="time">00 ~ 01</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">01 ~ 02</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">02 ~ 03</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">03 ~ 04</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">04 ~ 05</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">05 ~ 06</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">06 ~ 07</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">07 ~ 08</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">08 ~ 09</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">09 ~ 10</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">10 ~ 11</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">11 ~ 12</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">12 ~ 13</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">13 ~ 14</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">14 ~ 15</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">15 ~ 16</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">16 ~ 17</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">17 ~ 18</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">18 ~ 19</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">19 ~ 20</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">20 ~ 21</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">21 ~ 22</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">22 ~ 23</span></th>
						      <th class="time-range" style="padding : 5px;"><span class="time">23 ~ 24</span></th>
					        </tr>
					        <tr  class="boktimeTrShow" id="boktimeTrShow"> 
					        
						    </tr>
				</table>
				<div>
				<p class="heading">총 예약인원 <input type="text" class="data" type="text" name="bok_person" id="bok_person"  value="1" readonly/> </p>
				<ul class="list_detail">
					<li>
						<span class="tit">시작시간</span>
						<span class="data" id="startTime">&nbsp;</span>
					</li>
					<li>
						<span class="tit">종료시간</span>
						<span class="data" id="endTime">&nbsp;</span>
					</li>
					<li>
						<span class="tit">금액</span>
						<span class="data" id="payamount">&nbsp;</span>
					</li>
				</ul>
				</div>
			    <div class ="sp_btn_bottom">
			    	<span class="btn_wrap">
						<input class="btn_prev" type="button" id="Cancel"  value="취소하기"/>
					</span>
					<span class="btn_wrap">
						<input class="btn_next" type="button" id="booking" value="예약하기"/>
					</span>
			    </div>
		</div>
	</div>

<div>
	<input type="hidden" name="getBookingVOList[0].book01" id="bookTime1" value=""/>
	<input type="hidden" name="getBookingVOList[0].book02" id="bookTime2" value=""/>
	<input type="hidden" name="getBookingVOList[0].book03" id="bookTime3" value=""/>
	<input type="hidden" name="getBookingVOList[0].book04" id="bookTime4" value=""/>
	<input type="hidden" name="getBookingVOList[0].book05" id="bookTime5" value=""/>
	<input type="hidden" name="getBookingVOList[0].book06" id="bookTime6" value=""/>
	<input type="hidden" name="getBookingVOList[0].book07" id="bookTime7" value=""/>
	<input type="hidden" name="getBookingVOList[0].book08" id="bookTime8" value=""/>
	<input type="hidden" name="getBookingVOList[0].book09" id="bookTime9" value=""/>
	<input type="hidden" name="getBookingVOList[0].book10" id="bookTime10" value=""/>
	<input type="hidden" name="getBookingVOList[0].book11" id="bookTime11" value=""/>
	<input type="hidden" name="getBookingVOList[0].book12" id="bookTime12" value=""/>
	<input type="hidden" name="getBookingVOList[0].book13" id="bookTime13" value=""/>
	<input type="hidden" name="getBookingVOList[0].book14" id="bookTime14" value=""/>
	<input type="hidden" name="getBookingVOList[0].book15" id="bookTime15" value=""/>
	<input type="hidden" name="getBookingVOList[0].book16" id="bookTime16" value=""/>
	<input type="hidden" name="getBookingVOList[0].book17" id="bookTime17" value=""/>
	<input type="hidden" name="getBookingVOList[0].book18" id="bookTime18" value=""/>
	<input type="hidden" name="getBookingVOList[0].book19" id="bookTime19" value=""/>
	<input type="hidden" name="getBookingVOList[0].book20" id="bookTime20" value=""/>
	<input type="hidden" name="getBookingVOList[0].book21" id="bookTime21" value=""/>
	<input type="hidden" name="getBookingVOList[0].book22" id="bookTime22" value=""/>
	<input type="hidden" name="getBookingVOList[0].book23" id="bookTime23" value=""/>
	<input type="hidden" name="getBookingVOList[0].book24" id="bookTime24" value=""/>
	
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_s" id="hbok_time_start" value=""/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_e" id="hbok_time_end" value=""/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_date" id="hbok_date" value=""/>
	<input type="hidden" name="getBookingVOList[0].payamount" id="hpayamount" value=""/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_person" id="hbok_person" value=""/>
	<input type="hidden" name="getBookingVOList[0].tbsp_capacity" id="tbsp_capacity" value="<%= bkvo.getTbsp_capacity() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_num" id="tbsp_num" value="<%= bkvo.getTbsp_num() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbu_guestid" id="tbsp_num" value="<%=  svo.getTBU_GUESTID() %>"/>
	
	

	
</div>
</form>
</section>
</div>
</div>
<div>
<footer class="footer">
	<%@include file="../common/footer.jsp" %>
</footer>
</div>
</body>
</html>