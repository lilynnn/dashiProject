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
	
	private String titleImg; 	// 썸네일이미지
	private String anType;		// 동물종류
	private String memId; 		// 회원아이디
	private String contentImg; 	// 상세이미지
	
	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAnType() {
		return anType;
	}

	public void setAnType(String anType) {
		this.anType = anType;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

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
	
	public AdoptReview(String arlistNo, int memNo,  String anType, String arTitle, String arContent, String nickname,
			String writeDate, String memId) {
		super();
		this.arlistNo = arlistNo;
		this.memNo = memNo;
		this.anType = anType;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.nickname = nickname;
		this.writeDate = writeDate;
		this.memId = memId;
	}

	// 관리자 입양후기리스트 조회용
		public AdoptReview(String arlistNo, String memId, String nickname, String anType, String arTitle, int viewCount, String writeDate
			) {
		super();
		this.arlistNo = arlistNo;
		this.memId = memId;
		this.nickname = nickname;
		this.anType = anType;
		this.arTitle = arTitle;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}
	
		
		
	// 상세이미지 조회용
	public AdoptReview(String contentImg) {
			super();
			this.contentImg = contentImg;
	}

	
	
	public String getContentImg() {
		return contentImg;
	}

	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
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
