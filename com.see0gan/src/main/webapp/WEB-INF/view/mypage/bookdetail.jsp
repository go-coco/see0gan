<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="com.see0gan.booking.vo.BookingVO"%>
<%
	String tbsp_num = request.getParameter("tbsp_num");
	System.out.println("해당 번호 : " + tbsp_num);
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
				<h2>예약 페이지 상세조회</h2>
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
			<td colspan="6" align="center">예약내용</td>
		</tr>
		<tr>
			<td>신청일</td>
			<td><%=bvo.getTbsp_bok_date() %></td>
		</tr>
		<tr>
			<td>예약공간</td>
			<td><%=bvo.getTbsp_name() %></td>
		</tr>
		<tr>
			<td>예약시간</td>
			<td><%=bvo.getTbsp_bok_time_s() %> ~ <%=bvo.getTbsp_bok_time_e() %></td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td><%=bvo.getTbsp_bok_person() %>명</td>
		</tr>	
	</table>
	
	<table>
		<tr>
			<td colspan="6" align="center">예약자 정보</td>
		</tr>
		<tr>
			<td>예약자명</td>
			<td><%=bvo.getTbu_name() %></td>
		</tr>
		<tr>
			<td>연락처</td>
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