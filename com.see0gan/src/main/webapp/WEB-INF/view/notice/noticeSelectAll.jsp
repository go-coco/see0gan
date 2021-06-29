<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO" %> 
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공간 공지사항</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
	
		// 공지 등록(I)
		$(document).on("click", "#I", function() {
			location.href="noticeForm.sgg";
		});
		
		// 공지 조회(S)
		$(document).on("click", "#S", function() {
			location.href="noticeSelect.sgg";
		});
		
		// 공지 수정(U)
		$(document).on("click", "#U", function() {
			location.href="noticeUpdate.sgg";
		});
		
		// 공지 삭제(D)
		$(document).on("click", "#D", function() {
			location.href="noticeDelete.sgg";
		});
		
	})

</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listAll");
	List<MypageVO> list = (List)obj;
	
	int nCnt = list.size();
%>

<form name="NoticeList" id="NoticeList">
<table class="table table-striped" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>공지 게시판</h2>
	</td>
</tr>
<tr>
	<td class="tt">공지번호</td>
	<td class="tt">공지유형</td>
	<td class="tt">공지제목</td>
	<td class="tt">공지내용</td>
	<td class="tt">등록일자</td>
</tr>
</thead>

<%
for(int i=0; i<nCnt; i++){
	MypageVO nvo = list.get(i);
%>
<tbody>
<tr>
	<td class="tt"><%=nvo.getNtnum() %></td>
	<td class="tt"><%=nvo.getNttype() %></td>
	<td class="tt"><%=nvo.getNtsubject() %></td>
	<td class="tt"><%=nvo.getNtcontent() %></td>
	<td class="tt"><%=nvo.getNtinsertdate() %></td>
</tr>
<%
} // end of for
%>
<tr>
	<td colspan="10" align="right">
		<input type="button" value="공지작성" id="I">
		<input type="button" value="내용보기" id="S">
	</td>
</tr>	
</tbody>
</table>
</form>
</body>
</html>