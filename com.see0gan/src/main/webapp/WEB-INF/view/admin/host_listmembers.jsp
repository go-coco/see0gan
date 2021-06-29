<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="allguestMember" value="${membersMap.allguestMember }" />
<c:set var="allhostMember" value="${membersMap.allhostMember }" />
<c:set var="section" value="${membersMap.section }" />
<c:set var="pageNum" value="${membersMap.pageNum }" />
<c:set var="hostList" value="${membersMap.hostList }" />

<c:set var="keyword" value="${membersMap.keyword }" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"> 

//공백제거
function test(obj){
    var a = $('#keyword').val().replace(/ /gi, '');
    $('#keyword').val(a);
}

</script>		
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
					<h1>호스트 회원 목록</h1>
			
					<center>
					
					<div id="listOrdersByStatus">
					<ul class="smallul"> 
					<li>전체&nbsp;${allguestMember+allhostMember }명 |</li>
					<li>게스트회원&nbsp;${allguestMember } 명|</li>
					<li>호스트회원&nbsp;${allhostMember }명 |</li>

					</ul>
					</div>
					<br><br>
					<form action="${contextPath }/admin/searchMember.sgg" method="POST" name = "frm_search" id="frm_search">
					<table>
					<tr id="search">
			    <td  colspan="10" align="left">
				<select id="keyfilter" name="keyfilter">
					<option value="key1">회원ID</option>
					<option value="key2">회원이름</option>

				</select>

					<input type="text" id="keyword" name="keyword" onkeyup="test(this)" placeholder="회원ID 또는 이름 입력"><br>
			            <td><input type="button" onClick="document.getElementById('frm_search').submit();" value="검색" /></td>
			         </tr>
					</table>
					<hr>
	
					<form>
			
					<table  align="center"  width="100%" border="1" >
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th>회원 아이디</th>
					<th>회원 닉네임</th>
					<th>회원 이름</th>
					<th>휴대폰번호</th>
					<th>이메일</th>
					<th>회원 가입날짜</th>
					<th>등급</th>
					</tr>
					
						<c:choose>		
							
						<c:when test="${hostList ==null}">			
							<h1>등록된 회원이 없습니다.</h1>
						</c:when>
						
						<c:when test="${hostList !=null}">			
							<c:forEach var="member" items="${hostList }">
						
						 			<tr style="text-align: center;">	 
				
									<td> ${member.TBH_NUM}</td>
									<td> ${member.TBH_NICKNAME}</td>
									<td> ${member.TBH_NAME}</td>
									<td> ${member.TBH_PHONE}</td>
									<td> ${member.TBH_EMAIL}</td>							
									<td> ${member.TBH_INSERTDATE}</td>
								<c:choose> 
								
									<c:when  test="${member.TBH_DELETEYN eq 'N' }">
									<td> 정회원</td>
									</c:when> 
									<c:when test="${member.TBH_DELETEYN eq 'Y' }">
									<td> 비회원</td>
									</c:when> 
								
							  </c:choose> 	
												
									</tr> 
						
							</c:forEach>
						</c:when>			
					</c:choose>	
		
				</table>
				<br>
	 	<c:if test="${allhostMember !=null}">
		<c:choose>
			<c:when test="${allhostMember >200 }">
			
		<c:forEach var="page" begin="1" end="20" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/admin/host_listmembers.sgg?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/admin/host_listmembers?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
			<c:if test="${page==10} }"><!--페이지수가 10일때 다음으로 next나오게 하기  -->
				<a href="${contextPath }/admin/host_listmembers.sgg?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${allhostMember == 200 }">
			<c:forEach var="page" begin="1" end="20" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${allhostMember <200 }">
			<c:forEach var="page" begin="1" end="${allhostMember/20+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/admin/host_listmembers.sgg"
						>${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/admin/host_listmembers.sgg
						section=${section}
						&pageNum=${page}
						">${page }</a>
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

	</body>
</html>