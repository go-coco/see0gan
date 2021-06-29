<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
//댓글을 위한 자바스크립트 코드 
$(document).ready(function(){

	// 댓글 목록의 최상위 요소 ID
	var reviewRootID = "#reviewWrap";

	var reviewRowClass = ".review_row";
	
	// 수정/답글 폼을 보여줄 요소의 클래스명
	var showFormClassName = ".formShow";
	
	// 수정/답글 폼
	var $reviewUpdateForm = $("#insertReReview").clone();

	// 댓글 Row
	var $reviewRow = $("#reviewRowTemplate > div").clone();

	// 수정 폼 가공
	$reviewUpdateForm.attr("id", "updateReview");
	$reviewUpdateForm.find("input.qgroupnum").remove();
	$reviewUpdateForm.find("input.qtargetnum").remove();

	$reviewUpdateForm.find(".cformtitle").text("수정");
	$reviewUpdateForm.find("input.rvspnum").attr({"class": "rvnum", "name": "rvnum"}).val("");
	$reviewUpdateForm.find("input.rvnum").closest("tr").find("th").text("댓글번호");
	$reviewUpdateForm.find("input[type=submit]").val("수정");

	// 견본폼 삭제
	$("#reviewFormTemplate").remove();

	$("#updateReview").remove();

	$("#reviewRowTemplate").remove();

	console.log($reviewUpdateForm);

	// 댓글 없을때 메세지 표시
	var $noReviewMsg = $("<div class='review_root'><div class='review_row'>댓글이 없습니다.</div></div>");

	// 상품번호 가져오기
	var rvspNum = null;

	// 쿼리스트링
	var qStr = location.search;
	console.log("Query String => " + qStr);

	if(qStr != null && qStr != ""){
		qStr = qStr.replace("?", "");
		var qArr = qStr.split("&");

		if(qArr != null && qArr.length > 0){
			for(var i = 0; i < qArr.length; i++){
				var qData = qArr[i].split("=");

				if(qData != null && qData.length > 0){
					if(qData[0] == "rvspnum"
					|| qData[0] == "gnum"
					|| qData[0] == "anum"){
						rvspNum = qData[1];
						break;
					}
				}
			}
		}
	}
	console.log("rvspNum => " + rvspNum);

	// 한줄 만들기
	function generateRow(rowData){
		var $cRow = $reviewRow.clone();
		console.log("$cRow >>> : " + $cRow);
		// 대댓글/최상위 댓글 감지
		var isRoot = true;
		// if(rowData.qtargetnum == null || rowData.qtargetnum == ""){
		// 	isRoot = true;
		// }

		var revType = "review_root";
		// if(isRoot == true){
		// 	qnType = "review_root";
		// }

		$cRow.attr("class", revType);
	

		// 수정
		var btnUpdate = "<input type='button' class='btnUpdate sitebtn' value='수정' "
						+ " data-rvnum='" + rowData.rvnum + "' data-rvspnum='" + rowData.rvspnum + "'> ";

		// 삭제
		var btnDelete = "<input type='button' class='btnDelete sitebtn' value='삭제' "
						+ " data-rvnum='" + rowData.rvnum + "'> ";

		$cRow.find(".review_btns").append(btnUpdate);
		$cRow.find(".review_btns").append(btnDelete);
		// $cRow.find(".review_btns").append(btnReReview);

		// 대댓글이면서 타겟이 있다면
		// if(isRoot == false && rowData.qgroupnum != rowData.qtargetnum){
		// 	$cRow.find(".reqn_target").attr("href", "#Review-" + rowData.qtargetnum);
		// 	$cRow.find(".reqn_target").text(rowData.tarname);
		// }else{
		 	$cRow.find(".reqn_target").remove();
		// }

		$cRow.find(".review_row").attr("id", "Review-" + rowData.rvnum);

		if(rowData.rvcontent == null){
			rowData.rvcontent = "";
 		}
		console.log()
		$cRow.find(".ratingss").text(rowData.rating);
		$cRow.find(".rvcontentss").text(rowData.rvcontent);
		$cRow.find(".review_date > span").text(rowData.rvinsertdate);
		$cRow.find(".review_writer").text(rowData.nickName);

		return $cRow;
	}

	// 댓글 새로고침
	function reloadReview(){
		// 댓글목록
		$reviewList = $(reviewRootID).children(".review_content");

		// 성공
		function reloadSuccess(data){
			console.log("data =>", data);

			// 상태가 OK라면(댓글목록을 가져왔다면)
			if(data.status == "OK"){
				var reviewsData = data.reviews; // 배열 데이터존 

				// 댓글목록이 있으면
				$reviewList.empty();
				if(reviewsData != null && reviewsData.length > 0){
					console.log("reviewsData >>> : " + reviewsData);
					// 댓글 출력
					for(var i = 0; i < reviewsData.length; i++){
						var revData = reviewsData[i]; // 배열에서 하나씩
						var $revRow = null;

						// 삭제된 댓글이 아니라면 내용 출력하기
						if(revData.rvdeleteyn != null && revData.rvdeleteyn == "N"){
							$revRow = generateRow(revData);
						}else{
							// 대댓글 / 최상위댓글 감지
							var isRoot = true;
							// if(rvData.qtargetnum == null || rvData.qtargetnum == ""){
							// 	isRoot = true;
							// }

							var revType = "review_root";
							// if(isRoot == true){
							// 	qnType = "review_root";
							// }

							$revRow = $("<div class='" + revType + "'>"
											+ "<div class='review_row'>삭제된 댓글입니다.</div></div>");
						}

						$reviewList.append($revRow);
					}
				}else{
					$reviewList.append($noReviewMsg);
				}
			}else if(data.status == "ERROR"){
				alert(data.msg);
			}
		}

		// 목록 불러오기 실패
		function reloadError(){
			alert("Error!");
		}

		// URL
		var dataUrl = "listData.sgg?" + qStr;
		console.log("reviewList dataUrl >>> : " + dataUrl);
		
		// 전송할 데이터
		var dataArr = {rvspnum: rvspNum};

		// ajax
		$.ajax({
			url: dataUrl,
			data: dataArr,
			type : "GET",
			success: reloadSuccess,
			error: reloadError
		});
	}

	// 댓글 쓰기
	function insertReview(formEle, fnAct){
		console.log("Insert Review");
		console.log("fnAct >>>: " + fnAct);
		var insertURL = "reviewInsert.sgg";

		// 전송할 데이터
		var sendData = formEle.serialize();
		console.log("sendData => " + sendData);

		// 성공
		function insertSuccess(data){
			console.log("댓글 입력", data);
		
			// 응답데이터가 정상이면
			if(data != null){
				if(data.status != null){
					// data.status가 OK면(댓글 등록이 성공하면) 댓글목록 새로고침
					if(data.status == "OK"){
						reloadReview();
						console.log("reload 성공했스빈다. ");
						// 설정한 동작 실행
						if(fnAct != null){
							fnAct();
						}
					}else{
						alert(data.msg);
					}
				}
			}
		}

		// 실패
		function insertError(){
			alert("통신오류 - 댓글 등록 요청 실패.");
		}

		// ajax
		$.ajax({
			url: insertURL,
			data: sendData,
			type : "POST",
			success: insertSuccess,
			error: insertError
		});
	}

	// 수정
	function updateReview(formEle, fnAct){
		console.log("update Review");

		// URL
		var updateURL = "reviewUpdate.sgg";

		// 데이터
		var sendData = formEle.serialize();
		console.log("sendData => " + sendData);

		// 성공
		function updateSuccess(data){
			console.log("댓글 수정", data);

			// 응답데이터가 정상이면
			if(data != null){
				if(data.status != null){
					// data.status가 OK면(댓글 수정이 성공하면) 댓글목록 새로고침
					if(data.status == "OK"){
						reloadReview();

						// 설정한 동작 실행
						if(fnAct != null){
							fnAct();
						}
					}else{
						alert(data.msg);
					}
				}
			}
		}

		// 실패
		function updateError(){
			alert("통신오류 - 댓글 수정 요청 실패.");
		}

		// ajax
		$.ajax({
			url: updateURL,
			data: sendData,
			type : "POST",
			success: updateSuccess,
			error: updateError
		});
	}

	// 삭제
	function deleteReview(btnEle){
		console.log("댓글 삭제", btnEle);
		if(confirm("삭제하시겠습니까?")){
			var insertURL = "reviewDelete.sgg";

			// 댓글번호
			var revNum = btnEle.attr("data-rvnum");
			console.log("revNum => ", revNum);

			// 데이터
			var sendData = {rvnum : revNum};

			// 성공
			function deleteSuccess(data){
				console.log("댓글 삭제", data);

				// 응답데이터가 정상이면 메세지 출력
				if(data != null){
					if(data.status != null){
						alert(data.msg);
						// data.status가 OK면(댓글 삭제가 성공하면) 댓글목록 새로고침
						if(data.status == "OK"){
							reloadReview();
						}
					}
				}
			}

			// 실패
			function deleteError(){
				alert("통신오류 - 댓글 삭제 요청 실패.");
			}

			// ajax
			$.ajax({
				url: insertURL,
				data: sendData,
				type : "POST",
				success: deleteSuccess,
				error: deleteError
			});
		}
	}

	// 폼을 출력할 요소들의 내용물 비우기
	function emptyShowForm(){
		var showFormEle = null
		showFormEle = $(reviewRootID).find(showFormClassName).empty();

		if(showFormEle != null){
			showFormEle.empty();
		}
	}

	// 댓글에 폼 출력
	function showForm(btnEle, formObj){
		console.log("댓글에 폼 출력", btnEle);

		// 폼을 출력할 요소
		var showEle = null;

		showEle = btnEle.closest(reviewRowClass).parent().find(showFormClassName);
		console.log("showEle => ", showEle);

		// 폼을 출력할 요소들의 내용물 비우기
		emptyShowForm();

		// 폼 출력
		if(showEle != null){
			showEle.prepend(formObj);
		}
	}

	// 수정 폼 출력
	function showUpdate(){
		console.log("수정 폼 출력");

		// 이벤트가 발생한 요소
		var eventEle = $(this);

		// 댓글번호
		var revNum = eventEle.attr("data-rvnum");
		
		var rvspNum = eventEle.attr("data-rvspnum")

		// 수정 데이터 가져오기 (ajax)
		// URL
		var selRevURL = "reviewUpdate.sgg";

		// 데이터(댓글번호)
		var selRevData = {"rvnum": revNum, "rvspnum": rvspNum};

		// 성공
		function selectSuccess(data){
			console.log("댓글 수정폼 준비 => ", data);

			// 데이터가 성공적으로 왔다면
			if(data != null && data.status != ""){
				// 데이터가 도착했다면(status가 OK라면)
				if(data.status != null && data.status == "OK"){
					var revResData = data.reviewData;

					if(revResData != null){
						// 댓글 수정 폼 준비
						var $updateForm = $reviewUpdateForm.clone();
		
						// 댓글번호 / 내용
						if(revResData.rvnum != null && revResData.rvnum.length > 0){
							$updateForm.find(".rvnum").val(revResData.rvnum);
						}

						if(revResData.rvcontent != null && revResData.rvcontent.length > 0){
							$updateForm.find(".rvcontent").val(revResData.rvcontent);
						}

						if(revResData.rating != null && revResData.rating.length > 0){
							$updateForm.find(".rating").val(revResData.rating);
						}

						// 폼 출력하기
						showForm(eventEle, $updateForm);
					}
					
				}else{
					if(data.msg != null && data.msg.length > 0){
						alert(data.msg);
					}
				}
			}
		}

		// 실패
		function selectError(){
			alert("통신오류 - 댓글정보를 가져올 수 없습니다.");
		}
		
		// ajax
		$.ajax({
			url: selRevURL,
			data: selRevData,
			type: "GET",
			success: selectSuccess,
			error: selectError
		});
	}

	// 대 댓글 폼 출력
	// function showReReview(){
	// 	console.log("대 댓글 폼 출력");

	// 	// 이벤트가 발생한 요소
	// 	var eventEle = $(this);

	// 	// 대댓글 폼 준비
	// 	var $reQnForm = $reviewReReviewForm.clone();

	// 	// 그룹번호 / 타겟번호
	// 	var qGroupNum = eventEle.attr("data-qgroupnum");
	// 	var qTargetNum = eventEle.attr("data-qtargetnum");

	// 	console.log("qGroupNum => ", qGroupNum);
	// 	console.log("qTargetNum => ", qTargetNum);

	// 	// 대 댓글폼에 그룹번호 / 타겟번호 / 상품번호 설정하기
	// 	if(qGroupNum != null){
	// 		$reQnForm.find(".qgroupnum").val(qGroupNum);
	// 	}

	// 	if(qTargetNum != null){
	// 		$reQnForm.find(".qtargetnum").val(qTargetNum);
	// 	}

	// 	if(rvspnum != null){
	// 		$reQnForm.find(".rvspnum").val(rvspnum);
	// 	}

	// 	// 폼 출력하기
	// 	showForm(eventEle, $reQnForm);
	// }

	// 댓글 새로고침 버튼
	$("#btnReload").click(reloadReview);

	// 댓글 작성 submit
	$("#insertReview").submit(function(){
		console.log("댓글 작성 => " + this);

		function actionSuccess(){
			$("#insertReview .rvcontent").val("");
		}

		insertReview($(this), actionSuccess);
		
		return false;
	});

	// 대댓글 작성 submit
	// $(document).on("submit", "#insertReReview", function(){
	// 	console.log("대댓글 작성 => " + this);

	// 	function actionSuccess(){
	// 		emptyShowForm();
	// 	}

	// 	insertReview($(this), actionSuccess);

	// 	return false;
	// });

	// 댓글 수정 submit
	$(document).on("submit", "#updateReview", function(){
		console.log("댓글 수정 => " + this);

		function actionSuccess(){
			emptyShowForm();
		}

		updateReview($(this), actionSuccess);

		return false;
	});

	// 댓글 삭제 버튼
	$(reviewRootID).on("click", ".btnDelete", function(){
		 deleteReview($(this));
	});

	// 댓글 수정 버튼
	$(reviewRootID).on("click", ".btnUpdate", showUpdate);

	// 대댓글 버튼
	// $(reviewRootID).on("click", ".btnReReview", showReReview);

	//Byte 확인
	function printReviewByte(){
		// 댓글 텍스트 에리어
		var tArea = $(this);
	
		// 댓글 내용
		var reviewStr = tArea.val();
		
		// 댓글 내용 Byte
		var strByte = getByteLength(reviewStr);

		// 300바이트 이상이면
		if(strByte > 300){
			alert("댓글은 300바이트까지만 입력할 수 있습니다.");

			// 자르기
			$(this).val(substrByte(reviewStr, 300));

			// Byte 재확인
			strByte = getByteLength(tArea.val());
		}

		// 출력
		tArea.parent().find(".reviewByte").text(strByte);
	}

	$("#insertReview, #reviewWrap").on("input", "textarea.rvcontent", printReviewByte);
});

