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


	
	function change_paymentstate(tbsp_pay_num){
		//alert("tbsp_pay_num :" + tbsp_pay_num );
		//alert("change_paymentstate : " + document.getElementById(tbsp_pay_num+"change_paymentstate").value);
		
		var payment_status = document.getElementById(tbsp_pay_num+"change_paymentstate").value;
		//alert("payment_status :" + payment_status );
		$.ajax({
			type:"post",
			url:"paymentupdate.sgg",
			data:{"change_payment_status" : payment_status, "change_tbsp_pay_num" : tbsp_pay_num },
			success:function(data){
				alert("결제상태가  변경 완료되었습니다.");
				location.href='/admin/oderList.sgg';
			},
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	
	}
// 검색 예외처리	
	var message = '${msg}'; 
	alert(message); 
	
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

					<h1> ${paymentMap[0].tbu_name}회원님 결제 정보</h1>

				</center>
					<br><br>
		
					<hr>
	
					<form  name = "searchform" id="searchform">
					<form action="${contextPath }/admin/paymentsearch.sgg" method="POST" name = "frm_search" id="frm_search">
						<table>
					<tr id="search">

				    <td  colspan="10"  lign="center" >
					<select id="keyfilter" name="keyfilter" value ="${keyfilter}">
						<option value="key1">결제번호</option>
						<option value="key2">회원이름</option>
	
					</select>

					<input type="text" id="keyword" name="keyword" placeholder="결제번호 또는 이름 입력"><br>
			            <td><input type="submit" id="search_option" value="검색" /></td>
			         </tr>
					</table>
					<table  align="center"  width="100%" border="1" >
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th>결제 번호</th>
					<th>결제날짜</th>
					<th>회원이름</th>
					<th>휴대폰번호</th>
					<th>결제금액</th>
					<th>결제방법</th>
					<th>결제상태</th>
					</tr>

						<c:choose>		
							
						<c:when test="${paymentMap ==null}">			
							<h1>결제한 회원이 없습니다.</h1>
						</c:when>
						
						<c:when test="${paymentMap !=null}">			
							<c:forEach var="payment" items="${paymentMap }">
						
						 			<tr style="text-align: center;">	 
				
									<td> ${payment.tbsp_pay_num}</td>
									<td> ${payment.tbsp_pay_date}</td>
									<td> ${payment.tbu_name}</td>
									<td> ${payment.tbu_phone}</td>
									<td> ${payment.tbsp_pay_amount}</td>
									<td> ${payment.tbsp_pay_method}</td>
									<td> ${payment.tbsp_pay_status}
				<!-- //// -->					

						<select id="${payment.tbsp_pay_num}change_paymentstate"  >
						
						<c:choose>
						<c:when test="${payment.tbsp_pay_status eq '결제완료' }"> 
						<option value="미결제">미결제</option>
						<option value="결제취소">결제취소</option>
						<option value="결제실패">결제실패</option>
						</c:when>
						<c:when test="${payment.tbsp_pay_status eq '미결제' }"> 
						<option value="결제완료">결제완료</option>
						<option value="결제취소">결제취소</option>
						<option value="결제실패">결제실패</option>
						</c:when>
						<c:when test="${payment.tbsp_pay_status eq '결제취소' }">
					    <option value="결제완료">결제완료</option>
						<option value="미결제">미결제</option>
						<option value="결제실패">결제실패</option>
					     </c:when>
					    <c:when test="${payment.tbsp_pay_status eq '결제실패' }">
					    <option value="결제취소">결제취소</option>
						<option value="결제완료">결제완료</option>
						<option value="결제취소">결제취소</option>

					     </c:when>					
						</c:choose>	
					    </select>
						<button type="button" value="${payment.tbsp_pay_num}" onclick="change_paymentstate(value)" >결제변경</button></td>

						</tr>
								
				<!-- -//////////////// -->											
									</tr> 	
																	
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