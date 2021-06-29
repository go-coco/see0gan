<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE : 공지사항 글쓰기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(document).on("click", "#nbtn", function() {
			console.log("nbtn >>> : ");
			$('#NoticeForm').attr({
				'action' : 'noticeInsert.sgg',
				'method' : 'POST',
				'enctype' : 'application/x-www-forms'
			}).submit();
		});

	});
</script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
</head>
<body>
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
	<form action="noticeInsert.sgg" method="POST"
		enctype="multipart/form-data" name="NoticeForm" id="NoticeForm">
		<table class="table">
			<thead>
				<tr>
					<td colspan="2"><h3>공지 게시판 글쓰기</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle">글 유형</td>
					<td><select class="form-select" name=nttype id=nttype>
							<option>글 유형을 선택하세요</option>
							<option>공지사항</option>
							<option>이벤트</option>
							<option>서버점검</option>
					</select></td>
				</tr>
				<tr>
					<td class="align-middle">글제목</td>
					<td><input type="text" class="form-control" name="ntsubject"
						id="ntsubject" size="50"></td>
				</tr>
				<tr>
					<td class="align-middle">글 내용</td>
					<td><textarea class="form-control" name="ntcontent"
							id="ntcontent" cols="60" rows="10"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="boardBut">
			<input type="button" class="btn btn-orange"	value="저장" id="nbtn">
		</div>
	</form>
</body>
</html>