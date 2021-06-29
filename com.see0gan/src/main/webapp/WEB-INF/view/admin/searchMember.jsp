<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<% request.setCharacterEncoding("UTF-8"); %>

	
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


var message = '${msg}'; 
alert(message); 


function DeleteAdmin()
{
	
	var sendData = "deleteId="+$('#frm_delete').val();

	$.ajax({
	    type : "POST",
	    url : "deleteMember.sgg",
	    data : sendData, 
	    success: function(data) {
	    	alert("회원이 탈퇴하였습니다.");
	    	location.href = "gu_listmembers.sgg";
	    },
		error:function(request, status, error){

			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}    	

</script>	
</head>
	
	<body id="page-top">
<% request.setCharacterEncoding("UTF-8"); %>


		<div id="wrapper">
		
			<%@include file="/WEB-INF/view/admin/include/sidebar.jsp" %>
	
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
				
					<%@include file="/WEB-INF/view/admin/include/topbar.jsp" %>
					
					<!-- Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
				<!-- --여기다 본문내용 넣기 -->	
				
 					<div class="container-fluid">
             
                	<div class="row">
                    <!-- column -->
                    <div class="col-12">
                      <div class="card">
                        <div class="comment-widgets scrollable">
                             <!--membersList  -->	
						<br><br>
					<center>

					<h1> ${membersMap[0].TBU_NAME}회원님 정보</h1>

				</center>
					<br><br>
		
					<hr>
	
					<form  name = "searchform" id="searchform">
					<form action="${contextPath }/admin/searchMember.sgg" method="POST" name = "frm_search" id="frm_search">
						<table>
					<tr id="search">
				    <td  colspan="10"  lign="center" >
					<select id="keyfilter" name="keyfilter" value ="${keyfilter}">
						<option value="key1">회원ID</option>
						<option value="key2">회원이름</option>
	
					</select>
				
					<input type="text" id="keyword" name="keyword" onkeyup="test(this)" placeholder="회원ID 또는 이름 입력"><br>
			            <td><input type="button" onClick="document.getElementById('frm_search').submit();" value="검색" /></td>
			         </tr>
					</table>
					<table  align="center"  width="100%" border="1" >
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th >회원 아이디</th>
					<th>회원 닉네임</th>
					<th>회원 이름</th>
					<th>휴대폰번호</th>
					<th>이메일</th>
					<th>회원 가입날짜</th>
					<th>등급</th>
					<th>탈퇴하기</th>
					</tr>

						<c:choose>		
							
						<c:when test="${membersMap ==null}">			
							<h1>등록된 회원이 없습니다.</h1>
						</c:when>
						
						<c:when test="${membersMap !=null}">			
							<c:forEach var="member" items="${membersMap }">
						
						 			<tr style="text-align: center;">	 
				
									<td > ${member.TBU_GUESTID}</td>
									<td> ${member.TBU_NICKNAME}</td>
									<td> ${member.TBU_NAME}</td>
									<td> ${member.TBU_PHONE}</td>
									<td> ${member.TBU_EMAIL}</td>							
									<td> ${member.TBU_INSERTDATE}</td>
								<c:choose> 							
									<c:when  test="${member.TBU_DELETEYN eq 'N' }">
									<td> 정회원</td>
									<td><button type="button" name="frm_delete" id="frm_delete" value="${member.TBU_GUESTID}" onClick="DeleteAdmin()" >탈퇴</button></td>		
									</c:when> 
									<c:when test="${member.TBU_DELETEYN eq 'Y' }">
									<td> 비회원</td>
									</c:when> 								
							  </c:choose> 	
									
								
									</tr> 
						
							</c:forEach>
						</c:when>			
					</c:choose>	
					
					
	
				</table>	
	<br>
	 	
                    
       
</form>	 
</form> 

                        </div>
                  
               
                
                    </div>
                    <!-- column -->

                    
                </div>

            </div>
 
	</div>
	
					<!---------------------------본문내용 마지막 넣기----------------------------------------------Row-->
					</div>
					
					
					
					
					
					<!---Container Fluid-->
				</div>
				
				<%@include file="/WEB-INF/view/admin/include/footer.jsp" %>
				
			</div>
		</div>

	</body>
</html>