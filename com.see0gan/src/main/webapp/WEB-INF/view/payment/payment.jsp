<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.payment.vo.PaymentVO" %>
<%@ page import="com.see0gan.booking.vo.BookingVO" %>
<%@ page import="java.util.List" %>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 확인</title>
<% 
	request.setCharacterEncoding("UTF-8");
	HttpSession httpSession = request.getSession(true);
	
	GuestVO svo = (GuestVO) httpSession.getAttribute("user");


	Object obj = request.getAttribute("listBooking");
	List<BookingVO> listBooking = (List)obj;
	BookingVO bkvo = null;
	if (listBooking.size() == 1) {
		bkvo = listBooking.get(0);
	};

%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="stylesheet" href="/resources/css/common.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
		
	$("#paymentPop").click(function(){ 								 		//결제 실행
			 var result = confirm('결제를 진행하시겠습니까?'); 

			 if(result) {
				 console.log("insert >>> : " + $("#tbsp_pay_method").val());
					if("카드결제" == $("#tbsp_pay_method").val()){
			    		var tbsp_pay_method = "card";
			    	}else if ("계좌이체" == $("#tbsp_pay_method").val()){
			    		var tbsp_pay_method = "trans";
			    	} // 결제 방법 설정
					
					var IMP = window.IMP; // 생략가능
					IMP.init('imp58002576');								// 아임포트 관리자 키
					IMP.request_pay({										// 아임포트 결제 요청
					    pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : tbsp_pay_method,
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명 : 예약('.concat($("#tbsp_name").val()).concat(")"),
					    popup : true,
					    amount : <%= bkvo.getPayamount() %>,
					    buyer_name : '<%= bkvo.getTbu_name()%>',
					    buyer_tel : '<%= bkvo.getTbu_phone()%>',
					    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	console.log("insert >>> : ");
					    	console.log("rsp.pay_method >>> : " + rsp.pay_method);
					    	
					    	/* var method = "point";
					    	console.log("method >>> : " + method); */
					    	
					    	console.log("Typeof(rsp.pay_method) >>> : " + typeof(rsp.pay_method));
					    	console.log(String(rsp.pay_method));
					    	console.log(String(rsp.pay_method).value);
					    	if("point" == String(rsp.pay_method)){
					    		var method = "card";
					    	}
					    	
					    	var paymentURL = "/payment/paymentInsert.sgg";
					    	var reqType = "POST";
					    	var dataParam = {
					    		tbsp_pay_amount : rsp.paid_amount,
					    		tbsp_pay_method : method,
					    		tbsp_pay_status : rsp.status,
					    		tbu_name : rsp.buyer_name,
					    		tbu_phone : rsp.buyer_tel 
					       	}
					    	console.log("dataParma" + dataParam);
					    	$.ajax({
					    		url : paymentURL,
					    		type : reqType,
					    		data : dataParam,
					    		success : whenSuccess
					    	});
					    	
					    	function whenSuccess(resData){
					    		$("#paymentForm").attr({
									action : "/booking/bookingInsert.sgg",
									method : "POST",
									enctype : "application/x-www-form-urlencoded"
								}).submit();
					    		
					    	} // end of whenSuccess()
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        alert(msg);
					    } // 결제 실패시 

				 	}); // end of function(rsp) 
			 }else { 

			} 
		
		});
		
		
		$("#Cancel").click(function(){
			window.history.go(-1);
		});
	});
		
			
</script>
</head>
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

<form name="paymentForm" id="paymentForm">
<h2 class="heading--new">결제하기</h2>
<div class="pay_info">
<article class="box_form">
			<div class="spaceInfo">
			<ul class="list_detail">
				<li>
					<span class="tit">공간명</span>
					<span class="data" >
						<%= bkvo.getTbsp_name() %>
					</span>
				</li>
				<li>
					<span class="tit">예약날짜</span>
					<span class="data" >
						<%= bkvo.getTbsp_bok_date() %>
					</span>
				</li>
				<li>
					<span class="tit">예약시간</span>
					<span class="data" >
					<%= bkvo.getTbsp_bok_time_s()%>
					</span>
					 ~ 
					 <span class="data">
					 <%= bkvo.getTbsp_bok_time_e()%>
					</span>
				</li>
				<li>
					<span class="tit">결제 예정 금액</span>
					<span class="data">
						<%= bkvo.getPayamount() %>
					</span>
				</li>
				<li>
					<span class="tit">결제 방법</span>
					<span class="data" >
						<%= bkvo.getTbsp_pay_method() %>
					</span>
				</li>
				
			</ul>
			<div class ="sp_btn_bottom">
    	<span class="btn_wrap">
			<input class="btn_prev" type="button" id="Cancel" value="취소하기"/>
		</span>
		<span class="btn_wrap">
			<input class="btn_next" type="button" id="paymentPop" value="결제하기"/>
		</span>
    </div>
			</div>
		</article>
	
