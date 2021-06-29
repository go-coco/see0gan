<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE UPDATE</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<script type="text/javascript">

	$(document).ready(function(){
		
		// U 
		$(document).on("click", "#U", function(){
			$("#NoticeUpdateForm").attr({
				"method" : "POST",
				"action" : "noticeUpdate.sgg",
				"enctype" : "application/x-www-forms"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
			location.href="noticeSelectAllPage.sgg";
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
<form name="NoticeUpdateForm" id="NoticeUpdateForm">
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2>공지 수정하기</h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;">
				<input type="hidden" id="ntnum" name="ntnum" value="<%=mpvo.getNtnum()%>">		
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="align-middle">제목</td>
				<td><input type="text" class="form-control" name="ntsubject" id=""ntsubject"" value="<%=mpvo.getNtsubject()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">내용</td>
				<td>
				<textarea class="form-control" name="ntcontent" id="ntcontent" rows="10" cols="70"><%=mpvo.getNtcontent()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=mpvo.getNtinsertdate()%></span>
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