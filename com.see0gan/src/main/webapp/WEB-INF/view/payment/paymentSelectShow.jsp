<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.see0gan.payment.vo.PaymentVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listS");
	List<PaymentVO> list = (List)obj;
	PaymentVO pvo = null;
	if (list.size() == 1) {
		pvo = list.get(0);
	};
%>
<div>
<intput type="text" value="<%= pvo.getTbsp_pay_amount()%>"/>
</div>

</body>
</html>