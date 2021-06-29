<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO" %> 
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">

	$(document).ready(function() {
	
		// 문의 등록(I)
		$(document).on("click", "#I", function() {
			location.href="oneForm.sgg";
		});
		
	})

</script>
<style type="text/css">
	a {
		color: inherit;
		text-decoration: none;
	}
</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listAll");
	List<MypageVO> list = (List)obj;
	
	int nCnt = list.size();
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
<form name="OneList" id="OneList">
<table class="table table-striped" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>나의 문의내역</h2>
	</td>
</tr>
<tr style="color: white; background-color: #4d4e50; font-size: 20px; text-align: center;" height="50px;"> 
	<td class="tt">문의번호</td>
	<td class="tt">작성자</td>
	<td class="tt">문의내용</td>
	<td class="tt">등록일자</td>
</tr>
</thead>

<%
if (nCnt > 0) {
	for(int i=0; i<nCnt; i++){
	MypageVO mpvo = list.get(i);
%>
<tbody>
<tr height="30px;">
	<td class="tt"><%=mpvo.getOnenum() %></td>
	<td class="tt"><%=mpvo.getOnemnum() %></td>
	<td class="tt">
		<a href="oneSelect.sgg?onenum=<%= mpvo.getOnenum() %>"><%=mpvo.getOnecontent() %></a></td>
	<td class="tt"><%=mpvo.getOneinsertdate() %></td>
</tr>
<%
	} // end of for
} else {
%>
<tr>
	<td colspan="10" align="center">등록된 문의글이 존재하지 않습니다.</td>
</tr>
<%
} // end of if
%>
<tr>
	<td colspan="10" align="right">
		<input type="button" value="문의작성" id="I">
	</td>
</tr>	
</tbody>
</table>
</form>
</body>
</html>