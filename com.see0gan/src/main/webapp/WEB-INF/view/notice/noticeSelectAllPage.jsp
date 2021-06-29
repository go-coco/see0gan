<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.see0gan.mypage.vo.MypageVO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<%
	Object obj2 = request.getAttribute("p_mpvo");
	MypageVO mpvoP = (MypageVO) obj2;
	
	String pageSize = mpvoP.getPagesize();
	String groupSize = mpvoP.getGroupsize();
	String curPage = mpvoP.getCurpage();
	String totalCount = mpvoP.getTotalcount();

	if (request.getParameter("curPage") != null) {
		curPage = request.getParameter("curPage");
	}
%>
<meta charset="UTF-8">
<title>시공간 공지사항</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<style type="text/css">

a {
  color: inherit;
  text-decoration: none;
}
.wrapper {
width: 60%;
}
 table {
    width: 100%;
    border-top: 1px solid #f1f1f1;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #f1f1f1;
    padding: 10px;
  }
	.tt{
		text-align: center;
	}
	
	.section-header {
		position: relative;
		margin-bottom: 40px;
		font-size: 26px;
		font-weight: 400;
		color: #333;
		text-align: Center;
		line-height: 60px;
		letter-spacing: 1px;
	}
	
	.section-header:after {
		content: "";
		display: block;
		position: absolute;
		left: 50%;
		bottom: 0;
		width: 70px;
		height: 2px;
		background: #ff7f00;
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
	}
	
	
	.table.table-hover tbody tr:hover {
    	background-color: #fed636; 
	}
	
	.paging {
		text-align: center;
	}

	.btn {
		display: flex;
		justify-content: flex-end;
		padding: 5px;
	}
</style>
<script type="text/javascript">

	$(document).ready(function() {

		//검색버튼
		$(document).on("click", "#searchBtn", function() {
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({
				"method" : "GET",
				"action" : "noticeSelectAllPage.sgg"
			}).submit();
		});

		// 공지 등록(I)
		$(document).on("click", "#I", function() {
			location.href = "noticeForm.sgg";
		});

	})
</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");%>
	<%
		Object obj = request.getAttribute("listPage");
		List<MypageVO> list = (List) obj;

		int nCnt = list.size();
		System.out.println("noticeSelectAllPage.jsp nCnt >>> : " + nCnt);
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
	<div class="wrapper">
	<form name="NoticeList" id="NoticeList">
		<table class="table table-hover">
			<thead style="width: 60%">
				<tr>
					<td colspan="10" align="center">
						<h2>공지 게시판</h2>
					</td>
				</tr>
				<tr style="background-color: #4d4e50; color: white;">
					<td class="tt">공지번호</td>
					<td class="tt">공지유형</td>
					<td class="tt">공지제목</td>
					<td class="tt">등록일자</td>
				</tr>
			</thead>
			<tbody>
				<%
					if (nCnt > 0) {
						for (int i = 0; i < nCnt; i++) {
						MypageVO mpvo = list.get(i);
				%>
				<tr onclick="location.href='noticeSelect.sgg?ntnum=<%= mpvo.getNtnum() %>'" style="cursor: pointer;">
					<td class="tt"><%= mpvo.getNtnum() %></td>
					<td class="tt"><%= mpvo.getNttype() %></td>
					<td class="tt"><%= mpvo.getNtsubject() %></td>
					<td class="tt"><%= mpvo.getNtinsertdate() %></td>
				</tr>
				<%
					} // end of for
				} else {
				%>
				<tr>
					<td colspan="10" align="center">등록된 게시물이 존재하지 않습니다.</td>
				</tr>

				<%
					} // end of if
				%>
			</tbody>
		</table>
		<div class="btn">
			<span><input type="button" value="공지작성" id="I"></span>
		</div>
		<div class="paging">
			<jsp:include page="../include/paging.jsp" flush="true">
				<jsp:param name="url" value="noticeSelectAllPage.sgg" />
				<jsp:param name="str" value="" />
				<jsp:param name="pageSize" value="<%=pageSize%>" />
				<jsp:param name="groupSize" value="<%=groupSize%>" />
				<jsp:param name="curPage" value="<%=curPage%>" />
				<jsp:param name="totalCount" value="<%=totalCount%>" />
			</jsp:include>
		</div>
	</form>
	</div>
</body>
</html>
