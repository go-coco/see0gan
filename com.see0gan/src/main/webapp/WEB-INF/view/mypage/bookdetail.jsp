<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="com.see0gan.booking.vo.BookingVO"%>
<%
	String tbsp_num = request.getParameter("tbsp_num");
	System.out.println("�ش� ��ȣ : " + tbsp_num);
	Object obj = request.getAttribute("Bookdetail");
	List<BookingVO> list = (List<BookingVO>) obj;
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


</head>
<body>
<table border="1">
	<thead>
		<tr>
			<td colspan="6" align="center">
				<h2>���� ������ ����ȸ</h2>
			</td>
		</tr>
		
	</thead>
<%
	if(list!=null && list.size()>0){
		for(int i=0;i<list.size();i++){
			BookingVO bvo = (BookingVO)list.get(i);
%>
<hr>
	<table border="1">
		<tr>
			<td colspan="6" align="center">���೻��</td>
		</tr>
		<tr>
			<td>��û��</td>
			<td><%=bvo.getTbsp_bok_date() %></td>
		</tr>
		<tr>
			<td>�������</td>
			<td><%=bvo.getTbsp_name() %></td>
		</tr>
		<tr>
			<td>����ð�</td>
			<td><%=bvo.getTbsp_bok_time_s() %> ~ <%=bvo.getTbsp_bok_time_e() %></td>
		</tr>
		<tr>
			<td>�����ο�</td>
			<td><%=bvo.getTbsp_bok_person() %>��</td>
		</tr>	
	</table>
	
	<table>
		<tr>
			<td colspan="6" align="center">������ ����</td>
		</tr>
		<tr>
			<td>�����ڸ�</td>
			<td><%=bvo.getTbu_name() %></td>
		</tr>
		<tr>
			<td>����ó</td>
			<td><%=bvo.getTbu_phone() %></td>
		</tr>
	</table>
	
<%
		}
	}
%>
</table>
</body>
</html>