<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
<%@include file="/WEB-INF/view/admin/include/header.jsp" %>

 
<c:set var="allguestMember" value="${membersMap.allguestMember }" />
<c:set var="allhostMember" value="${membersMap.allhostMember }" />
<c:set var="newhostCnt" value="${newhostCnt }" />
<c:set var="newguestCnt" value="${newguestCnt }" />
<c:set var="todaytotal" value="${todaytotal }" />

		
		
	</head>
	
	<body id="page-top">
		<div id="wrapper">
		
			<%@include file="/WEB-INF/view/admin/include/sidebar.jsp" %>
	
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
				
					<%@include file="/WEB-INF/view/admin/include/topbar.jsp" %>
					
					<!-- Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
						<div class="row mb-3">
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-uppercase mb-1" text-align:center;>see0gan 전체 회원수 ${allguestMember+allhostMember }명</div>
												<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="newUserCnt"></div>
											</div>
											<div class="col-auto">
												<a href="/admin/user"><i class="fas fa-users fa-2x text-info"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-uppercase mb-1">오늘 신규 가입자 ${newhostCnt+newguestCnt }명</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800" id="accountCheckCnt"></div>
											</div>
											<div class="col-auto">
												<a href="/admin/order"><i class="fas fa-users fa-2x text-info"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
			
							<div class="col-xl-3 col-md-6 mb-4">
								<div class="card">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col mr-2">
												<div class="text-xs font-weight-bold text-uppercase mb-1">판매 총액 ${todaytotal } 원</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800" id="sellAmountSum"></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-xl-8 col-lg-7">
								<div class="card mb-4">
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">최근 7일간 일별 판매금액 현황</h6>
									</div>
									<div class="card-body">
										<div class="chart-area">
											<canvas id="myAreaChart"></canvas>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-xl-8 col-lg-7">
								<div class="card mb-4">
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">최근 7일간 신규 가입자 현황</h6>
									</div>
									<div class="card-body">
										<div class="chart-area">
											<canvas id="myAreaChart"></canvas>
										</div>
									</div>
								</div>
							</div>
							
						</div>
						<!--Row-->
					</div>
					<!---Container Fluid-->
				</div>
				
				<%@include file="/WEB-INF/view/admin/include/footer.jsp" %>
				
			</div>
		</div>

	</body>
</html>