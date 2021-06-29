<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="com.see0gan.booking.vo.BookingVO" %> <%@
page import="java.util.List" %> <% Object obj = request.getAttribute("listH");
Object obj2 = request.getAttribute("listBooking"); List<BookingVO>
    list = (List)obj; BookingVO bkvo = null; if (list.size() == 1) { bkvo =
    list.get(0); }; BookingVO _bkvo = null; _bkvo = (BookingVO)obj2; %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8" />
            <title>Insert title here</title>
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <link rel="stylesheet" href="/resources/css/common.css" />
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#cancel").click(function () {
                        var result = confirm("예약을 취소하겠습니까?");

                        if (result) {
                            $("#dokDetail")
                                .attr({
                                    action: "/booking/bookCancel.sgg",
                                    method: "POST",
                                    enctype:
                                        "application/x-www-form-urlencoded",
                                })
                                .submit();
                        } else {
                        }
                    });
                });
            </script>
            <style type="text/css">
                td {
                    background-color: white;
                    height: 40px;
                    border-top: 1px solid #eeeeee;
                }
            </style>
        </head>
        <body>
            <% request.setCharacterEncoding("UTF-8");%>
            <div class="wrap">
                <header class="header">
                    <!-- main header -->
                    <%@include file="../common/header.jsp" %>
                    <!-- sub header -->

                    <!-- <div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>공간등록</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div>  -->
                </header>
                <div class="content_wrap">
                    <form id="dokDetail">
                        <div>
                            <table align="center">
                                <tr>
                                    <td
                                        style="
                                            color: white;
                                            background-color: #4d4e50;
                                        "
                                        colspan="3"
                                        align="center"
                                    >
                                        공간정보
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        공간명
                                    </td>
                                    <td colspan="2" width="500px">
                                        <input
                                            type="text"
                                            name="getBookingVOList[0].tbsp_name"
                                            id="tbsp_name"
                                            value="<%= bkvo.getTbsp_name() %>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="3">
                                        <img
                                            src="/resources/img/<%= bkvo.getTbsp_img1()%>"
                                            border="1"
                                            alt="image"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        공간유형
                                    </td>
                                    <td colspan="2">
                                        <input
                                            type="text"
                                            name="tbsp_type"
                                            id="tbsp_type"
                                            value="<%= bkvo.getTbsp_type() %>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table align="center">
                                <tr>
                                    <td
                                        style="
                                            color: white;
                                            background-color: #4d4e50;
                                        "
                                        colspan="3"
                                        align="center"
                                    >
                                        예약정보
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        rowspan="2"
                                        align="center"
                                    >
                                        예약날짜
                                    </td>
                                    <td width="500px">
                                        <input
                                            type="text"
                                            name="getBookingVOList[0].tbsp_bok_date"
                                            id="tbsp_bok_date"
                                            value="<%= _bkvo.getTbsp_bok_date() %>"
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input
                                            type="text"
                                            name="getBookingVOList[0].tbsp_bok_time_s"
                                            id="tbsp_bok_time_s"
                                            value="<%= _bkvo.getTbsp_bok_time_s()%>"
                                            style="
                                                width: 70px;
                                                border: none;
                                                text-align: center;
                                            "
                                        />
                                        <span>~</span>
                                        <input
                                            type="text"
                                            name="getBookingVOList[0].tbsp_bok_time_e"
                                            id="tbsp_bok_time_e"
                                            value="<%= _bkvo.getTbsp_bok_time_e()%>"
                                            style="
                                                width: 70px;
                                                border: none;
                                                text-align: center;
                                            "
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        예약인원
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            name="getBookingVOList[0].tbsp_bok_person"
                                            id="tbsp_bok_person"
                                            value="<%= _bkvo.getTbsp_bok_person()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table align="center">
                                <tr>
                                    <td
                                        colspan="3"
                                        align="center"
                                        style="
                                            color: white;
                                            background-color: #4d4e50;
                                        "
                                        colspan="3"
                                        align="center"
                                    >
                                        호스트 정보
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        공간상호
                                    </td>
                                    <td width="500px">
                                        <input
                                            name="getBookingVOList[0].tbc_name"
                                            id="tbsp_bok_person"
                                            type="text"
                                            value="<%= bkvo.getTbc_name()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        대표자명
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbc_name()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        사업자번호
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbc_name()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        연락처
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbh_phone()%> <%= bkvo.getTbh_email()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div>
                            <table align="center">
                                <tr>
                                    <td
                                        colspan="2"
                                        width="647px"
                                        style="
                                            color: white;
                                            background-color: #4d4e50;
                                        "
                                        colspan="3"
                                        align="center"
                                    >
                                        예약시 주의사항
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbsp_caution()%>"
                                            readonly
                                            style="
                                                border: none;
                                                width: 480px;
                                                text-align: center;
                                            "
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        colspan="2"
                                        style="
                                            background-color: #4d4e50;
                                            color: white;
                                        "
                                        align="center"
                                    >
                                        환불 기준
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        7일이내
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbsp_refund1()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        3일이내
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbsp_refund2()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <td
                                        style="
                                            background-color: #eeeeee;
                                            color: black;
                                        "
                                        width="140px"
                                        align="center"
                                    >
                                        하루전
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            value="<%= bkvo.getTbsp_refund3()%>"
                                            readonly
                                            style="border: none; width: 480px"
                                        />
                                    </td>
                                </tr>
                                <tr colspan="2" align="right">
                                    <td></td>
                                    <td>
                                        <input
                                            width="120px"
                                            height="40px"
                                            type="button"
                                            id="cancel"
                                            value="예약취소"
                                        />
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden"
                            name="getBookingVOList[0].tbsp_num" id="tbsp_num""
                            value="<%= bkvo.getTbsp_num()%>"/> <input
                            type="hidden"
                            name="getBookingVOList[0].tbsp_bok_num"
                            id="tbsp_bok_num"" value="<%=
                            _bkvo.getTbsp_bok_num()%>"/>
                            <input
                                type="hidden"
                                name="getBookingVOList[0].tbu_guestid"
                                id="tbu_guestid"
                                value="<%= _bkvo.getTbu_guestid()%>"
                            />
                        </div>
                    </form>
                </div>
                <div class="blank"></div>
                <footer class="footer">
                    <%@include file="../common/footer.jsp" %>
                </footer>
            </div>
        </body>
    </html></BookingVO
>
