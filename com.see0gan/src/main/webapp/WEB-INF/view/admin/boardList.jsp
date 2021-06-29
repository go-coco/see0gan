<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="section" value="${boardMap.section }" />
<c:set var="pageNum" value="${boardMap.pageNum }" />
<c:set var="boardList" value="${boardMap.boardList }" />
<c:set var="keyword" value="${boardMap.keyword }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/view/admin/include/header.jsp" %>


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
		font-size: 17px;
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
					<h1>1:1 게시판</h1>
			
					<center>
					
					<div id="listOrdersByStatus">


					</div>
					<br><br>
					<form action="${contextPath }/admin/oderList.sgg" method="post" name = "frm_search" id="frm_search">

					<hr>
	
					<form>
				
					<table  align="center"  width="100%" border="1" >
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th>문의번호</th>
					<th>작성자</th>
					<th>등록일자</th>
					<th>문의확인</th>
					</tr>
					<c:choose>		
							
						<c:when test="${boardList ==null}">			
							1:1 게시판에 문의한 글이 없습니다.
						</c:when>
						
						<c:when test="${boardList !=null}">			
							<c:forEach var="board" items="${boardList }">
						
						 			<tr style="text-align: center;">	 
				
									<td> ${board.onenum}</td>
									<td> ${board.onenick}</td>
									<td> ${board.oneinsertdate}</td>
									<td> <a href="/oneSelect.sgg?onenum=${board.onenum}">문의확인</a></td>
									</tr> 
						
							</c:forEach>
						</c:when>			
					</c:choose>	
			
	
				</table>
	
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
		

	</body>
</html>