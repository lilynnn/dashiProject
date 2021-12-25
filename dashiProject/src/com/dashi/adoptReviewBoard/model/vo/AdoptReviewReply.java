package com.dashi.adoptReviewBoard.model.vo;

public class AdoptReviewReply {

	
	
	private String replyNo;
	private int memNo;
	private int refPostCTG;
	private String clistNo;
	private String nickname;
	private String replyContent;
	private String writeDate;
	private String updateDate;
	private String replyStatus;
	
	private String memId;
	
	public AdoptReviewReply() {}

	public AdoptReviewReply(String replyNo, int memNo, int refPostCTG, String clistNo, String nickname,
			String replyContent, String writeDate, String updateDate, String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.memNo = memNo;
		this.refPostCTG = refPostCTG;
		this.clistNo = clistNo;
		this.nickname = nickname;
		this.replyContent = replyContent;
		this.writeDate = writeDate;
		this.updateDate = updateDate;
		this.replyStatus = replyStatus;
	}
	
	// 댓글 조회용
	public AdoptReviewReply(String replyNo, int memNo, String memId, String nickname, String writeDate, String replyContent) {
		super();
		this.replyNo = replyNo;
		this.memNo = memNo;
		this.memId = memId;
		this.nickname = nickname;
		this.replyContent = replyContent;
		this.writeDate = writeDate;
	}	
	
	// 댓글 수정 폼
	public AdoptReviewReply(String replyNo, String replyContent) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
	}
	
	
	
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getRefPostCTG() {
		return refPostCTG;
	}

	public void setRefPostCTG(int refPostCTG) {
		this.refPostCTG = refPostCTG;
	}

	public String getClistNo() {
		return clistNo;
	}

	public void setClistNo(String clistNo) {
		this.clistNo = clistNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "AdoptReviewReply [replyNo=" + replyNo + ", memNo=" + memNo + ", refPostCTG=" + refPostCTG + ", clistNo="
				+ clistNo + ", nickname=" + nickname + ", replyContent=" + replyContent + ", writeDate=" + writeDate
				+ ", updateDate=" + updateDate + ", replyStatus=" + replyStatus + "]";
	}
	
	
	
}
