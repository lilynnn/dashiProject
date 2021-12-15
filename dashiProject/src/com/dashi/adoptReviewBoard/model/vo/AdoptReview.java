package com.dashi.adoptReviewBoard.model.vo;

public class AdoptReview {

	
	
	private String arlistNo;	// 게시글번호(AR-001)
	private int memNo;			// 회원고유번호
	private String anlistNo;	// 입양공고 게시글번호(AN-001)
	private String nickname;	// 회원닉네임
	private String arTitle;		// 게시글제목
	private String arContent;	// 게시글내용
	private int viewCount;		// 조회수
	private String writeDate;	// 작성일
	private String postStatus;	// 게시글 상태 (유효Y/블라인드B /삭제D)
	
	public AdoptReview() {}

	public AdoptReview(String arlistNo, int memNo, String anlistNo, String nickname, String arTitle, String arContent,
			int viewCount, String writeDate, String postStatus) {
		super();
		this.arlistNo = arlistNo;
		this.memNo = memNo;
		this.anlistNo = anlistNo;
		this.nickname = nickname;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.postStatus = postStatus;
	}

	public String getArlistNo() {
		return arlistNo;
	}

	public void setArlistNo(String arlistNo) {
		this.arlistNo = arlistNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getAnlistNo() {
		return anlistNo;
	}

	public void setAnlistNo(String anlistNo) {
		this.anlistNo = anlistNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getArTitle() {
		return arTitle;
	}

	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}

	public String getArContent() {
		return arContent;
	}

	public void setArContent(String arContent) {
		this.arContent = arContent;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

	@Override
	public String toString() {
		return "AdoptReview [arlistNo=" + arlistNo + ", memNo=" + memNo + ", anlistNo=" + anlistNo + ", nickname="
				+ nickname + ", arTitle=" + arTitle + ", arContent=" + arContent + ", viewCount=" + viewCount
				+ ", writeDate=" + writeDate + ", postStatus=" + postStatus + "]";
	}
	
	

	
}