</div>


<input type="hidden" name="getBookingVOList[0].tbsp_num" id="tbsp_num" value="<%= bkvo.getTbsp_num() %>" />
	<input type="hidden" name="getBookingVOList[0].book01" id="bookTime1" value="<%= bkvo.getBook01() %>"/>
	<input type="hidden" name="getBookingVOList[0].book02" id="bookTime2" value="<%= bkvo.getBook02() %>"/>
	<input type="hidden" name="getBookingVOList[0].book03" id="bookTime3" value="<%= bkvo.getBook03() %>"/>
	<input type="hidden" name="getBookingVOList[0].book04" id="bookTime4" value="<%= bkvo.getBook04() %>"/>
	<input type="hidden" name="getBookingVOList[0].book05" id="bookTime5" value="<%= bkvo.getBook05() %>"/>
	<input type="hidden" name="getBookingVOList[0].book06" id="bookTime6" value="<%= bkvo.getBook06() %>"/>
	<input type="hidden" name="getBookingVOList[0].book07" id="bookTime7" value="<%= bkvo.getBook07() %>"/>
	<input type="hidden" name="getBookingVOList[0].book08" id="bookTime8" value="<%= bkvo.getBook08() %>"/>
	<input type="hidden" name="getBookingVOList[0].book09" id="bookTime9" value="<%= bkvo.getBook09() %>"/>
	<input type="hidden" name="getBookingVOList[0].book10" id="bookTime10" value="<%= bkvo.getBook10() %>"/>
	<input type="hidden" name="getBookingVOList[0].book11" id="bookTime11" value="<%= bkvo.getBook11() %>"/>
	<input type="hidden" name="getBookingVOList[0].book12" id="bookTime12" value="<%= bkvo.getBook12() %>"/>
	<input type="hidden" name="getBookingVOList[0].book13" id="bookTime13" value="<%= bkvo.getBook13() %>"/>
	<input type="hidden" name="getBookingVOList[0].book14" id="bookTime14" value="<%= bkvo.getBook14() %>"/>
	<input type="hidden" name="getBookingVOList[0].book15" id="bookTime15" value="<%= bkvo.getBook15() %>"/>
	<input type="hidden" name="getBookingVOList[0].book16" id="bookTime16" value="<%= bkvo.getBook16() %>"/>
	<input type="hidden" name="getBookingVOList[0].book17" id="bookTime17" value="<%= bkvo.getBook17() %>"/>
	<input type="hidden" name="getBookingVOList[0].book18" id="bookTime18" value="<%= bkvo.getBook18() %>"/>
	<input type="hidden" name="getBookingVOList[0].book19" id="bookTime19" value="<%= bkvo.getBook19() %>"/>
	<input type="hidden" name="getBookingVOList[0].book20" id="bookTime20" value="<%= bkvo.getBook20() %>"/>
	<input type="hidden" name="getBookingVOList[0].book21" id="bookTime21" value="<%= bkvo.getBook21() %>"/>
	<input type="hidden" name="getBookingVOList[0].book22" id="bookTime22" value="<%= bkvo.getBook22() %>"/>
	<input type="hidden" name="getBookingVOList[0].book23" id="bookTime23" value="<%= bkvo.getBook23() %>"/>
	<input type="hidden" name="getBookingVOList[0].book24" id="bookTime24" value="<%= bkvo.getBook24() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_person" id="tbsp_bok_person" value="<%= bkvo.getTbsp_bok_person()%>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_capacity" id="tbsp_capacity" value="<%= bkvo.getTbsp_capacity() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbu_name" id="" value="<%= bkvo.getTbu_name()%>"/>
	<input type="hidden" name="getBookingVOList[0].tbu_phone" id="" value="<%= bkvo.getTbu_phone()%>"/>
	
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_date" id="tbsp_bok_date" value="<%= bkvo.getTbsp_bok_date() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_s" id="tbsp_bok_time_s" value="<%= bkvo.getTbsp_bok_time_s() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_e" id="tbsp_bok_time_e" value="<%= bkvo.getTbsp_bok_time_e() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_name" id="tbsp_name" value="<%= bkvo.getTbsp_name() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_pay_amount" id="tbsp_pay_amount" value="<%= bkvo.getPayamount() %>"/>
	<input type="hidden" name="getBookingVOList[0].tbsp_pay_method" id="tbsp_pay_method" value="<%= bkvo.getTbsp_pay_method() %>"/>

	<input type="hidden" name="getBookingVOList[0].tbu_guestid" id="" value="<%= svo.getTBU_GUESTID()%>"/>

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