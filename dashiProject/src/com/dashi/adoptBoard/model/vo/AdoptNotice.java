package com.dashi.adoptBoard.model.vo;

public class AdoptNotice {

	private String anlistNo;	// 입양공고글번호
	private String anTitle;		// 입양공고글 제목
	private String anContent;	// 입양공고글 내용
	private String writeDate;	// 입양공고글 작성일
	private int viewCount;		// 조회수
	private String entNo;		// 입소번호(동물정보 가져올)
	private int adtStatus;		// 입양상태 (1.입양대기 / 2. 입양완료)
	private String postStatus;	// 게시글 상태(Y:활성화 / N:삭제된게시글)
	private String animalType; 	// D:강아지 / C:고양이 / E:기타

	public AdoptNotice() {}
	
	public AdoptNotice(String anlistNo, String anTitle, String anContent, String writeDate, int viewCount, String entNo,
			int adtStatus, String postStatus) {
		super();
		this.anlistNo = anlistNo;
		this.anTitle = anTitle;
		this.anContent = anContent;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.entNo = entNo;
		this.adtStatus = adtStatus;
		this.postStatus = postStatus;
	}
	
	
	public AdoptNotice(String anlistNo, String anTitle, String writeDate, int viewCount, String entNo, int adtStatus,
			String animalType) {
		super();
		this.anlistNo = anlistNo;
		this.anTitle = anTitle;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.entNo = entNo;
		this.adtStatus = adtStatus;
		this.animalType = animalType;
	}

	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	public String getAnlistNo() {
		return anlistNo;
	}

	public void setAnlistNo(String anlistNo) {
		this.anlistNo = anlistNo;
	}

	public String getAnTitle() {
		return anTitle;
	}

	public void setAnTitle(String anTitle) {
		this.anTitle = anTitle;
	}

	public String getAnContent() {
		return anContent;
	}

	public void setAnContent(String anContent) {
		this.anContent = anContent;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getEntNo() {
		return entNo;
	}

	public void setEntNo(String entNo) {
		this.entNo = entNo;
	}

	public int getAdtStatus() {
		return adtStatus;
	}

	public void setAdtStatus(int adtStatus) {
		this.adtStatus = adtStatus;
	}

	public String getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

	@Override
	public String toString() {
		return "AdoptNotice [anlistNo=" + anlistNo + ", anTitle=" + anTitle + ", anContent=" + anContent
				+ ", writeDate=" + writeDate + ", viewCount=" + viewCount + ", entNo=" + entNo + ", adtStatus="
				+ adtStatus + ", postStatus=" + postStatus + "]";
	}

	
	
}
