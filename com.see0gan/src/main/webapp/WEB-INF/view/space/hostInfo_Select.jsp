<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.see0gan.space.vo.SP_BasicInfoVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stopby Page</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 호스트정보 中 이메일정보를 가져오기 위해서 잠시 들르는 페이지 -->
<script>
	//hostInfo_Select 컨트롤러로 거거
	location.href="hostInfo_Select.sgg";
</script>
</body>
</html>