<%-- <%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.see0gan.space.vo.SP_BasicInfoVO"%>
<%@ page import= "com.see0gan.login.vo.GuestVO" %>

<%@ page import= "com.see0gan.login.vo.HostVO" %>

<%
	String tbsp_num = request.getParameter("tbsp_num");
	System.out.println("해당 번호 : " + tbsp_num);
	Object obj = request.getAttribute("Spacedetail");
	List<SP_BasicInfoVO> list = (List<SP_BasicInfoVO>) obj;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">

<link rel="stylesheet" href="../../resources/include/css/reviewStyle.css">
<link rel="stylesheet" href="../../resources/include/css/qnaStyle.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>See0gan</title>
<script type="text/javascript">

// $(document).ready(function(){
// 	$("#booking").click(function(){
		
<%-- <% --%>
// 		HttpSession httpSession = request.getSession(true);

// 		GuestVO gvo = (GuestVO) httpSession.getAttribute("user");
// 		if(gvo == null){
// 			session.removeAttribute("backpage");
// 			session.setAttribute("backpage","/space_detail.sgg?"+ "tbsp_num=" + tbsp_num);
<%-- %> --%>
// 			location.href="/host/hostLogin.sgg";
<%-- <%			 --%>
// 		}

// 		else {
<%-- %> --%>
// 			alert("aaa");
// 			$("#bookingSelect").attr({
// 				action : "/booking/booking.sgg",
// 				method : "POST",
// 				enctype : "application/x-www-form-urlencoded"
// 			}).submit();
<%-- <% --%>
// 		} 
<%-- %> --%>
// 	});

// });
function booking(){
	<%
	HttpSession httpSession = request.getSession(true);

	GuestVO gvo = (GuestVO) httpSession.getAttribute("user");
	if(gvo == null){
		session.removeAttribute("backpage");
		session.setAttribute("backpage","/space_detail.sgg?"+ "tbsp_num=" + tbsp_num);
%>
		location.href="/host/hostLogin.sgg";
<%			
	}

	else {
%>
		$("#bookingSelect").attr({
			action : "/booking/booking.sgg",
			method : "POST",
			enctype : "application/x-www-form-urlencoded"
		}).submit();
<%
	} 
%>
	
}
<%
GuestVO _svo = (GuestVO) httpSession.getAttribute("user");
HostVO hvo = null;
if(_svo == null){
	hvo = (HostVO) httpSession.getAttribute("HostVO");
}
	
String mnum = null;
String mnick = null;
if(_svo != null) {
	mnum = _svo.getTBU_GUESTID();
	mnick = _svo.getTBU_NICKNAME();
} else if(hvo != null){
	mnum = hvo.getTBH_NUM();
	mnick = hvo.getTBH_NICKNAME();
}

%>

