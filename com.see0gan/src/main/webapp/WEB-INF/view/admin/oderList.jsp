<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="section" value="${paymentMap.section }" />
<c:set var="pageNum" value="${paymentMap.pageNum }" />
<c:set var="paymentList" value="${paymentMap.paymentList }" />
<c:set var="keyword" value="${paymentMap.keyword }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%@include file="/WEB-INF/view/admin/include/header.jsp" %>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<link rel="stylesheet" href="/resources/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/resources/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/resources/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

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
<link rel="stylesheet" href="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/resources/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/resources/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
//<![CDATA[
$(function(){
	
	
	// datepicker : from ~ to ????????????
	$("#startdate").datepicker({		
		showOn: "button",    // ????????? ????????? ????????? (both: focus or button)
		buttonImage: "/resources/admin/calendar_datepicker/images/calendar.gif", 
		buttonImageOnly : true,            
		buttonText: "????????????",             
		dateFormat: "yy-mm-dd",             
		changeMonth: true,                  			
		onClose: function(selectedDate) {    
			$("#enddate").datepicker("option", "minDate", selectedDate);
		}                
	});		
	$("#enddate").datepicker({
		showOn: "button", 
		buttonImage: "/resources/admin/calendar_datepicker/images/calendar.gif", 
		buttonImageOnly : true,
		buttonText: "????????????",
		dateFormat: "yy-mm-dd",
		changeMonth: true,			
		onClose: function(selectedDate) {	
			$("#startdate").datepicker("option", "maxDate", selectedDate);
		}               
	});	
});
//]]>
</script> 


</head>

<body id="page-top">
		<div id="wrapper">
		
			<%@include file="/WEB-INF/view/admin/include/sidebar.jsp" %>
	
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
				
					<%@include file="/WEB-INF/view/admin/include/topbar.jsp" %>
					
					<!-- Container Fluid ?????????  ???????????? !!!!-->
					<div class="container-fluid" id="container-wrapper">
						
					<center>
					<div class="row">
                    <!-- column -->
                    <div class="col-12">
                      <div class="card">
                        <div class="comment-widgets scrollable">
                             <!--membersList  -->	
						<br><br>
					<h1>?????? ?????? </h1>


					<center>
					
			
					<br><br>
					<form action="${contextPath }/admin/paymentsearch.sgg" method="POST" name = "frm_search" id="frm_search">
					<table>
					<tr id="search">
			    <td  colspan="10" align="left">
				<select id="keyfilter" name="keyfilter">
					<option value="key1">????????????</option>
					<option value="key2">????????????</option>
					
				</select>
<td>
					<input type="text" id="keyword" name="keyword" placeholder="???????????? ?????? ????????????">
					<input type="text" id="startdate" name="startdate" size="12" placeholder="????????? ">
~ <input type="text" id="enddate" name="enddate" size="12" placeholder="?????????">
			            <input type="button" onClick="document.getElementById('frm_search').submit();" value="??????" /></td>
			         </tr>
					</table>
					<hr>
	
					<form>
			
					<table  align="center"  width="100%" border="1" >
		
		
					<tr style="text-align: center; font-size: 17px; color: white;">
					<th>?????? ??????</th>
					<th>????????????</th>
					<th>????????????</th>
					<th>???????????????</th>
					<th>????????????</th>
					<th>????????????</th>
					<th>????????????</th>
					</tr>
					
				
						<c:choose>		
							
						<c:when test="${paymentList ==null}">			
							 ????????? ????????? ????????????.
						</c:when>
						
						<c:when test="${paymentList !=null}">			
							<c:forEach var="payment" items="${paymentList }">
						
						 			<tr style="text-align: center;">	 
				
									<td> ${payment.tbsp_pay_num}</td>
									<td> ${payment.tbsp_pay_date}</td>
									<td> ${payment.tbu_name}</td>
									<td> ${payment.tbu_phone}</td>
									<td> ${payment.tbsp_pay_amount}</td>
									<td> ${payment.tbsp_pay_method}</td>
									<td> ${payment.tbsp_pay_status}</td>						
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
	</center>
					
				
					<!---Container Fluid  ?????????  ???????????? !!!! ????????? ?????? ????????? ???????????? ??????-->
				</div>
				
				<%@include file="/WEB-INF/view/admin/include/footer.jsp" %>
				
			</div>
		</div>


	</body>
</html>