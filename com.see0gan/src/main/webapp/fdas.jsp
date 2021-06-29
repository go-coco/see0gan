<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%-- <%@ page import="com.spw.auction.vo.AuctionVO" %>
<%@ page import="com.spw.member.vo.MemberVO" %> --%>
<%
	request.setAttribute("siteTitle", "마이 페이지");
%>
<%
	// 경매 목록.
	//Object obj = request.getAttribute("auctionList");
	//List<AuctionVO> list = (List<AuctionVO>)obj;
	//System.out.println("list : "+list);
	// 현재 로그인한 vo값.
	//Object objMvo = request.getAttribute("mvo");
	//MemberVO mvo = (MemberVO)objMvo;
	//String mid = mvo.getMid();
%>

<script type="text/javascript">
	$(document).ready(function(){
		// 회원 수정 버튼.
		$('#myUpdate').click(function(){
			//console.log("수정버튼 실행 : ");
			$('#myPageForm').attr('action','/spw/myInfo.spw');
			$('#myPageForm').submit();
		});
		var urls="/spw/myNotice.spw";
		var datas;
		$.ajax({
			url:urls,
			type:"GET",
			data:datas,
			success:whenSuccess,
			error:whenError
		});
		function whenSuccess(res){
			console.log("success");
			console.log(res);
			$('.notice_list').html(res);
		}
		function whenError(res){
			console.log("error");
			console.log(res);
		}
		// 삭제.
		$('#delAuction').click(function(){
			var chkBox = document.getElementsByName("chkanum");
			var asort = document.getElementById('chkasort').value;
			console.log("del asort : "+asort);
			var cbCnt = 0;
			var anum;
			for(var i=0;i<chkBox.length;i++){
				
				if(chkBox[i].checked==true){
					console.log(chkBox[i].value);
					anum = chkBox[i].value;
					cbCnt++;
				}
				
			}
			document.getElementById("anum").setAttribute("value",anum);
			document.getElementById("asort").setAttribute("value",asort);
			if(cbCnt==0){
				alert("체크박스를 선택하세요.");
			}else{
				var pick = confirm("삭제하시겠습니까?");
				if(pick==true){
					console.log("삭제");
					document.myPageForm.action="/spw/myAuctionDel.spw?anum="+anum+"&asort="+asort;
					document.myPageForm.submit();
				}
			}
		});
		 // DatePicker Format.
	 	 var dateFormat = "yy/mm/dd", 
		 from = $( "#dateFrom" )
	       .datepicker({
	         defaultDate: "+1w",
	         changeMonth: true,
	         numberOfMonths: 1,
	         dateFormat: dateFormat
	       })
	       .on( "change", 
	       		function() {
	         to.datepicker( "option", "minDate", getDate( this ) );
	        
	        var date= $.datepicker.formatDate('yy/mm/dd', new Date(getDate(this)));
	        console.log("from >>>>>>"+date);
	        //$( "#dateFrom" ).val(date);	         
	
	       }),
	       
	     to = $( "#dateTo" ).datepicker({
	       defaultDate: "+1w",
	       changeMonth: true,
	       numberOfMonths: 1,
	       dateFormat: dateFormat
	     })
	     .on( "change", function() {
	       from.datepicker( "option", "maxDate", getDate( this ) );
	       
	       var date= $.datepicker.formatDate('yy/mm/dd', new Date(getDate(this)));
	        console.log("to >>>>>>"+date);
	        //$( "#dateTo" ).val(date);
	     });
	
	   function getDate( element ) {
	     var date;
	     try {
	       date = $.datepicker.parseDate( dateFormat, element.value );
	     } catch( error ) {
	       date = null;
	       console.log(error);
	     }
	
	     return date;
	   }
	});
	/* 날짜검색 */
	function searchDate(){
		//alert("날짜검색 >>> start  ");
	
		var from=document.getElementById("dateFrom").value;
		console.log("from :: "+from);
		var to=document.getElementById("dateTo").value;
		console.log("to :: "+to);
		var sort = document.getElementById("chkasort").value;
		console.log("sort :: "+sort);
		var qStr = "asort="+sort+"&dateFrom="+from+"&dateTo="+to;
		console.log("qStr :: "+qStr);
		location.href="/spw/myAuction.spw?"+qStr;
	}	
	// 체크 박스 1개 선택.
	function checkOnly(chk){
		var obj = document.getElementsByName("anum");
		//console.log(chk.value);
		for (var i = 0; i < obj.length; i++) {
			if(obj[i]!=chk){
				obj[i].checked=false;
			}
			
		}
		
	}

</script>
<!-- 마이페이지.  -->
<div class="mypage_contents">
<h2 align="left">마이페이지</h2>
	<!-- 회원정보.  -->
	<div class="myinfo">
		<div class="myinfo_list">
			<form id="myPageForm" name="myPageForm">
			<%-- <input type="hidden" name="mnum" id="mnum" value="<%=sessionNum %>"/> --%>
			<h3>회원정보</h3>
			
			<div class="myinfo_pic">
				<img src="/spw/include/img/mypage.png">
			</div>
			<br>
			<div class="myinfo_id">
				<%-- <span><%=mid %></span><br> --%>
			</div>
			<div class="myinfo_btn">
				<input type="button" name="myUpdate" id="myUpdate" value="회원정보수정" class="sitebtn"/>
			</div>
			</form>
		</div>
		<!-- 알림목록.  -->
		<div class="mynotice_list">
			<h3>알림</h3>
			<hr>
			<div class="notice_list">
				
			</div>
		</div>
	</div>
</div>
<br>
<div class="btn_container">
	<div class="tab_sort tab_saja"><a href="/spw/myGeneral.spw?gsort=1">사자</a></div>
	<div class="tab_sort tab_panda"><a href="/spw/myGeneral.spw?gsort=2">판다</a></div>
	<div class="tab_sort tab_auction"><a href="/spw/myAuction.spw?asort=3">경매</a></div>
	<div class="tab_sort tab_pick"><a href="/spw/myPick.spw">찜</a></div>
</div>
<!-- 날짜검색 -->
<div class="search_by_date">
	날짜입력
	<input type="text" id="dateFrom" name="dateFrom" class="sitetxt" size="15">
	~
	<input type="text" id="dateTo" name="dateTo" class="sitetxt" size="15">
	<input type="button" value="조회" name="btnSerachByDate"id="btnSerachByDate" onclick="searchDate()" class="sitebtn">
</div>	
<div class="del_btn">
	<input type="button" id="delAuction" name="delAuction" value="삭제" class="sitebtn"/>
</div>

<div class="list_contents">
<div class="list_top">

</div>
</div>