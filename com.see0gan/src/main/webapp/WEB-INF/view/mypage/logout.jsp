<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // 세션 데이터를 모두 삭제
    session.invalidate();
    // 인덱스 페이지로 이동시킴.
    response.sendRedirect("../../main.jsp");
%>
</body>
</html>