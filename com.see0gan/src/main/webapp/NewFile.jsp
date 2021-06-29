<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import= "com.see0gan.login.vo.GuestVO" %>   
  <%@ page import= "com.see0gan.login.vo.HostVO" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">


<title>See 공간 : 우리의 공간을 보다</title>
<% 
HttpSession httpSession = request.getSession(true);

GuestVO svo = (GuestVO) httpSession.getAttribute("user");
HostVO hvo = null;
if(svo == null){
	hvo = (HostVO) httpSession.getAttribute("HostVO");
	if(hvo == null){
	%>
	<script>alert("로그인 : false"); </script>
<% }
}

else {%>
<script>alert("로그인 : true"); </script>
<%
	} 
%>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

<div class="wrap">
<header class="header">
	<%@include file="WEB-INF/view/common/header.jsp" %>
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
	<div class="content_wrap">
	<div class="main_wrap">
		<section class="sp_type">
			<h1>어떤 공간을 찾고 있나요?</h1>
			<div class="sp_type_wrap">
				<div>
					<button class="sp_type_btn" onclick="location.href='/search.sgg?q=party'">
						<img alt="파티룸" src="resources/icon/party_room.jpg">
						<div class="keyword">파티룸</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search.sgg?q=practice'">
						<img alt="연습실" src="resources/icon/practice_room.jpg">
						<div class="keyword">연습실</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search.sgg?q=studio'">
						<img alt="촬영스튜디오" src="resources/icon/studio.jpg">
						<div class="keyword">촬영스튜디오</div>
					</button>
				</div>
				<div>
					<button class="sp_type_btn" onclick="location.href='/search.sgg?q=conference'">
						<img alt="회의실" src="resources/icon/conference_room.jpg">
						<div class="keyword">회의실</div>
					</button>
				</div>
			</div>
		</section>
		<section class="sp_recommend">
			<h2>오늘의 추천 공간</h2>
			<h3>뜨기 전에 먼저 예약하세요</h3>
			<div class="list_today_sp">
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/30059?type=recommend">
					<div class="sp_list_img">
						<img alt="" src="resources/img/party_room1.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">[강남역 파티룸] 블랑스와레 2</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
			
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/31900?keyword_id=11565&type=ad">
					<div class="sp_list_img">
						<img alt="" src="resources/img/practice_room1.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">운 댄스 연습실</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/30049?type=recommend">
					<div class="sp_list_img">
						<img alt="" src="resources/img/studio1.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">망고 렌탈스튜디오</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/16700?keyword_id=11475&type=ad">
					<div class="sp_list_img">
						<img alt="" src="resources/img/party_room2.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">아늑한 파티룸 코즈</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/30051?type=recommend">
					<div class="sp_list_img">
						<img alt="" src="resources/img/studio2.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">오찬석 사진공방</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
				<div class="sp_list">
				<a href="https://www.spacecloud.kr/space/30464?keyword_id=11488&type=ad">
					<div class="sp_list_img">
						<img alt="" src="resources/img/conference_room1.jpg">
					</div>
					<div class="sp_info">
						<h3 class="sp_info_tit">공간노닥</h3>
						<div class="sp_tags">
							<span class="tag_area_name">측후동</span> 
							<span>#코로나방역정기소독실시</span>
							<span>#코워킹스페이스</span>
							<span>#괜찮아마을</span>
							<span>#전시대관</span>
							<span>#목포대관</span>
						</div>
						<div class="sp_info_price_hour">
							<strong class="price">30,000</strong> 
							<span class="txt_unit">원/시간</span>
						</div>
						<div class="info_maxUser">
							<img alt="최대이용가능수" src="resources/icon/user.jpg" /> 
							<span>최대 12인</span> 
						</div>
					</div>
				</a>
				</div>
			</div>
		</section>
		<section class="sp_review">
			<h2>리뷰 ZONE</h2>
			<h3>이용자들의 생생한 후기를 만나보세요</h3>
		</section>
	</div>
</div>
<footer class="footer">
	<%@include file="WEB-INF/view/common/footer.jsp" %>
</footer>
</div>

</body>
</html>