</script>
<style type="text/css">
body {
  font-family: "Century Gothic", 'Lato', sans-serif;
  margin: 0;
}
a {
  text-decoration: none;
}
.et-hero-tabs,
.et-slide {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  position: relative;
  background: #eee;
  text-align: center;
  padding: 0 2em;
}
.et-hero-tabs-container {
  display: flex;
  flex-direction: row;
  position: absolute;
  top: 0;
  width: 100%;
  max-width: 900px;
  height: 70px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: #fff;
  z-index: 10;
}
.et-hero-tabs-container--top {
  position: fixed;
  top: 0;
}
.et-hero-tab {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  color: #000;
  letter-spacing: 0.1rem;
  transition: all 0.5s ease;
  font-size: 0.8rem;
}
.et-hero-ttt {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  color: #ffd014;
  letter-spacing: 0.1rem;
  transition: all 0.5s ease;
  font-size: 0.8rem;
  background-color: #704de4;
}
.et-hero-tab:hover {
  color: white;
  background: rgba(102, 177, 241, 0.8);
  transition: all 0.5s ease;
}
/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  max-height: 750px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 750px;
}
/* Hide the images by default */
.mySlides {
  display: none;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: red;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active, .dot:hover {
  background-color: #717171;
}
/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

</style>
</head>
<body>
<div class="wrap">
<header class="header">
	<!-- main header -->
	<%@include file="../../../WEB-INF/view/common/header.jsp" %>
	<!-- sub header -->
	<!-- 
	<div class="subheader_wrap">
		<button class="btn_back" onclick="location.href='#'">
			<img id="icon_back" alt="이전" src="../resources/icon/back_y.jpg" width="24">
		</button>
		<h2>공간등록</h2>
		<button class="btn_menu" onclick="location.href='#'">
			<img id="icon_menu" alt="메뉴" src="../resources/icon/menu_bar_y.png" width="24">
		</button>
	</div> 
	-->
</header>
<form id="bookingSelect">
	<input type="hidden" name="tbsp_num" value="<%= tbsp_num %>"/>
</form>
<div class="content_wrap">
	<%
	if(list!=null && list.size()>0){
		for(int i=0;i<list.size();i++){
			SP_BasicInfoVO svo = (SP_BasicInfoVO)list.get(i);
%>
  <!-- Hero -->
  <section class="et-hero-tabs">
    <h1><%= svo.getTbsp_intro1() %></h1>
    
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="#tab-intro">공간소개</a>
      <a class="et-hero-tab" href="#tab-info">시설안내</a>
      <a class="et-hero-tab" href="#tab-caution">유의사항</a>
      <a class="et-hero-tab" href="#tab-refund">환불정책</a>
      <a class="et-hero-tab" href="#tab-qna">Q&A</a>
      <a class="et-hero-tab" href="#tab-review">이용후기</a>
      <a class="et-hero-ttt" onclick="booking()" id="booking">예약하기</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </section>

  <!-- Main -->
  <main class="et-main">
   <div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 2</div>
        <img src="../../../resources/img/<%= svo.getTbsp_img1()%>" border="1" alt="image" style="width:100%">
        <div class="text">공간사진1</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 2</div>
        <img src="../../../resources/img/<%= svo.getTbsp_img2()%>" border="1" alt="image" style="width:100%">
        <div class="text">공간사진2</div>
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(0)"></span>
      <span class="dot" onclick="currentSlide(1)"></span>
    </div>
    <section class="et-slide" id="tab-intro">
      <h1>공간소개</h1>
      <h3><%= svo.getTbsp_intro2() %></h3>
    </section>
    <section class="et-slide" id="tab-info">
      <h1>시설안내</h1>
      <h3><%= svo.getTbsp_guide() %></h3>
    </section>
    <section class="et-slide" id="tab-caution">
      <h1>유의사항</h1>
      <h3><%= svo.getTbsp_caution() %></h3>
    </section>
    <section class="et-slide" id="tab-refund">
      <h1>환불정책</h1>
      <ul>
      	<li><h3><h3 style="color: gray">이용 15일전</h3><%= svo.getTbsp_refund1() %>% 환불</h3></li>
      	<li><h3><h3 style="color: gray">이용 7일전</h3><%= svo.getTbsp_refund2() %>%환불</h3></li>
      	<li><h3><h3 style="color: gray">이용 1일전</h3><%= svo.getTbsp_refund3() %>%환불</h3></li>
      </ul>
    </section>

    <div class="" id="tab-qna">
      <h1>Q&A</h1>
      	<div>
	     <jsp:include page="/qnaList.sgg">
     		<jsp:param name="qspnum" value="<%=tbsp_num%>"/>
			<jsp:param name="mnum" value="<%= mnum %>" />
			<jsp:param name="mnick" value="<%= mnick %>" />
		 </jsp:include>
		</div>
    </div>

    

	    <div class="" id="tab-review">
	      <h1>이용후기</h1>
			<div>
		      <jsp:include page="/reviewList.sgg">
		      		<jsp:param name="rvspnum" value="<%=tbsp_num%>"/>
					<jsp:param name="guestId" value="<%= mnum %>" />
					<jsp:param name="nickName" value="<%= mnick %>" />
			  </jsp:include>
			  </div>
	  </div>

	 
  </main>
  <%
		}
	}
%>
</div>

<footer class="footer">
	<%@include file="../../../WEB-INF/view/common/footer.jsp" %>
</footer>
</div>
<script type="text/javascript">
	var slideIndex = 0; //slide index
	//HTML 로드가 끝난 후 동작
	window.onload=function(){
	showSlides(slideIndex);
	
	// Auto Move Slide
	var sec = 3000;
	setInterval(function(){
	 slideIndex++;
	 showSlides(slideIndex);
	}, sec);
	}
	
	//Next/previous controls
	function moveSlides(n) {
	slideIndex = slideIndex + n
	showSlides(slideIndex);
	}
	
	//Thumbnail image controls
	function currentSlide(n) {
	slideIndex = n;
	showSlides(slideIndex);
	}
	
	function showSlides(n) {
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	var size = slides.length;
	
	if ((n+1) > size) {
	 slideIndex = 0; n = 0;
	}else if (n < 0) {
	 slideIndex = (size-1);
	 n = (size-1);
	}
	for (i = 0; i < slides.length; i++) {
	   slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
	   dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[n].style.display = "block";
	dots[n].className += " active";
	}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
class StickyNavigation {
	
	constructor() {
		this.currentId = null;
		this.currentTab = null;
		this.tabContainerHeight = 70;
		let self = this;
		$('.et-hero-tab').click(function() { 
			self.onTabClick(event, $(this)); 
		});
		$(window).scroll(() => { this.onScroll(); });
		$(window).resize(() => { this.onResize(); });
	}
	
	onTabClick(event, element) {
		event.preventDefault();
		let scrollTop = $(element.attr('href')).offset().top - this.tabContainerHeight + 1;
		$('html, body').animate({ scrollTop: scrollTop }, 600);
	}
	
	onScroll() {
		this.checkTabContainerPosition();
    this.findCurrentTabSelector();
	}
	
	onResize() {
		if(this.currentId) {
			this.setSliderCss();
		}
	}
	
	checkTabContainerPosition() {
		let offset = $('.et-hero-tabs').offset().top + $('.et-hero-tabs').height() - this.tabContainerHeight;
		if($(window).scrollTop() > offset) {
			$('.et-hero-tabs-container').addClass('et-hero-tabs-container--top');
		} 
		else {
			$('.et-hero-tabs-container').removeClass('et-hero-tabs-container--top');
		}
	}
	
	findCurrentTabSelector(element) {
		let newCurrentId;
		let newCurrentTab;
		let self = this;
		$('.et-hero-tab').each(function() {
			let id = $(this).attr('href');
			let offsetTop = $(id).offset().top - self.tabContainerHeight;
			let offsetBottom = $(id).offset().top + $(id).height() - self.tabContainerHeight;
			if($(window).scrollTop() > offsetTop && $(window).scrollTop() < offsetBottom) {
				newCurrentId = id;
				newCurrentTab = $(this);
			}
		});
		if(this.currentId != newCurrentId || this.currentId === null) {
			this.currentId = newCurrentId;
			this.currentTab = newCurrentTab;
			this.setSliderCss();
		}
	}
	
	

	
}

new StickyNavigation();

</script>

</body>
</html>