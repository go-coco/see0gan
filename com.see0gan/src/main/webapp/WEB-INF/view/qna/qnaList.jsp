<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
//QnA을 위한 자바스크립트 코드 
$(document).ready(function(){

	// QnA 목록의 최상위 요소 ID
	var qnaRootID = "#qnaWrap";

	var qnaRowClass = ".qna_row";
	// 수정/답글 폼을 보여줄 요소의 클래스명
	var showFormClassName = ".formShow";
	
	// 수정/답글 폼
	var $qnaUpdateForm = $("#insertReQna").clone();
	var $qnaReQnaForm = $("#insertReQna").clone();

	// QnA Row
	var $qnaRow = $("#qnaRowTemplate > div").clone();

	// 수정 폼 가공
	$qnaUpdateForm.attr("id", "updateQna");
	$qnaUpdateForm.find("input.qgroupnum").remove();
	$qnaUpdateForm.find("input.qtargetnum").remove();

	$qnaUpdateForm.find(".qformtitle").text("수정");
	$qnaUpdateForm.find("input.qspnum").attr({"class": "qnum", "name": "qnum"}).val("");
	$qnaUpdateForm.find("input.qnum").closest("tr").find("th").text("QnA번호");
	$qnaUpdateForm.find("input[type=submit]").val("수정");

	// 견본폼 삭제
	$("#qnaFormTemplate").remove();

	$("#updateQna").remove();

	$("#qnaRowTemplate").remove();

	console.log($qnaUpdateForm);

	// QnA 없을때 메세지 표시
	var $noQnaMsg = $("<div class='qna_root'><div class='qna_row'>QnA가 없습니다.</div></div>");

	// 상품번호 가져오기
	var qspNum = null;

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
					if(qData[0] == "qspnum"
					|| qData[0] == "gnum"
					|| qData[0] == "anum"){
						qspNum = qData[1];
						break;
					}
				}
			}
		}
	}
	console.log("qspNum => " + qspNum);

	// 한줄 만들기
	function generateRow(rowData){
		var $qRow = $qnaRow.clone();

		// 대QnA/최상위 QnA 감지
		var isRoot = false;
		if(rowData.qtargetnum == null || rowData.qtargetnum == ""){
			isRoot = true;
		}

		var qType = "qna_re";
		if(isRoot == true){
			qType = "qna_root";
		}

		$qRow.attr("class", qType);

		// 답글
		var btnReQna = "<input type='button' class='btnReQna sitebtn' value='답글' "
							+ "data-qgroupnum='" + rowData.qgroupnum + "' "
							+ "data-qtargetnum='" + rowData.qnum + "'> ";

		// 수정
		var btnUpdate = "<input type='button' class='btnUpdate sitebtn' value='수정' "
						+ "data-qnum='" + rowData.qnum + "'> ";

		// 삭제
		var btnDelete = "<input type='button' class='btnDelete sitebtn' value='삭제' "
						+ "data-qnum='" + rowData.qnum + "'> ";

		$qRow.find(".qna_btns").append(btnUpdate);
		$qRow.find(".qna_btns").append(btnDelete);
		$qRow.find(".qna_btns").append(btnReQna);

		// 대QnA이면서 타겟이 있다면
		if(isRoot == false && rowData.qgroupnum != rowData.qtargetnum){
			// $qRow.find(".req_target").attr("href", "#Qna-" + rowData.qtargetnum);
			// $qRow.find(".req_target").text(rowData.tarnick);
		//}else{
			$qRow.find(".req_target").remove();
		}

		$qRow.find(".qna_row").attr("id", "Qna-" + rowData.qnum);

		if(rowData.qcontents == null){
			rowData.qcontents = "";
		}

		$qRow.find(".qna_txt > span").text(rowData.qcontents);
		$qRow.find(".qna_date > span").text(rowData.qindate);
		$qRow.find(".qna_writer").text(rowData.mnick);

		return $qRow;
	}

	// QnA 새로고침
	function reloadQna(){
		// QnA목록
		$qnaList = $(qnaRootID).children(".qna_content");

		// 성공
		function reloadSuccess(data){
			console.log("data =>", data);

			// 상태가 OK라면(QnA목록을 가져왔다면)
			if(data.status == "OK"){
				var qnasData = data.qnas;

				// QnA목록이 있으면
				$qnaList.empty();
				if(qnasData != null && qnasData.length > 0){

					// QnA 출력
					for(var i = 0; i < qnasData.length; i++){
						var qData = qnasData[i];
						var $qRow = null;

						// 삭제된 QnA이 아니라면 내용 출력하기
						if(qData.qdelyn != null && qData.qdelyn == "N"){
							$qRow = generateRow(qData);
						}else{
							// 대QnA / 최상위QnA 감지
							var isRoot = false;
							if(qData.qtargetnum == null || qData.qtargetnum == ""){
								isRoot = true;
							}

							var qType = "qna_re";
							if(isRoot == true){
								qType = "qna_root";
							}

							$qRow = $("<div class='" + qType + "'>"
											+ "<div class='qna_row'>삭제된 QnA입니다.</div></div>");
						}

						$qnaList.append($qRow);
					}
				}else{
					$qnaList.append($noQnaMsg);
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
		var dataUrl = "listQData.sgg?" + qStr;
		console.log("dataUrl >>> : " + dataUrl);
		
		// 전송할 데이터
		var dataArr = {qspnum: qspNum};

		// ajax
		$.ajax({
			url: dataUrl,
			data: dataArr,
			type : "GET",
			success: reloadSuccess,
			error: reloadError
		});
	}

	// QnA 쓰기
	function insertQna(formEle, fnAct){
		console.log("Insert Qna");

		var insertURL = "qnaInsert.sgg";

		// 전송할 데이터
		var sendData = formEle.serialize();
		console.log("sendData => " + sendData);

		// 성공
		function insertSuccess(data){
			console.log("QnA 입력", data);

			// 응답데이터가 정상이면
			if(data != null){
				if(data.status != null){
					// data.status가 OK면(QnA 등록이 성공하면) QnA목록 새로고침
					if(data.status == "OK"){
						reloadQna();

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
			alert("통신오류 - QnA 등록 요청 실패.");
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
	function updateQna(formEle, fnAct){
		console.log("update Qna");

		// URL
		var updateURL = "qnaUpdate.sgg";

		// 데이터
		var sendData = formEle.serialize();
		console.log("sendData => " + sendData);

		// 성공
		function updateSuccess(data){
			console.log("QnA 수정", data);

			// 응답데이터가 정상이면
			if(data != null){
				if(data.status != null){
					// data.status가 OK면(QnA 수정이 성공하면) QnA목록 새로고침
					if(data.status == "OK"){
						reloadQna();

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
			alert("통신오류 - QnA 수정 요청 실패.");
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
	function deleteQna(btnEle){
		console.log("QnA 삭제", btnEle);
		if(confirm("삭제하시겠습니까?")){
			var insertURL = "qnaDelete.sgg";

			// QnA번호
			var qNum = btnEle.attr("data-qnum");
			console.log("qNum => ", qNum);

			// 데이터
			var sendData = {qnum : qNum};

			// 성공
			function deleteSuccess(data){
				console.log("QnA 삭제", data);

				// 응답데이터가 정상이면 메세지 출력
				if(data != null){
					if(data.status != null){
						alert(data.msg);
						// data.status가 OK면(QnA 삭제가 성공하면) QnA목록 새로고침
						if(data.status == "OK"){
							reloadQna();
						}
					}
				}
			}

			// 실패
			function deleteError(){
				alert("통신오류 - QnA 삭제 요청 실패.");
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
		showFormEle = $(qnaRootID).find(showFormClassName).empty();

		if(showFormEle != null){
			showFormEle.empty();
		}
	}

	// QnA에 폼 출력
	function showForm(btnEle, formObj){
		console.log("QnA에 폼 출력", btnEle);

		// 폼을 출력할 요소
		var showEle = null;

		showEle = btnEle.closest(qnaRowClass).parent().find(showFormClassName);
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

		// QnA번호
		var qNum = eventEle.attr("data-qnum");

		// 수정 데이터 가져오기 (ajax)
		// URL
		var selQURL = "qnaUpdate.sgg";

		// 데이터(QnA번호)
		var selQData = {"qnum": qNum};

		// 성공
		function selectSuccess(data){
			console.log("QnA 수정폼 준비 => ", data);

			// 데이터가 성공적으로 왔다면
			if(data != null && data.status != ""){
				// 데이터가 도착했다면(status가 OK라면)
				if(data.status != null && data.status == "OK"){
					var qResData = data.qnaData;

					if(qResData != null){
						// QnA 수정 폼 준비
						var $updateForm = $qnaUpdateForm.clone();
		
						// QnA번호 / 내용
						if(qResData.qnum != null && qResData.qnum.length > 0){
							$updateForm.find(".qnum").val(qResData.qnum);
						}

						if(qResData.qcontents != null && qResData.qcontents.length > 0){
							$updateForm.find(".qcontents").val(qResData.qcontents);
						}

						// 폼 출력하기
						showForm(eventEle, $updateForm);
					}
					
				}else{
					if(data.msg != null && data.msg.length > 0){
						alert(data.msg);
					}
				}
			}else{
				console.log("데이터 받아오기 실패!");
			}
		}

		// 실패
		function selectError(){
			alert("통신오류 - QnA정보를 가져올 수 없습니다.");
		}
		
		// ajax
		$.ajax({
			url: selQURL,
			data: selQData,
			type: "GET",
			success: selectSuccess,
			error: selectError
		});
	}

	// 대 QnA 폼 출력
	function showReQna(){
		console.log("대 QnA 폼 출력");

		// 이벤트가 발생한 요소
		var eventEle = $(this);

		// 대QnA 폼 준비
		var $reQForm = $qnaReQnaForm.clone();

		// 그룹번호 / 타겟번호
		var qGroupNum = eventEle.attr("data-qgroupnum");
		var qTargetNum = eventEle.attr("data-qtargetnum");

		console.log("qGroupNum => ", qGroupNum);
		console.log("qTargetNum => ", qTargetNum);

		// 대 QnA폼에 그룹번호 / 타겟번호 / 상품번호 설정하기
		if(qGroupNum != null){
			$reQForm.find(".qgroupnum").val(qGroupNum);
		}

		if(qTargetNum != null){
			$reQForm.find(".qtargetnum").val(qTargetNum);
		}

		if(qspNum != null){
			$reQForm.find(".qspnum").val(qspNum);
		}

		// 폼 출력하기
		showForm(eventEle, $reQForm);
	}

	// QnA 새로고침 버튼
	$("#btnQReload").click(reloadQna);

	// QnA 작성 submit
	$("#insertQna").submit(function(){
		console.log("QnA 작성 => " + this);

		function actionSuccess(){
			$("#insertQna .qcontents").val("");
		}

		insertQna($(this), actionSuccess);

		return false;
	});

	// 대QnA 작성 submit
	$(document).on("submit", "#insertReQna", function(){
		console.log("대QnA 작성 => " + this);

		function actionSuccess(){
			emptyShowForm();
		}

		insertQna($(this), actionSuccess);

		return false;
	});

	// QnA 수정 submit
	$(document).on("submit", "#updateQna", function(){
		console.log("QnA 수정 => " + this);

		function actionSuccess(){
			emptyShowForm();
		}

		updateQna($(this), actionSuccess);

		return false;
	});

	// QnA 삭제 버튼
	$(qnaRootID).on("click", ".btnDelete", function(){
		 deleteQna($(this));
	});

	// QnA 수정 버튼
	$(qnaRootID).on("click", ".btnUpdate", showUpdate);

	// 대QnA 버튼
	$(qnaRootID).on("click", ".btnReQna", showReQna);

	//Byte 확인
	function printQnaByte(){
		// QnA 텍스트 에리어
		var tArea = $(this);

		// QnA 내용
		var qnaStr = tArea.val();

		// QnA 내용 Byte
		var strByte = getByteLength(qnaStr);

		// 300바이트 이상이면
		if(strByte > 300){
			alert("QnA은 300바이트까지만 입력할 수 있습니다.");

			// 자르기
			$(this).val(substrByte(qnaStr, 300));

			// Byte 재확인
			strByte = getByteLength(tArea.val());
		}

		// 출력
		tArea.parent().find(".qnaByte").text(strByte);
	}

	$("#insertQna, #qnaWrap").on("input", "textarea.qcontents", printQnaByte);
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
<div class="qna_wrap" id="qnaWrap">
	<div class="qna_content">
	<c:if test="${empty qnaList}">
		<div class="qna_root">
			<div class="qna_row">
				QnA이 없습니다.
			</div>
		</div>
	</c:if>
	<c:forEach items="${qnaList}" var="mpvo">
		<c:if test="${mpvo.qdelyn == 'Y'}">

			<c:if test="${empty mpvo.qtargetnum}">
				<c:set var="qtype" value="qna_root"/>
			</c:if>
			<c:if test="${not empty mpvo.qtargetnum}">
				<c:set var="qtype" value="qna_re"/>
			</c:if>
			
			<div class="${qtype}">
				<div class="qna_row" id="Qna-${mpvo.qnum}">
					삭제된 QnA입니다.
				</div>
			</div>
		</c:if>
		<c:if test="${mpvo.qdelyn == 'N'}">
		
			<c:if test="${empty mpvo.qtargetnum}">
				<c:set var="qtype" value="qna_root"/>
			</c:if>
			<c:if test="${not empty mpvo.qtargetnum}">
				<c:set var="qtype" value="qna_re"/>
			</c:if>
			<div class="${qtype}">
				<div class="qna_row" id="Qna-${mpvo.qnum}">
					<div class="qna_top">
						<span class="qna_writer">${mpvo.mnick}</span>
						<span class="qna_date">(${mpvo.qindate})</span>
						<div class="qna_btns">
							<input type="button" class="btnUpdate sitebtn" value="수정" data-qnum="${mpvo.qnum}">
							<input type="button" class="btnDelete sitebtn" value="삭제" data-qnum="${mpvo.qnum}">
							<input type="button" class="btnReQna sitebtn" value="답글"
									data-qgroupnum="${mpvo.qgroupnum}" data-qtargetnum="${mpvo.qnum}">
						</div>
					</div>
					<div class="qna_txt">
					<%-- 
						<c:if test="${not empty mpvo.qtargetnum && not empty mpvo.tarnick}">
							<a href="#Qna-${mpvo.qtargetnum}" class="req_target">${mpvo.tarnick}</a>
						</c:if>
						 --%>
						${mpvo.qcontents}
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
		<form method="POST" id="insertQna">
			<textarea name="qcontents" class="sitetxt form_ele_max qcontents"></textarea>
			<div class="formrow formrow_right">
				<input type="hidden" class="qspnum" name="qspnum" value="${param.qspnum}" readonly>
				<span class="qnaByte">0</span><span>/300 Byte</span>&nbsp;&nbsp;
				<input type="submit" class="sitebtn" value="작성">
			</div>
		</form>
	</div>
</div>

<div id="qnaFormTemplate" style="display:none;">
	<form method="POST" id="insertReQna">
		<div class="formcontent">
			<h3 class="qformtitle">답글</h3>
			<textarea id="areabox" name="qcontents" class="sitetxt form_ele_max qcontents"></textarea>
			<div class="formrow formrow_right">
				<input type="hidden" class="qgroupnum" name="qgroupnum" readonly>
				<input type="hidden" class="qtargetnum" name="qtargetnum" readonly>
				<input type="hidden" class="qspnum" name="qspnum" value="${param.qspnum}" readonly>
				<span class="qnaByte">0</span><span>/300 Byte</span>&nbsp;&nbsp;
				<input type="submit" class="sitebtn " value="작성">
			</div>
		</div>
	</form>
</div>

<%-- <input type="button" id="btnQReload" value="새로고침"> --%>

<div id="qnaRowTemplate" style="display:none;">
	<div>
		<div class="qna_row" id="Qna-">
			<div class="qna_top">
				<span class="qna_writer">txt</span>
				<span class="qna_date">(<span>txt</span>)</span>
				<div class="qna_btns"></div>
			</div>
			<div class="qna_txt">
			<!-- 
				<a href="#Qna-" class="req_target"></a>
				 -->
				<span>txt</span>
			</div>
		</div>
		<div class="formShow"></div>
	</div>
</div>
</body>
</html>
