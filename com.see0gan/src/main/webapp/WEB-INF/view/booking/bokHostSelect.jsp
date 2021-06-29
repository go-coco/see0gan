<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.booking.vo.BookingVO" %>
<%@ page import="java.util.List" %>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bokHostSelect</title>

<% 
HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/booking.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/resources/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$(".checkbox_group").on("click", "#check_all", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});

	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;

	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });

	    $("#check_all").prop("checked", is_checked);
	});
	
	$(".title").click(function(){
		  $(this).next(".con").slideToggle();
	});
// 	$(".title").click(function(){
// 		  $(this).next(".con").slideToggle();
// 	});
	
	$("#payment").click(function(){
		if($("#card").is(":checked") ==false && $("#trans").is(":checked") ==false){
			alert("결제 수단을 선택해주세요");
			return;
		}
		if($("#tbu_name").val() == ""){
			alert("예약자 정보는 필수 입력입니다.");
			$("#tbu_name").focus();
			return;
		}
		if($("#tbu_phone").val() == ""){
			alert("예약자 정보는 필수 입력입니다.");
			$("#tbu_phone").focus();
			return;
		}
		if($("#check_1").is(":checked") ==false || $("#check_2").is(":checked") == false){
			alert("필수 약관에 동의하세요");
			return;
		}
		if($("#check_1").is(":checked") ==true && $("#check_2").is(":checked") == true){
			$("#bokInsert").attr({
				action : "/payment/payment.sgg",
				method : "POST",
				enctype : "application/x-www-form-urlencoded"
			}).submit();
		}
		
		
		
		
	});
	$("#Cancel").click(function(){
		window.history.go(-1);
	});
});

function checkOnly(chk){
	
    var obj = document.getElementsByName("chkInBno");
    for(var i=0; i < obj.length; i++){ 
    	//alert("obj["+i+"].checked >>> : " + obj[i].checked);
        if(obj[i] != chk){
        	obj[i].checked = false;
        }       
    }
	console.log($(chk).val());
	document.getElementById("tbsp_pay_method").value = $(chk).val();
}


	
</script>
<%
	Object obj = request.getAttribute("listH");
	
	Object obj2 = request.getAttribute("listBooking");
	
	List<BookingVO> list = (List)obj;
	BookingVO bkvo = null;
	if (list.size() == 1) {
		bkvo = list.get(0);
	};
	BookingVO _bkvo = null;
	List<BookingVO> listBooking = (List)obj2;
	if (list.size() == 1) {
		_bkvo = listBooking.get(0);
	};