//문자열의 바이트 길이를 구하는 함수 (UTF-8)
//str : 문자열
function getByteLength(str){

	// 문자열을 URI인코딩(퍼센트 인코딩)
	var strEnc = encodeURI(str);

	// 정규표현식을 통해 배열로 변환
	// (% 와 두글자 or 한글자)
	// 바이트 길이 + 1만큼의 배열이 반환됨 (내용물은 전부 빈 문자열)
	var encArr = strEnc.split(/%..|./);

	// 배열의 크기 - 1
	return encArr.length - 1;
}

//문자열을 원하는 바이트 길이만큼 자르는 함수 (UTF-8)
//str : 문자열 , size : 바이트 길이
function substrByte(str, size){

	// 전체문자열의 바이트 길이
	var strByteLen = 0;

	// 문자열의 길이
	var strLen = str.length;

	// 문자열 인덱스
	var i;

	for(i = 0; i < strLen; i++){
		// 문자열 하나
		var oneStr = str.charAt(i);
		var oneStrSize = getByteLength(oneStr);

		// 바이트길이가 원하는 바이트길이보다 크면 종료
		if(strByteLen + oneStrSize > size){
			break;
		}

		// 문자열 하나의 바이트길이를 전체문자열 바이트 길이에 추가
		strByteLen += oneStrSize;

	}

	// 문자열 인덱스 까지 자르기
	return str.substring(0, i);
}
</script>
</head>
<body>
<div class="review_wrap" id="reviewWrap">
	<div class="review_content">
	<c:if test="${empty reviewList}">
		<div class="review_root">
			<div class="review_row">
				댓글이 없습니다.
			</div>
		</div>
	</c:if>
	<c:forEach items="${reviewList}" var="mpvo">
		<c:if test="${mpvo.rvdeleteyn == 'Y'}">
		
			<c:set var="revtype" value="review_root"/>
			
			<div class="${revtype}">
				<div class="review_row" id="Review-${mpvo.rvnum}">
					삭제된 댓글입니다.
				</div>
			</div>
		</c:if>
		<c:if test="${mpvo.rvdeleteyn == 'N'}">
		
			<c:set var="revtype" value="review_root"/>
			
			<div class="${revtype}">
				<div class="review_row" id="Review-${mpvo.rvnum}">
					<div class="review_top">
						<span class="review_writer">${mpvo.nickName}</span>
						<span class="review_date">(${mpvo.rvinsertdate})</span>
						<div class="review_btns">
							<input type="button" class="btnUpdate sitebtn" value="수정" data-rvnum="${mpvo.rvnum}">
							<input type="button" class="btnDelete sitebtn" value="삭제" data-rvnum="${mpvo.rvnum}">
						</div>
					</div>
					<div class="review_txt">
						<sapn class="user_rating">유저별점: </sapn>
						<span class="review rating">
							${mpvo.rating}
						</span>
					</div>
					<div class="review_txt">
						<span class="review rvcontent">
						${mpvo.rvcontent}
						</span>
					</div>
				</div>
				<div class="formShow"></div>
			</div>
		</c:if>
	</c:forEach>
	</div>
