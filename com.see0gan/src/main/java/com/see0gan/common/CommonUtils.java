package com.see0gan.common;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public abstract class CommonUtils {
	private static Logger logger = Logger.getLogger(CommonUtils.class);
	
	// 이미지 업로드	
	public static final String IMG_UPLOAD_PATH = "C:\\00.KOSMO78\\30.web\\eclipse_project_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\com.see0gan\\WEB-INF\\imgupload";
	//public static final String IMG_UPLOAD_PATH = "C:\\00.KOSMO72\\eclipseSpringWork\\testSpring3\\WebContent\\imgupload";
	public static final int IMG_FILE_SIZE = 2*1024*1024; // 2MB
	public static final String EN_CODE = "UTF-8";
	
	/**
	 * 설명
	 * : JSON문자열을 응답할때 Content-Type도 설정해주는 함수
	 * 매개변수 : String jsonStr - JSON문자열
	 * 반환값 : ResponseEntity - Controller 에 반환값으로 설정하면 JSON문자열을 응답(한글 안깨짐)
	 */
	public static ResponseEntity<String> responseJSON(String jsonStr){
		int strLen = -1;

		if(jsonStr != null) {
			strLen = jsonStr.length();
		}

		logger.info("[responseJSON] jsonStr length (-1 = null) => " + strLen);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=UTF-8");

		return new ResponseEntity<String>(jsonStr, headers, HttpStatus.OK);
	}

	
}
