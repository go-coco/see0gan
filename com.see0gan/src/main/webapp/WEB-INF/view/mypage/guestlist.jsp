<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="com.see0gan.login.vo.GuestVO"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.my-page-container {
    margin-top: 140px;
    display: flex;
    justify-content: center;
}

.my-page-wrapper {
    margin: 0 auto;
    width: 800px;
    border: 1px;
}

.my-page-header {
    text-align: center;
    background-color: #333333;
    padding: 5px 0;
    color: #FFFFFF;
}

.booking-list {
    padding: 15px;
    display: flex;
    flex-wrap: wrap;
}

.list-book {
    margin-top: 10px;
    margin-left: 10px;
    width: 240px;
    height: 380px;
    border: 2px;
    border-radius: 10px;
    padding: 13px 10px;
    color: white;
  	cursor: pointer;
}


.list-space-title {
    padding-top: 11px;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    color: blue;
    padding-bottom: 11px;
    border-bottom: 2px solid black;
}

.list-book-theater-wrapper {
    margin-top: 10px;
    display: flex;
    justify-content: center;
}


.list-date-wrapper {
    margin-top: 10px;
    display: flex;
    color: black;
    align-items: center;
    justify-content: center;
}

.list-book-date {
    font-weight: bold;
    font-size: 14px;
}

.list-book-runningTime {
    font-weight: bold;
    font-size: 17px;
    margin-left: 5px;
}

.list-information-wrapper {
    margin-top: 10px;
    text-align: center;
    color: black;
}

.list-date-s-title {
    font-size: 12px;
}

.list-date-s {
    margin-top: 4px;
    font-size: 12px;
    font-weight: bold;
}

.type-wrapper {
    margin-top: 10px;
}

.list-date-e-wrapper {
    margin-top: 8px;
}

.list-date-e-title {
    font-size: 12px;
}

.list-date-e {
    margin-top: 4px;
    font-size: 12px;
    font-weight: bold;
}

.type-wrapper>div {
    font-size: 16px;
    font-weight: bold;
}


</style>
<%
	List<GuestVO> list = (List<GuestVO>) request.getAttribute("GuestList");
	System.out.println("list size >>> : " + list.size());
%>
</head>
<body>
	<div class="my-page-container">
		<div class="my-page-wrapper">
			<div class="my-page-header">게스트 목록</div>
			<div class="booking-list">
				<%
					if (list == null) {
				%>
				<div>예약한 공간이 없습니다</div>
				<%
					} else {
						for (int i = 0; i < list.size(); i++) {
							GuestVO guestVO = list.get(i);
							if(guestVO != null){
				%>
				<div class="list-book">
					
					<div class="list-space-title"><%=guestVO.getTBU_GUESTID() %></div>
					<div class="list-date-wrapper">
						<div class="list-book-date"><%=guestVO.getTBU_NICKNAME() %></div>
						<div class="list-book-date"><%=guestVO.getTBU_NAME() %></div>
					</div>
					
					<div class="list-information-wrapper">
						<div class="list-date-s-wrapper">
							<div class="list-date-s"><%=guestVO.getTBU_EMAIL() %></div>
						</div>

						<div class="list-date-e-wrapper">
							<div class="list-date-e"><%=guestVO.getTBU_PASSWORD() %></div>
						</div>

						<div class="type-wrapper">
							<div><%=guestVO.getTBU_PHONE() %></div>
						</div>
					</div>
				</div>
				<%
							}
						}
				%>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>