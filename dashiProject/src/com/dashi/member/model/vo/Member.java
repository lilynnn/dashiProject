package com.dashi.member.model.vo;

import java.sql.Date;

public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickname;
	private String birth;
	private String memGender;
	private String email;
	private String postNo;
	private String address;
	private String addressDetail;
	private String phone;
	private Date enrollDate;
	private String adoptYN;
	private String enterYN;
	private String payYN;
	private String deleteYN;
	private String delReason;
	private Date delDate;
	private String blackYN;
	private String blackReason;
	private Date blackDate;
	private int grade;
	
	public Member() {}	
	
	
	
	public Member(int memNo, String memId, String memPwd, String memName, String nickname, String birth, String memGender,
			String email, String postNo, String address, String addressDetail, String phone, Date enrollDate,
			String adoptYN, String enterYN, String payYN, String deleteYN, String delReason, Date delDate,
			String blackYN, Date blackDate, int grade) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.birth = birth;
		this.memGender = memGender;
		this.email = email;
		this.postNo = postNo;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.adoptYN = adoptYN;
		this.enterYN = enterYN;
		this.payYN = payYN;
		this.deleteYN = deleteYN;
		this.delReason = delReason;
		this.delDate = delDate;
		this.blackYN = blackYN;
		this.blackDate = blackDate;
		this.grade = grade;
	}
	
	
	
	public Member(int memNo, String memId, String memName, String nickname) {
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.nickname = nickname;
	}



	//회원가입 받아줄 객체
	
	/**
	 * @author 누리
	 * 회원정보수정용 매개변수!
	 */
	public Member(String memId, String memName, String memPwd, String nickname, String birth, String phone,
			String email, String postNo, String address, String addressDetail) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.birth = birth;
		this.email = email;
		this.postNo = postNo;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
	}
	
	public Member(String memId) {
		
		super();
		this.memId = memId;
		
	
	}
	
	public Member(String memId, String memName, String birth, String phone,
			String email) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
	}
	
	public Member(int memNo, String memName, String phone, String birth, 
			String email) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
	}
	
	public Member(String memName, String email, String phone) {
		super();
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		 
	}
	

	public int getMemNo() {
		return memNo;
	}
	
	
	public Member(String memId, String memPwd, String memName, String nickname, String birth, String memGender,
			String email, String postNo, String address, String addressDetail, String phone) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickname = nickname;
		this.birth = birth;
		this.memGender = memGender;
		this.email = email;
		this.postNo = postNo;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
	}

	
	 
	
	public Member(int memNo, String memId, String memName, int grade, String blackYN) {
		super();
		this.memNo=memNo;
		this.memId = memId;
		this.memName = memName;
		this.grade = grade;
		this.blackYN=blackYN;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	
	// 관리자 회원정보조회용 매개변수 생성자
	public Member(int memNo, String memName, String memId, String birth, String address, String addressDetail,
			String phone, String adoptYN, String payYN, int grade) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memId = memId;
		this.birth = birth;
		this.address = address;
		this.addressDetail = addressDetail;
		this.phone = phone;
		this.adoptYN = adoptYN;
		this.payYN = payYN;
		this.grade = grade;
	}



	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getAdoptYN() {
		return adoptYN;
	}

	public void setAdoptYN(String adoptYN) {
		this.adoptYN = adoptYN;
	}

	public String getEnterYN() {
		return enterYN;
	}

	public void setEnterYN(String enterYN) {
		this.enterYN = enterYN;
	}

	public String getPayYN() {
		return payYN;
	}

	public void setPayYN(String payYN) {
		this.payYN = payYN;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public String getDelReason() {
		return delReason;
	}

	public void setDelReason(String delReason) {
		this.delReason = delReason;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public String getBlackYN() {
		return blackYN;
	}

	public void setBlackYN(String blackYN) {
		this.blackYN = blackYN;
	}

	public String getBlackReason() {
		return blackReason;
	}

	public void setBlackReason(String blackReason) {
		this.blackReason = blackReason;
	}

	public Date getBlackDate() {
		return blackDate;
	}

	public void setBlackDate(Date blackDate) {
		this.blackDate = blackDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickname=" + nickname + ", birth=" + birth + ", memGender=" + memGender + ", email=" + email
				+ ", postNo=" + postNo + ", address=" + address + ", addressDetail=" + addressDetail + ", phone="
				+ phone + ", enrollDate=" + enrollDate + ", adoptYN=" + adoptYN + ", enterYN=" + enterYN + ", payYN="
				+ payYN + ", deleteYN=" + deleteYN + ", delReason=" + delReason + ", delDate=" + delDate + ", blackYN="
				+ blackYN + ", blackReason=" + blackReason + ", blackDate=" + blackDate + ", grade=" + grade + "]";
	}
	
		
	
}
