<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONE UPDATE</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">

	$(document).ready(function(){
		
		// U 
		$(document).on("click", "#U", function(){
			$("#OneUpdateForm").attr({
				"method" : "POST",
				"action" : "oneUpdate.sgg",
				"enctype" : "application/x-www-forms"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
			history.go(-1);
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<MypageVO> list = (List)obj;
	MypageVO mpvo = null;
	
	if(list.size() == 1){
		mpvo = list.get(0);
	};
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
<form name="OneUpdateForm" id="OneUpdateForm">
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2>문의 수정하기</h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;">
				<input type="hidden" id="onenum" name="onenum" value="<%=mpvo.getOnenum()%>">		
				</td>
				<td colspan="2" style="vertical-align: middle;">
				<input type="hidden" id="onemnum" name="onemnum" value="<%=mpvo.getOnemnum()%>">		
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="align-middle">내용</td>
				<td>
				<textarea class="form-control" name="onecontent" id="onecontent" rows="10" cols="70"><%=mpvo.getOnecontent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=mpvo.getOneinsertdate()%></span>
				</td>
			</tr>				
			<tr>
				<td colspan="7" align="right">
					<input type="button" class="btn btn-orange" value="수정하기" id="U">
					<input type="button" class="btn btn-orange" value="돌아가기" id="C">
				</td>
			</tr>
	</tbody>
	</table>
	</form>
</body>
</html>