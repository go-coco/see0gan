<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.see0gan.login.vo.GuestVO"%>

<% 
HttpSession httpSession = request.getSession(true);
GuestVO svo = (GuestVO) httpSession.getAttribute("user");
if(svo == null){
	response.sendRedirect("logout.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/logjoin.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	$(document).ready(function(){
		$("#myUpdateOK").click(function(){
			if(confirm("수정하시겠습니까?")){
				document.myInfoForm.action="${path}/guest/guestUpdate.sgg";
				document.myInfoForm.submit();
			}
		});
		
		$("#myDeleteOK").click(function(){
			if(confirm("정말 삭제하시겠습니까?")){
				document.myInfoForm.action="${path}/guest/guestDelete.sgg";
				document.myInfoForm.submit();
			}
		});
	});
</script>
<style>
	.content_wrapper {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-bottom: 300px;
	}
	.myinfo_func {
		width: 405px;
		display: flex;
		justify-content: flex-end;
		margin-top: 10px;
	}
	.sitebtn {
		margin-left: 8px;
		width: 55px;
		height: 32px;
		font-size: 15px;
	}
	.row_name {
		color: white;
		background-color: #4d4e50;
		width: 130px;
		height: 40px;
		text-align: center;
		font-size: 18px;
	}
	.input_form {
		border: none;
		width: 260px;
		font-size: 16px;
		height: 40px;
		padding-left: 10px;
	}
	.btn_logout {
		width: 80px;
	}
</style>
</head>
<body>

<div class="myinfo_contents">
<header class="header">
	<%@include file="../../../WEB-INF/view/common/header.jsp" %>

</header>
<form id="myInfoForm" name="myInfoForm" method="post">
<input type="hidden" name="TBU_GUESTID" id="TBU_GUESTID" value="<%=svo.getTBU_GUESTID()%>"/>
<div class="content_wrapper">
<h2 style="font-size: 30px; margin-top: 50px; text-align: center; font-style: italic;">회원정보 수정</h2>
<div class="myinfo_form">
	<div class="myinfo_center">
<table>
	<tr>
		<td class="row_name">이메일</td>
		<td><span><input class="input_form" type="text" name="TBU_EMAIL" id="TBU_EMAIL" value="<%=svo.getTBU_EMAIL() %>" readonly="readonly"/></span></td>
	</tr>
	<tr>
		<td class="row_name">비밀번호</td>
		<td><span><input class="input_form" type="text" name="TBU_PASSWORD" id="TBU_PASSWORD" value="<%=svo.getTBU_PASSWORD() %>"/></span></td>
	</tr>
	<tr>
		<td class="row_name">이름</td>
		<td><span><input class="input_form" type="text" name="TBU_NICKNAME" id="TBU_NICKNAME" value="<%=svo.getTBU_NICKNAME() %>"/></span></td>
	</tr>
	<tr>
		<td class="row_name">연락처</td>
		<td><span><input class="input_form" type="text" name="TBU_PHONE" id="TBU_PHONE" value="<%=svo.getTBU_PHONE() %>" readonly="readonly"></span></td>
		<%
	// 전화번호.
	String phone = svo.getTBU_PHONE();
	// - 로 나눈 전화번호.
	String phone0="";
	String phone1="";
	String phone2="";
	String rePhone="";
	// 있을 경우 그냥하고 없을경우 삽입.
	int ynBar = phone.indexOf("-");
	if(ynBar>0){
%>
			<%-- <td><span><input type="text" name="TBU_PHONE" id="TBU_PHONE" value="<%=svo.getTBU_PHONE() %>" disabled></span></td> --%>
<%	
	}else{
		phone0 = phone.substring(0, 3);
		System.out.println("010 : "+phone0);
		phone1 = phone.substring(3, 7);
		System.out.println("XXXX : "+phone1);
		phone2 = phone.substring(7,11);
		System.out.println("XXXX : "+phone2);
		rePhone=phone0+"-"+phone1+"-"+phone2;
%>
			<%-- <td><span><input type="text" name="TBU_PHONE" id="TBU_PHONE" value="<%=rePhone %>"></span></td> --%>
<%
	}
%>	

	</tr>
</table>

	

		</div>
		<div class="myinfo_func">
			<input type="button" onclick="location.href='/logOut.sgg'" value="로그아웃" class="sitebtn btn_logout" >
			<input type="button" value="뒤로" onclick="history.back(-1);" class="sitebtn">
			<input type="submit" value="수정" name="myUpdateOK" id="myUpdateOK" class="sitebtn"/>
			<input type="button" value="탈퇴" name="myDeleteOK" id="myDeleteOK" class="sitebtn"/>		
		</div>
	</div>
</div>
</form>
<footer class="footer">
	<%@include file="../../../WEB-INF/view/common/footer.jsp" %>
</footer>
</div>

</body>
</html>