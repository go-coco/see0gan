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
    Object obj = request.getParameter("onemnum");
    String onemnum = "";
	if(obj != null){
		onemnum = (String)obj;
		System.out.println("onemnum >>> : " + onemnum);
	}
	System.out.println("onemnum >>> : " + onemnum);
%>
ONE DELETE
<hr>
<script>
	location.href="oneSelectAllU.sgg?onemnum=<%=onemnum%>";
</script>
</body>
</html>