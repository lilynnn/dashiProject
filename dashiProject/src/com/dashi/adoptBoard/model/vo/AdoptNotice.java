package com.dashi.adoptBoard.model.vo;

public class AdoptNotice {

	// 나중에 동물 정보 보여질 객체 동물객체 불러오는 걸로 변경하기
	
	private String anlistNo;	// 입양공고글번호
	private String anTitle;		// 입양공고글 제목
	private String anContent;	// 입양공고글 내용
	private String writeDate;	// 입양공고글 작성일
	private int viewCount;		// 조회수
	private int adtStatus;		// 입양상태 (1.입양대기 / 2. 입양완료)
	private String postStatus;	// 게시글 상태(Y:활성화 / N:삭제된게시글)
	private String animalType; 	// D:강아지 / C:고양이 / E:기타
	private String entNo;		// 입소번호(동물정보 가져올)
	
	// 동물정보(입양신청시 사용)
	
	private String animalVariety;
	private String animalName;
	private String animalGender;
	private int animalAge;
	private String animalVaccin;
	private String animalNeutral;
	private String animalDisease;
	private String animalIssue;
	
	private String titleImg;	// 입양공고리스트 썸네일 주소
	
	
	public AdoptNotice() {}
	
	
	public AdoptNotice(String anTitle, String anContent, String entNo) {
		super();
		this.anTitle = anTitle;
		this.anContent = anContent;
		this.entNo = entNo;
	}


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

	
	public AdoptNotice(String anlistNo, String anTitle, String anContent, String writeDate, int viewCount, String entNo,
			String animalVariety, String animalName, String animalGender, int animalAge, String animalVaccin,
			String animalNeutral, String animalDisease, String animalIssue) {
		super();
		this.anlistNo = anlistNo;
		this.anTitle = anTitle;
		this.anContent = anContent;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.entNo = entNo;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalVaccin = animalVaccin;
		this.animalNeutral = animalNeutral;
		this.animalDisease = animalDisease;
		this.animalIssue = animalIssue;
	}
	
	public AdoptNotice(String anlistNo, String anTitle, String anContent, String writeDate, int viewCount,
			int adtStatus, String postStatus, String animalType, String entNo, String animalVariety, String animalName,
			String animalGender, int animalAge, String animalVaccin, String animalNeutral, String animalDisease,
			String animalIssue) {
		super();
		this.anlistNo = anlistNo;
		this.anTitle = anTitle;
		this.anContent = anContent;
		this.writeDate = writeDate;
		this.viewCount = viewCount;
		this.adtStatus = adtStatus;
		this.postStatus = postStatus;
		this.animalType = animalType;
		this.entNo = entNo;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalVaccin = animalVaccin;
		this.animalNeutral = animalNeutral;
		this.animalDisease = animalDisease;
		this.animalIssue = animalIssue;
	}

	
	
	public AdoptNotice(String anlistNo, String anTitle, int viewCount, int adtStatus, String animalType, String entNo,
			String titleImg) {
		super();
		this.anlistNo = anlistNo;
		this.anTitle = anTitle;
		this.viewCount = viewCount;
		this.adtStatus = adtStatus;
		this.animalType = animalType;
		this.entNo = entNo;
		this.titleImg = titleImg;
	}

	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	public String getAnimalVariety() {
		return animalVariety;
	}

	public void setAnimalVariety(String animalVariety) {
		this.animalVariety = animalVariety;
	}

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public String getAnimalGender() {
		return animalGender;
	}

	public void setAnimalGender(String animalGender) {
		this.animalGender = animalGender;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public String getAnimalVaccin() {
		return animalVaccin;
	}

	public void setAnimalVaccin(String animalVaccin) {
		this.animalVaccin = animalVaccin;
	}

	public String getAnimalNeutral() {
		return animalNeutral;
	}

	public void setAnimalNeutral(String animalNeutral) {
		this.animalNeutral = animalNeutral;
	}

	public String getAnimalDisease() {
		return animalDisease;
	}

	public void setAnimalDisease(String animalDisease) {
		this.animalDisease = animalDisease;
	}

	public String getAnimalIssue() {
		return animalIssue;
	}

	public void setAnimalIssue(String animalIssue) {
		this.animalIssue = animalIssue;
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
