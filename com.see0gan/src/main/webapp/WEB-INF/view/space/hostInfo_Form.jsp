<%@page import="com.see0gan.space.vo.SP_BasicInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>  
<%@ page import="com.see0gan.login.vo.HostVO" %>
<%@ page import="com.see0gan.space.vo.SP_BasicInfoVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sp_common.css">
<title>HOST INFO</title>
<% 
HttpSession httpSession = request.getSession(true);

String tbsp_num = (String) httpSession.getAttribute("tbsp_num");

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
HostVO hvo = null;
if(svo == null){
	hvo = (HostVO) httpSession.getAttribute("HostVO");
	if(hvo == null){
	%>
	<script>alert("로그인 : false"); </script>
<% }
}

else {%>
<script>alert("로그인 : true"); </script>
<%
	} 
%>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click", "#saveBtn", function(){
		console.log("saveBtn >>> : ");
		
		$('#hostInfoInsert').attr({
			'action':'hostInfo_Insert.sgg',
			'method':'POST',
			'enctype':'application/x-www-form-urlencoded'
		}).submit();
	});
});
</script>
</head>
<body>
<!-- 컨트롤러에서 모델객체로 넘긴 호스트테이블의 데이터 받기 -->
<%-- <%
	Object obj = request.getAttribute("listH");
	List<HostVO> list = (List)obj;
	HostVO hostVO = null;
	if(list.size() == 1) {
		hostVO = list.get(0);
		System.out.println("hostInfo_Insert > hostVO.getHostNum() >>> :" + hostVO.getTBH_NUM());
	};
%> --%>
<%-- <%
	Object obj2 = request.getAttribute("listS");
	List<SP_BasicInfoVO> list2 = (List)obj2;
	SP_BasicInfoVO bvo = null;
	if(list2.size() == 1) {
		bvo = list2.get(0);
		System.out.println("hostInfo_Insert > bvo.getTbsp_num() >>> :" + bvo.getTbsp_num());
	};
%> --%>
<div class="wrap">
<header class="header">
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>연락처 정보</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
</header>
<div class="content_wrap">
<div class="heading">
	<h3>연락처 정보	를 입력해주세요.</h3>
	<div class="required">
		<span class="required_s">*</span>
		<span class="required_txt">필수입력</span>
	</div>
</div>
<form name="hostInfoInsert" id="hostInfoInsert">
			
		
	<!-- readonly을 사용해서 hostNum를 사용할 수 없게 만든다.-->
	<input type="hidden" name="tbsp_num" id="tbsp_num" value="<%= tbsp_num %>">
	<input type="hidden" name="tbh_num" id="tbsp_num" value="<%= hvo.getTBH_NUM() %>" >
	<%-- <input type="hidden" name="tbsp_num" id="tbsp_num" value="<%= hostVO.getTbsp_num() %>"> 
	<input type="hidden" name="tbh_num" id="tbh_num" value="session">--%>
		
	<div class="title">이메일<span class="required_s">*</span></div>
	<input type="text" name="tbh_email" id="tbh_email" value="<%= hvo.getTBH_EMAIL() %>" readonly>
	
	<div class="title">휴대폰<span class="required_s">*</span></div>
	<input type="text" name="tbh_phone" id="tbh_phone" size="20">
	
	<div class="title">대표전화<span class="required_s">*</span></div>
	<input type="text" name="tbsp_tel" id="tbsp_tel" size="20">
	
	<div class="sp_btn_bottom">
		<span class="btn_wrap">
			<input type="button" class="btn_prev" value="이전">
		</span>
		<span class="btn_wrap">
			<input type="button" class="btn_next" id="saveBtn" value="저장">
		</span>
	</div>	
	</form>
</div>
</div>
</body>
</html>