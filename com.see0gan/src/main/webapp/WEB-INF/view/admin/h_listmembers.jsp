<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/view/admin/include/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	 table{
		border-spacing: 50px;
	}
	tr{
		text-align: center;
		
	}
	th{
	padding : 5px 20px 5px 20px;
	background-color: #1b1c1dc7;
	}
	td{
	font-size: 17px;
	padding : 5px 50px 5px 50px;
	word-break:keep-all;
	}
	ul{
		margin: 0px;
		padding: 0px 10px 0px 15px;
	}
	li{
		font-size: 17px;
		margin: 0;
		padding-right:10px;
		border: 0;
		float: left;
	}
	a{
		text-decoration:none ;
		
		color:#000000;
	}
	#chartContainer{
		display: block; 
		padding: 0px;
	}
	.pleft{
	text-align: left;
	}
	.smallul{
	list-style: none;
	}
  </style>		
		
	</head>
	
	<body id="page-top">
		<div id="wrapper">
		
			<%@include file="/WEB-INF/view/admin/include/sidebar.jsp" %>
	
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
				
					<%@include file="/WEB-INF/view/admin/include/topbar.jsp" %>
					
					<!-- Container Fluid 여기다  내용입력 !!!!-->
					<div class="container-fluid" id="container-wrapper">
					
					<center>
					<div class="row">
                    <!-- column -->
                    <div class="col-12">
                      <div class="card">
                        <div class="comment-widgets scrollable">
                             <!--membersList  -->	
						<br><br>
					<h1>호스트 회원 전체 목록</h1>
			
					<center>
					
					<div id="listOrdersByStatus">
					<ul class="smallul"> 
					<li>전체&nbsp;<a href="${contextPath }/admin/listMembers.ym">${allhostMember+alluserMember }</a>명 |</li>
					<li>게스트회원&nbsp;<a href="${contextPath }/admin/listMembers.ym">${alluserMember }</a> 명|</li>
					<li>호스트회원&nbsp;<a href="${contextPath }/admin/listMembers.ym">${allhostMember }</a>명 |</li>

					</ul>
					</div>
					<br><br>
					<form action="${contextPath }/admin/listMembers.ym" method="post" name = "frm_search" id="frm_search">
					<table>
					<tr id="search">
			            <td>검색회원 :</td>
			            <td colspan="2"><input type="text" placeholder="이름,아이디 입력" width="150" name="memberSearch"/></td>
			            <td><input type="button" onClick="document.getElementById('frm_search').submit();" value="검색" /></td>
			         </tr>
					</table>
					<hr>
	
					<form>
			
					<table  align="center"  width="100%" border="1" >
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 성별</th>
					<th>휴대폰번호</th>
					<th>이메일</th>
					<th>최근 로그인</th>
					<th>회원 가입날짜</th>
					<th>등급</th>
					</tr>
					
					<c:if test="${raidoType =='2'}"> 
						<c:choose>		
							
						<c:when test="${userList ==null}">			
							
						</c:when>
						
						<c:when test="${userList !=null}">			
							<c:forEach var="member" items="${userList }">
						
						 			<tr style="text-align: center;">	 
				
									<td> ${member.UUID}</td>
									<td> ${member.UNAME}</td>
									<td> ${member.UGENDER}</td>
									<td> ${member.UHP}</td>
									<td> ${member.UEMAIL}</td>
									<td> ${member.UUPDATEDATE}</td>
									<td> ${member.UINSERTDATE}</td>
									<td> ${member.UINSERTDATE}</td>
						
									</tr> 
						
							</c:forEach>
						</c:when>			
					</c:choose>	
					</c:if>		
	
				</table>
				<br>
	 	<c:if test="${totMembers !=null}">
		<c:choose>
			<c:when test="${selectedMembers >200 }">
			
		<c:forEach var="page" begin="1" end="20" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/admin/member/listMembers.do?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/admin/member/listMembers.do?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
			<c:if test="${page==10} }"><!--페이지수가 10일때 다음으로 next나오게 하기  -->
				<a href="${contextPath }/admin/member/listMembers.do?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${selectedMembers==200 }">
			<c:forEach var="page" begin="1" end="20" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${selectedMembers <200 }">
			<c:forEach var="page" begin="1" end="${selectedMembers/20+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/admin/member/listMembers.sgg
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}"
						>${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/admin/member/listMembers.sgg
						section=${section}
						&pageNum=${page}
						&order_lately_date=${order_lately_date}
						&order_total_buy=${order_total_buy}
						&order_total_order=${order_total_order}
						&member_gender=${member_gender}
						&keyword=${keyword}">${page }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
	
	</form>
	</form>
	                      </div>
           
                    </div>
                    <!-- column -->
                 
                </div>

            </div>
 
	</div>
	</center>
					
					
					
					
				
						
					<!---Container Fluid  여기다  내용입력 !!!! 마지막 여기 아래는 작업하지 말기-->
				</div>
				
				<%@include file="/WEB-INF/view/admin/include/footer.jsp" %>
				
			</div>
		</div>
		
		<%-- <%@include file="/WEB-INF/view/admin/include/scripts.jsp" %> --%>
		<!-- Page level plugins -->
		<script src="/resources/static/bootstrap/admin/vendor/chart.js/Chart.min.js"></script>
		<script src="/resources/static/js/main.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				newUserCnt();
				accountCheckCnt();
				orderCheckCnt();
				sellAmountSum();
				dailySellAmount();
				sellAmountPercentOfCategory();
			});
		</script>
	</body>
</html>