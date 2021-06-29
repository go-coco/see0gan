<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import= "com.see0gan.login.vo.GuestVO" %>   
  <%@ page import= "com.see0gan.login.vo.HostVO" %>  
  <%@ page import="java.util.List"%>
<%@ page import="com.see0gan.space.vo.SP_BasicInfoVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
<style type="text/css">
	.result_tit{
		text-align: center;
		padding: 30px 0;
	}
	.result_tit h2{
		display: inline-block;
	}
</style>
</head>
<body>
<div class="wrap">
<header class="header">
	<%@include file="../../../WEB-INF/view/common/header.jsp" %>
</header>

<%
	List<SP_BasicInfoVO> list = (List<SP_BasicInfoVO>) request.getAttribute("SpaceList");
	SP_BasicInfoVO sp_BasicInfoVO = list.get(0);
	
%>
<% 
String type = sp_BasicInfoVO.getTbsp_type();
 if("party".equals(type) ){
	 type="파티룸";
 } 
 if("practice".equals(type)){
	 type="연습실";
 } 
 if("studio".equals(type)){
	 type="촬영스튜디오";
 } 
 if("conference".equals(type)){
	 type="회의실";
 } 
 %>
<div class="content_wrap">
	<div class="main_wrap">
	<div class="result_tit">
		<h2><%= type %></h2>
		<span>로 검색된 결과입니다.</span>
	</div>
<div class="list_today_sp">
			<%
					if (list == null) {
				%>
				<div>검색된 공간이 없습니다</div>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							 sp_BasicInfoVO = list.get(i);
				%>
				
				<div class="sp_list">
				<a href="space_detail.sgg?tbsp_num=<%=sp_BasicInfoVO.getTbsp_num()%>">
					<div class="sp_list_img">
						<img src="resources/img/<%= sp_BasicInfoVO.getTbsp_img1()%>" border="1" alt="image">
						<% System.out.println("img1 name >>> : " + sp_BasicInfoVO.getTbsp_img1()); %>
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit"><%= sp_BasicInfoVO.getTbsp_name() %></h3>
						<div class="sp_tags">
							<span class="tag_area_name"><%= sp_BasicInfoVO.getTbsp_addr() %></span> 
							<span><%= sp_BasicInfoVO.getTbsp_tag1() %></span>
							<span><%= sp_BasicInfoVO.getTbsp_tag2() %></span>
							<span><%= sp_BasicInfoVO.getTbsp_tag3() %></span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price"><%= sp_BasicInfoVO.getTbsp_cost() %></strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span><%= sp_BasicInfoVO.getTbsp_capacity() %></span> 
						</div>
					</div>
				</a>
				</div>
							<%
					}
				%>
				<%
					}
				%>
			</div>
</div>
</div>
<footer class="footer">
	<%@include file="../../../WEB-INF/view/common/footer.jsp" %>
</footer>
</div>

</body>
</html>