%>
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
<div class="content_wrap">
<section id="sp_contents" class="sp_contents">
<form class="formWidth" name="bookingForm" id="bokInsert">

	<div class="heading">
				<h4>예약공간</h4>
	</div>
	<div class="context-wrapper">
		<div class="flex_wrap">
			<div class="space_photo " style="background-image:url(/resources/img/<%= bkvo.getTbsp_img1()%>)"></div> 
			
			<div class="spaceInfo">
				<ul class="list_detail">
					<li>
						<span class="tit">공간 이름 </span>
						<span class="data"><%= bkvo.getTbsp_name()%></span>
					</li>
					<li>
						<span class="tit">공간 유형</span>
						<span class="data"><%= bkvo.getTbsp_type() %></span>
					</li>
					<li>
						<span class="tit">예약 날짜</span>
						<span class="data">
						<%= _bkvo.getTbsp_bok_date() %>
						</span>
						&nbsp;&nbsp;/ &nbsp;&nbsp;
						<span class="data">
						<%= _bkvo.getTbsp_bok_time_s()%>
						</span>
						 ~ 
						 <span class="data">
						 <%= _bkvo.getTbsp_bok_time_e()%>
						</span>
					</li>
					<li>
						<span class="tit">예약 인원</span>
						<span class="data" name="getBookingVOList[0].tbsp_bok_person" id="tbsp_bok_person" value="<%= _bkvo.getTbsp_bok_person()%>">
						<%= _bkvo.getTbsp_bok_person()%> 명
						</span>
					</li>
					<li>
						<span class="tit">결제 예정 금액</span>
						<span class="data" name="getBookingVOList[0].payamount" id="payamount" value="<%= _bkvo.getPayamount()%>">
						<%= _bkvo.getPayamount()%> 원
						</span>
					</li>
					<li>
						<span class="tit">결제방법<span class="required"> *</span></span>
						
						<span class="data">
						<label><input type="checkbox" name="chkInBno" id="card" onclick="checkOnly(this)" value="카드결제">카드결제</label>
						<label><input type="checkbox" name="chkInBno" id="trans" onclick="checkOnly(this)" value="계좌이체">계좌이체</label>
						</span>
					</li>
				</ul>
			</div>
			<article class="box_form">
				<div class="heading agree_con">
					<h4>예약자 정보</h4>
					<span class="required">*</span>
				</div>
				<div class="spaceInfo">
				<ul class="list_detail">
					<li>
						<span class="tit">예약자</span>
						<span class="data">
							<input class ="input_info" type="text" name="getBookingVOList[0].tbu_name" id="tbu_name"/>
						</span>
					</li>
					<li>
						<span class="tit">연락처</span>
						<span class="data">
							<input class ="input_info" type="text"  name="getBookingVOList[0].tbu_phone" id="tbu_phone"/>
						</span>
					</li>
				</ul>
				</div>
			</article>
			
			<article class="box_form">
				<div class="heading agree_con">
					<h4>호스트 정보</h4>
				</div>
				<div class="spaceInfo">
				<ul class="list_detail">
					<li>
						<span class="tit">공간상호</span>
						<span class="data" name="getBookingVOList[0].tbc_name" id="tbsp_bok_person" value="<%= bkvo.getTbc_name()%>">
							<%= bkvo.getTbc_name()%>
						</span>
					</li>
					<li>
						<span class="tit">대표자명</span>
						<span class="data" value="<%= bkvo.getTbc_ceo()%>">
							<%= bkvo.getTbc_ceo()%>
						</span>
					</li>
					<li>
						<span class="tit">사업자번호</span>
						<span class="data" value="<%= bkvo.getTbc_res_num()%>">
							<%= bkvo.getTbc_res_num()%>
						</span>
					</li>
					<li>
						<span class="tit">연락처</span>
						<span class="data">
							<%= bkvo.getTbh_phone()%>&nbsp; &nbsp;<%= bkvo.getTbh_email()%>
						</span>
					</li>
					
				</ul>
				</div>
			</article>
			<div class="heading agree_con">
				<h4>예약시 주의사항</h4>
			</div>
			<article class="box_form caution">
				<%= bkvo.getTbsp_caution()%>
			</article>
			<article class="checkbox_group">
				<div class="heading agree_con">
					<h4>서비스 동의</h4><label for="check_all">
					<span class="required">*</span>
					<input type="checkbox" id="check_all" >전체 동의</label>
				</div>
				<div class="chklist">
				<label class="chklist" for="check_1"><input type="checkbox" id="check_1" class="normal" > 위 공간의 예약조건 확인 및 결제진행 동의 (필수)</label><br><hr>
				</div>
				<div class="chklist">
				<label class="chklist" for="check_2"><input type="checkbox" id="check_2" class="normal" > 개인정보 제3자 제공 동의 (필수)</label>
				<span class="title" id="showCon"> [내용보기]</span>
				<div class="con">
				<hr >
				<span class="agree">
				 		1. 개인정보를 제공받는 자: 해당 공간의 호스트<br><br>
						&nbsp;&nbsp;2. 제공하는 개인정보 항목<br><br>
						&nbsp;&nbsp;- 필수항목: 네이버 아이디, 이름, 연락처, 결제정보(결제방식 및 결제금액)<br><br>
						&nbsp;&nbsp;- 선택항목: 이메일 주소<br><br>
						&nbsp;&nbsp;3. 개인정보의 제공목적: 공간예약 및 이용 서비스 제공, 환불처리<br><br>
						&nbsp;&nbsp;4. 개인정보의 제공기간: 서비스 제공기간(단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우에는 해당 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기간 동안 보관합니다.<br><br>
						&nbsp;&nbsp;5. 개인정보의 제공을 거부할 권리: 개인정보 주체는 개인정보의 제공을 거부할 권리가 있으나, 공간 예약을 위해 반드시 필요한 개인<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보의 제공으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.<br>
				 </span>
				 </div>
				 <hr>
				</div>
				
				<div class="chklist">
				<label class="chklist" for="check_2"><input type="checkbox" id="check_2" class="normal" > 개인정보 수집 및 이용 동의</label>
				<span class="title" id="showCon2"> [내용보기]</span>
				<div class="con">
				<hr >
				<span class="agree">
				 		1. 수집하는 개인정보의 항목 <br><br>
						&nbsp;&nbsp;- 예약정보(성명, 이메일주소, 휴대전화번호), 결제정보(신용카드 번호 및 은행계좌정보 일부 등)<br><br>
						
						&nbsp;&nbsp;2. 개인정보의 이용목적<br><br>
						&nbsp;&nbsp;- 공간 예약 및 이용<br><br>
						
						&nbsp;&nbsp;3. 개인정보의 보관기간<br><br>
						&nbsp;&nbsp;- 예약 완료 후 관련 법령에 따라 5년간 개인정보를 보관합니다.<br><br>
						
						&nbsp;&nbsp;4. 개인정보의 수집 및 이용을 거부할 권리<br><br>
						&nbsp;&nbsp;- 개인정보 주체는 개인정보의 수집 및 이용을 거부할 권리가 있으나, 공간 예약을 위한 최소한의 개인정보 수집으로서 이를 거부할 시<br>
						&nbsp;&nbsp;공간 예약이 어려울 수 있습니다.<br>
				 </span>
				 </div>
				 <hr>
				</div>
				 
			</article>
			
		</div>
		<div class ="sp_btn_bottom">
	    	<span class="btn_wrap">
				<input class="btn_prev" type="button" id="Cancel" value="취소하기"/>
			</span>
			<span class="btn_wrap">
				<input class="btn_next" type="button" id="payment" value="결제하기"/>
			</span>
	    </div>
	</div>

	<div>
		<input type="hidden" name="getBookingVOList[0].tbsp_num" id="tbsp_num" value="<%= bkvo.getTbsp_num()%>" />
		<input type="hidden" name="getBookingVOList[0].book01" id="bookTime1" value="<%= _bkvo.getBook01() %>"/>
		<input type="hidden" name="getBookingVOList[0].book02" id="bookTime2" value="<%= _bkvo.getBook02() %>"/>
		<input type="hidden" name="getBookingVOList[0].book03" id="bookTime3" value="<%= _bkvo.getBook03() %>"/>
		<input type="hidden" name="getBookingVOList[0].book04" id="bookTime4" value="<%= _bkvo.getBook04() %>"/>
		<input type="hidden" name="getBookingVOList[0].book05" id="bookTime5" value="<%= _bkvo.getBook05() %>"/>
		<input type="hidden" name="getBookingVOList[0].book06" id="bookTime6" value="<%= _bkvo.getBook06() %>"/>
		<input type="hidden" name="getBookingVOList[0].book07" id="bookTime7" value="<%= _bkvo.getBook07() %>"/>
		<input type="hidden" name="getBookingVOList[0].book08" id="bookTime8" value="<%= _bkvo.getBook08() %>"/>
		<input type="hidden" name="getBookingVOList[0].book09" id="bookTime9" value="<%= _bkvo.getBook09() %>"/>
		<input type="hidden" name="getBookingVOList[0].book10" id="bookTime10" value="<%= _bkvo.getBook10() %>"/>
		<input type="hidden" name="getBookingVOList[0].book11" id="bookTime11" value="<%= _bkvo.getBook11() %>"/>
		<input type="hidden" name="getBookingVOList[0].book12" id="bookTime12" value="<%= _bkvo.getBook12() %>"/>
		<input type="hidden" name="getBookingVOList[0].book13" id="bookTime13" value="<%= _bkvo.getBook13() %>"/>
		<input type="hidden" name="getBookingVOList[0].book14" id="bookTime14" value="<%= _bkvo.getBook14() %>"/>
		<input type="hidden" name="getBookingVOList[0].book15" id="bookTime15" value="<%= _bkvo.getBook15() %>"/>
		<input type="hidden" name="getBookingVOList[0].book16" id="bookTime16" value="<%= _bkvo.getBook16() %>"/>
		<input type="hidden" name="getBookingVOList[0].book17" id="bookTime17" value="<%= _bkvo.getBook17() %>"/>
		<input type="hidden" name="getBookingVOList[0].book18" id="bookTime18" value="<%= _bkvo.getBook18() %>"/>
		<input type="hidden" name="getBookingVOList[0].book19" id="bookTime19" value="<%= _bkvo.getBook19() %>"/>
		<input type="hidden" name="getBookingVOList[0].book20" id="bookTime20" value="<%= _bkvo.getBook20() %>"/>
		<input type="hidden" name="getBookingVOList[0].book21" id="bookTime21" value="<%= _bkvo.getBook21() %>"/>
		<input type="hidden" name="getBookingVOList[0].book22" id="bookTime22" value="<%= _bkvo.getBook22() %>"/>
		<input type="hidden" name="getBookingVOList[0].book23" id="bookTime23" value="<%= _bkvo.getBook23() %>"/>
		<input type="hidden" name="getBookingVOList[0].book24" id="bookTime24" value="<%= _bkvo.getBook24() %>"/>
		<input type="hidden" name="getBookingVOList[0].tbsp_capacity" id="tbsp_capacity" value="<%= _bkvo.getTbsp_capacity() %>"/>
		
		<input type="hidden" name="getBookingVOList[0].tbsp_name"  id="tbsp_name" value="<%= bkvo.getTbsp_name()%>" />
		<input type="hidden" name="getBookingVOList[0].tbsp_bok_date" id="tbsp_bok_date" value="<%= _bkvo.getTbsp_bok_date() %>" />
		<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_s" id="tbsp_bok_time_s"value="<%= _bkvo.getTbsp_bok_time_s()%>" />
		<input type="hidden" name="getBookingVOList[0].tbsp_bok_time_e" id="tbsp_bok_time_e"value="<%= _bkvo.getTbsp_bok_time_e()%>" />
		<input type="hidden" name="getBookingVOList[0].tbsp_bok_person" id="tbsp_bok_person" value="<%= _bkvo.getTbsp_bok_person()%>" />
		<input type="hidden" name="getBookingVOList[0].payamount" id="payamount" value="<%= _bkvo.getPayamount()%>"/>
		<input type="hidden" name="getBookingVOList[0].tbsp_pay_method" id="tbsp_pay_method" value=""/>
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