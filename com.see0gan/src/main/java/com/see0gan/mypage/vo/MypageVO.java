package com.see0gan.mypage.vo;

import org.springframework.stereotype.Component;

@Component("MypageVO")
public class MypageVO {
	
	// 페이징
	private String page;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	// 리뷰
	private String rvnum; // 리뷰번호 : 채번쿼리
	private String rvspnum; // 공간 번호
	private String guestId; // 작성자 ID
	private String rating; // 공간별점
	private String rvcontent; // 리뷰내용
	private String rvphoto; // 리뷰사진
	private String rvinsertdate; // 리뷰작성일
	private String rvupdatedate; // 리뷰수정일
	private String rvdeleteyn; // 리뷰삭제여부
	private String name;
	private String nickName;
	
	// Q&A
	private String qnum;
	private String qcontents;
	private String qgroupnum;
	private String qtargetnum;
	private String qdelyn;
	private String qspnum;
	private String qindate;
	private String mnum;

	// Q&A용 회원정보
	private String mnick;

	// Q&A 답변 타겟 회원 이름
	private String tarnick;

	// 공지사항
	private String ntnum; // 공지번호 : 채번쿼리
	private String nttype; // 공지종류
	private String ntsubject; // 공지제목
	private String ntcontent; // 공지내용
	private String ntinsertdate; // 공지등록일
	private String ntdeleteyn; // 공지삭제여부
	
	// 도움말
	private String hpnum; // 도움말번호 : 채번쿼리
	private String hptype; // 도움말종류
	private String hpsubject; // 도움말제목
	private String hpcontent; // 도움말내용
	private String hpinsertdate; // 도움말등록일
	private String hpdeleteyn; // 도움말삭제여부
	
	// 1:1 문의
	private String onenum; // 1:1문의 글번호 : 채번쿼리
	private String onemnum; // 1:1문의 작성자 유저넘버
	private String onenick; // 1:1문의 작성자 닉네임
	private String onecontent; // 1:1문의 질문내용
	private String oneinsertdate; // 1:1문의 등록일
	private String onedeleteyn; // 1:1문의 삭제여부
	
	public MypageVO() {}

	public MypageVO(String page, String pagesize, String groupsize, String curpage, String totalcount, String rvnum,
			String rvspnum, String guestId, String rating, String rvcontent, String rvphoto, String rvinsertdate,
			String rvupdatedate, String rvdeleteyn, String name, String nickName, String qnum, String qcontents,
			String qgroupnum, String qtargetnum, String qdelyn, String qspnum, String qindate, String mnum,
			String mnick, String tarnick, String ntnum, String nttype, String ntsubject, String ntcontent,
			String ntinsertdate, String ntdeleteyn, String hpnum, String hptype, String hpsubject, String hpcontent,
			String hpinsertdate, String hpdeleteyn, String onenum, String onemnum, String onenick, String onecontent,
			String oneinsertdate, String onedeleteyn) {
		super();
		this.page = page;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
		this.rvnum = rvnum;
		this.rvspnum = rvspnum;
		this.guestId = guestId;
		this.rating = rating;
		this.rvcontent = rvcontent;
		this.rvphoto = rvphoto;
		this.rvinsertdate = rvinsertdate;
		this.rvupdatedate = rvupdatedate;
		this.rvdeleteyn = rvdeleteyn;
		this.name = name;
		this.nickName = nickName;
		this.qnum = qnum;
		this.qcontents = qcontents;
		this.qgroupnum = qgroupnum;
		this.qtargetnum = qtargetnum;
		this.qdelyn = qdelyn;
		this.qspnum = qspnum;
		this.qindate = qindate;
		this.mnum = mnum;
		this.mnick = mnick;
		this.tarnick = tarnick;
		this.ntnum = ntnum;
		this.nttype = nttype;
		this.ntsubject = ntsubject;
		this.ntcontent = ntcontent;
		this.ntinsertdate = ntinsertdate;
		this.ntdeleteyn = ntdeleteyn;
		this.hpnum = hpnum;
		this.hptype = hptype;
		this.hpsubject = hpsubject;
		this.hpcontent = hpcontent;
		this.hpinsertdate = hpinsertdate;
		this.hpdeleteyn = hpdeleteyn;
		this.onenum = onenum;
		this.onemnum = onemnum;
		this.onenick = onenick;
		this.onecontent = onecontent;
		this.oneinsertdate = oneinsertdate;
		this.onedeleteyn = onedeleteyn;
	}

	public String getPage() {
		return page;
	}