</div>
<div class="formbox formbox_100">
	<div class="formcontent">
		<form method="POST" id="insertReview" action="reviewInsert.sgg">
			<select class="sitetxt form_ele_max rating" name=rating id=rating>
					<option>평점 선택</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
			</select>
			<textarea name="rvcontent" class="sitetxt form_ele_max rvcontent"></textarea>
			<div class="formrow formrow_right">
				<input type="hidden" class="rvnum" name="rvnum" value="${param.rvnum}" readonly>
				<input type="hidden" class="rvspnum" name="rvspnum" value="${param.rvspnum}" readonly>
				<span class="reviewByte">0</span><span>/300 Byte</span>&nbsp;&nbsp;
				<input type="submit" class="sitebtn" value="작성">
			</div>
		</form>
	</div>
</div>

<div id="reviewFormTemplate" style="display:none;">
	<form method="POST" id="insertReReview" action="reviewUpdate.sgg">
		<div class="formcontent">
			<h3 class="cformtitle">답글</h3>
			<input id="areabox" name="rating" class="sitetxt form_ele_max rating"><br>
			<textarea id="areabox" name="rvcontent" class="sitetxt form_ele_max rvcontent"></textarea>
			<div class="formrow formrow_right">
				<input type="hidden" class="rvspnum" name="rvspnum" value="${param.rvspnum}" readonly>
				<span class="reviewByte">0</span><span>/300 Byte</span>&nbsp;&nbsp;
				<input type="submit" class="sitebtn " value="작성">
			</div>
		</div>
	</form>
</div>

<div id="reviewRowTemplate" style="display:none;">
	<div>
		<div class="review_row" id="Review-">
			<div class="review_top">
				<span class="review_writer">txt</span>
				<span class="review_date">(<span>txt</span>)</span>
				<div class="review_btns"></div><br>
				<span class="ratingss">txt</span><br>
				<span class="rvcontentss">txt</span>
			</div>
		</div>
		<div class="formShow"></div>
	</div>
</div>
</body>
</html>