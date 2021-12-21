package com.dashi.dspBoard.model.vo;

import java.sql.Date;

public class Dsp {
	
	private String dspNo;		//게시글번호
	private String memNo;		//회원고유번호
	private String dspTitle;	//게시글제목
	private String nickName;	//회원닉네임
	private int viewCount;		//조회수
	private Date writeDate;		//작성일
	private String dspStatus;	//진행상태(Y:진행중/N:완료)
	private String postStatus;	//게시글 상태 (유효Y/블라인드B /삭제D)
	private String ctg;			//실종/보호/목격/완료
	private String issueDate;	//발생날짜
	private String locationName;//발생지역이름
	private String phone;		//사건 당사자 연락처
	private String variety;		//동물품종
	private String gender;		//동물성별
	private String age;			//동물나이
	private String weight;		//동물몸무게
	private String issue;		//동물특이사항
	private String etc; 		//동물기타내용
	private int money;          // 사례금
	private String titleImg;    // 동물 대표사진
	private String contentImg;    // 동물 대표사진
	
	public Dsp() {
		super();
	}


	public Dsp(String dspNo, String memNo, String dspTitle, String nickName, int viewCount, Date writeDate,
			String dspStatus, String postStatus, String ctg, String issueDate, String locationName, String phone,
			String variety, String gender, String age, String weight, String issue, String etc, int money, String titleImg, String contentImg) {
		super();
		this.dspNo = dspNo;
		this.memNo = memNo;
		this.dspTitle = dspTitle;
		this.nickName = nickName;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.dspStatus = dspStatus;
		this.postStatus = postStatus;
		this.ctg = ctg;
		this.issueDate = issueDate;
		this.locationName = locationName;
		this.phone = phone;
		this.variety = variety;
		this.gender = gender;
		this.age = age;
		this.weight = weight;
		this.issue = issue;
		this.etc = etc;
		this.money = money;
		this.titleImg=titleImg;
		this.contentImg=contentImg;
		
	}
	
	

	//리스트 받아줄 객체
	public Dsp(String dspNo, String ctg, String dspTitle, int money, String locationName, String issue, String titleImg) {
		super();
		this.dspNo = dspNo;
		this.dspTitle = dspTitle;
		this.ctg = ctg;
		this.locationName = locationName;
		this.issue = issue;
		this.money = money;
		this.titleImg=titleImg;
	}

	

	
	public Dsp(String dspNo, String nickName, String dspTitle, Date writeDate, int viewCount,  String ctg, String issueDate, String locationName,
			String phone, String variety, String gender, String age, String weight, String issue, String etc,
			int money, String titleImg) {
		super();
		
		this.dspNo = dspNo;
		this.nickName = nickName;
		this.dspTitle = dspTitle;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.ctg = ctg;
		this.issueDate = issueDate;
		this.locationName = locationName;
		this.phone = phone;
		this.variety = variety;
		this.gender = gender;
		this.age = age;
		this.weight = weight;
		this.issue = issue;
		this.etc = etc;
		this.money = money;
		this.titleImg = titleImg;
		
	}

	
	//상세이미지 경로 불러올 객체
	public Dsp(String contentImg) {
		super();
		this.contentImg = contentImg;
	}
	
	

	public String getContentImg() {
		return contentImg;
	}




	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	public String getDspNo() {
		return dspNo;
	}


	public void setDspNo(String dspNo) {
		this.dspNo = dspNo;
	}


	public String getMemNo() {
		return memNo;
	}


	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}


	public String getDspTitle() {
		return dspTitle;
	}


	public void setDspTitle(String dspTitle) {
		this.dspTitle = dspTitle;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public String getDspStatus() {
		return dspStatus;
	}


	public void setDspStatus(String dspStatus) {
		this.dspStatus = dspStatus;
	}


	public String getPostStatus() {
		return postStatus;
	}


	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}


	public String getCtg() {
		return ctg;
	}


	public void setCtg(String ctg) {
		this.ctg = ctg;
	}


	public String getIssueDate() {
		return issueDate;
	}


	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}


	public String getLocationName() {
		return locationName;
	}


	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getVariety() {
		return variety;
	}


	public void setVariety(String variety) {
		this.variety = variety;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public String getIssue() {
		return issue;
	}


	public void setIssue(String issue) {
		this.issue = issue;
	}


	public String getEtc() {
		return etc;
	}


	public void setEtc(String etc) {
		this.etc = etc;
	}


	public int getMoney() {
		return money;
	}


	public void setMoney(int money) {
		this.money = money;
	}


	@Override
	public String toString() {
		return "Dsp [dspNo=" + dspNo + ", memNo=" + memNo + ", dspTitle=" + dspTitle + ", nickName=" + nickName
				+ ", viewCount=" + viewCount + ", writeDate=" + writeDate + ", dspStatus=" + dspStatus + ", postStatus="
				+ postStatus + ", ctg=" + ctg + ", issueDate=" + issueDate + ", locationName=" + locationName
				+ ", phone=" + phone + ", variety=" + variety + ", gender=" + gender + ", age=" + age + ", weight="
				+ weight + ", issue=" + issue + ", etc=" + etc + ", money=" + money + ", titleImg=" + titleImg
				+ ", contentImg=" + contentImg + "]";
	}






	


	
	
	
}


