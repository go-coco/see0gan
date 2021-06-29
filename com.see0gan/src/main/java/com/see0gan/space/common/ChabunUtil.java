package com.see0gan.space.common;

public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_H 	= "H"; // 호스트회원 : Host
	public static final String BIZ_GUBUN_S 	= "S"; // 공간등록 : Space
	//public static final String BIZ_GUBUN_RB = "RB"; // �Խ��� ���: REPLY BOARD
	//public static final String BIZ_GUBUN_N 	= "NB"; // �������� : NOTICE BOARD
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N : 
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	// 호스트번호 
	public static String getMemChabun(String type, String memNum) {
		
		return BIZ_GUBUN_H.concat(ChabunUtil.numPad(type, memNum));
	}
	
	// 공간등록 번호
	public static String getBoardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_S.concat(ChabunUtil.numPad(type, memNum));
	}
	
	/* �Խ��� ��� �� ��ȣ  
	public static String getRboardChabun(String type, String memNum) {
		
		return BIZ_GUBUN_RB.concat(ChabunUtil.numPad(type, memNum));
	}
	
	// ��������  ��ȣ  
	public static String getNoticeChabun(String type, String memNum) {
		
		return BIZ_GUBUN_N.concat(ChabunUtil.numPad(type, memNum));
	}
	*/
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String c = "1";
		System.out.println(">>> : " + ChabunUtil.getMemChabun("H", c));
		System.out.println(">>> : " + ChabunUtil.getBoardChabun("S", c));
		
	}
}