	public String getPagesize() {
		return pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public String getRvnum() {
		return rvnum;
	}

	public String getRvspnum() {
		return rvspnum;
	}

	public String getGuestId() {
		return guestId;
	}

	public String getRating() {
		return rating;
	}

	public String getRvcontent() {
		return rvcontent;
	}

	public String getRvphoto() {
		return rvphoto;
	}

	public String getRvinsertdate() {
		return rvinsertdate;
	}

	public String getRvupdatedate() {
		return rvupdatedate;
	}

	public String getRvdeleteyn() {
		return rvdeleteyn;
	}

	public String getName() {
		return name;
	}

	public String getNickName() {
		return nickName;
	}

	public String getQnum() {
		return qnum;
	}

	public String getQcontents() {
		return qcontents;
	}

	public String getQgroupnum() {
		return qgroupnum;
	}

	public String getQtargetnum() {
		return qtargetnum;
	}

	public String getQdelyn() {
		return qdelyn;
	}

	public String getQspnum() {
		return qspnum;
	}

	public String getQindate() {
		return qindate;
	}

	public String getMnum() {
		return mnum;
	}

	public String getMnick() {
		return mnick;
	}

	public String getTarnick() {
		return tarnick;
	}

	public String getNtnum() {
		return ntnum;
	}

	public String getNttype() {
		return nttype;
	}

	public String getNtsubject() {
		return ntsubject;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public String getNtinsertdate() {
		return ntinsertdate;
	}

	public String getNtdeleteyn() {
		return ntdeleteyn;
	}

	public String getHpnum() {
		return hpnum;
	}

	public String getHptype() {
		return hptype;
	}

	public String getHpsubject() {
		return hpsubject;
	}

	public String getHpcontent() {
		return hpcontent;
	}

	public String getHpinsertdate() {
		return hpinsertdate;
	}

	public String getHpdeleteyn() {
		return hpdeleteyn;
	}

	public String getOnenum() {
		return onenum;
	}

	public String getOnemnum() {
		return onemnum;
	}

	public String getOnenick() {
		return onenick;
	}

	public String getOnecontent() {
		return onecontent;
	}

	public String getOneinsertdate() {
		return oneinsertdate;
	}

	public String getOnedeleteyn() {
		return onedeleteyn;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

	public void setRvnum(String rvnum) {
		this.rvnum = rvnum;
	}

	public void setRvspnum(String rvspnum) {
		this.rvspnum = rvspnum;
	}

	public void setGuestId(String guestId) {
		this.guestId = guestId;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

	public void setRvphoto(String rvphoto) {
		this.rvphoto = rvphoto;
	}

	public void setRvinsertdate(String rvinsertdate) {
		this.rvinsertdate = rvinsertdate;
	}

	public void setRvupdatedate(String rvupdatedate) {
		this.rvupdatedate = rvupdatedate;
	}

	public void setRvdeleteyn(String rvdeleteyn) {
		this.rvdeleteyn = rvdeleteyn;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setQnum(String qnum) {
		this.qnum = qnum;
	}

	public void setQcontents(String qcontents) {
		this.qcontents = qcontents;
	}

	public void setQgroupnum(String qgroupnum) {
		this.qgroupnum = qgroupnum;
	}

	public void setQtargetnum(String qtargetnum) {
		this.qtargetnum = qtargetnum;
	}

	public void setQdelyn(String qdelyn) {
		this.qdelyn = qdelyn;
	}

	public void setQspnum(String qspnum) {
		this.qspnum = qspnum;
	}

	public void setQindate(String qindate) {
		this.qindate = qindate;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public void setTarnick(String tarnick) {
		this.tarnick = tarnick;
	}

	public void setNtnum(String ntnum) {
		this.ntnum = ntnum;
	}

	public void setNttype(String nttype) {
		this.nttype = nttype;
	}

	public void setNtsubject(String ntsubject) {
		this.ntsubject = ntsubject;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public void setNtinsertdate(String ntinsertdate) {
		this.ntinsertdate = ntinsertdate;
	}

	public void setNtdeleteyn(String ntdeleteyn) {
		this.ntdeleteyn = ntdeleteyn;
	}

	public void setHpnum(String hpnum) {
		this.hpnum = hpnum;
	}

	public void setHptype(String hptype) {
		this.hptype = hptype;
	}

	public void setHpsubject(String hpsubject) {
		this.hpsubject = hpsubject;
	}

	public void setHpcontent(String hpcontent) {
		this.hpcontent = hpcontent;
	}

	public void setHpinsertdate(String hpinsertdate) {
		this.hpinsertdate = hpinsertdate;
	}

	public void setHpdeleteyn(String hpdeleteyn) {
		this.hpdeleteyn = hpdeleteyn;
	}

	public void setOnenum(String onenum) {
		this.onenum = onenum;
	}

	public void setOnemnum(String onemnum) {
		this.onemnum = onemnum;
	}

	public void setOnenick(String onenick) {
		this.onenick = onenick;
	}

	public void setOnecontent(String onecontent) {
		this.onecontent = onecontent;
	}

	public void setOneinsertdate(String oneinsertdate) {
		this.oneinsertdate = oneinsertdate;
	}

	public void setOnedeleteyn(String onedeleteyn) {
		this.onedeleteyn = onedeleteyn;
	}

}
