package com.dashi.adoptBoard.model.vo;

public class AdoptApply {
	
	
	private String aalistNo;	//게시글번호(SEQ_ADTNO)
	private String anlistNo;	//입양공고 게시글번호(AN-001)
	private int memNo;		//회원고유번호
	private String memName;		//회원이름
	private String aaTitle;		//게시글제목
	private String payStatus;	//N:결제전/Y:결제후
	private int adtStatus;		//1:승인대기/2:결제대기/3:결제완료/4:입양완료/5:반려
	private String postStatus;	//게시글 상태 (유효Y/삭제N)
	private String aaName;		//신청인명
	private int aaAge;			//신청인나이
	private String aaGender;	//신청인성별 	  AA_GENDER
	private String aaPhone;		//신청인 휴대폰번호  AA_PHONE
	private String aaEmail;		//신청인 이메일	  AA_EMAIL
	private String aaAddress;	//신청인 주소	  AA_ADDRESS
	private String marriageYN;	//결혼여부
	private String aaJob;		//신청인직업                AA_JOB
	private String adoptReason;	//입양신청이유             ADOPT_REASON
	private String parentExp;	//반려동물키워본경험    PARENT_EXP
	private String havePetYN;	//현재 키우는 동물여부  HAVE_PET_YN
	private String petType;		//현재 키우는 동물종류	PET_TYPE
	private String petAge;			//현재 키우는 동물나이	PET_AGE
	private String petGender;	//현재 키우는 동물성별  PET_GENDER
	private String petNeutral;	//현재 키우는 동물 중성화  PET_NEUTRAL
	private int aMate;			//동거중인 성인 수	 A_MATE
	private int cMate;			//동거중인 아이 수	 C_MATE
	private int childAge;		//동거중인 아이 나이 	 CHILD_AGE
	private String agreeYPN;	//동거인 동의여부		 AGREE_YPN
	private String eventMngAni;	//환경변화시 반려견여부	 EVENT_MNG_ANI
	private String emptyHour;	//하루에 집 비우는시간     EMPTYHOUR
	private String houseType;	//주거타입		     HOUSETYPE
	private String hselfYN;		//자가여부			 HSELF_YN
	private String agreeNeiYN;	//이웃 동의여부		 AGREE_NEI_YN
	private int expCost;		//한달 예상양육비용 	 EXP_COST

	public AdoptApply() {}

	public AdoptApply(String aalistNo, String anlistNo, int memNo, String memName, String aaTitle, String payStatus,
			int adtStatus, String postStatus, String aaName, int aaAge, String aaGender, String aaPhone, String aaEmail,
			String aaAddress, String marriageYN, String aaJob, String adoptReason, String parentExp, String havePetYN,
			String petType, String petAge, String petGender, String petNeutral, int aMate, int cMate, int childAge,
			String agreeYPN, String eventMngAni, String emptyHour, String houseType, String hselfYN, String agreeNeiYN,
			int expCost) {
		super();
		this.aalistNo = aalistNo;
		this.anlistNo = anlistNo;
		this.memNo = memNo;
		this.memName = memName;
		this.aaTitle = aaTitle;
		this.payStatus = payStatus;
		this.adtStatus = adtStatus;
		this.postStatus = postStatus;
		this.aaName = aaName;
		this.aaAge = aaAge;
		this.aaGender = aaGender;
		this.aaPhone = aaPhone;
		this.aaEmail = aaEmail;
		this.aaAddress = aaAddress;
		this.marriageYN = marriageYN;
		this.aaJob = aaJob;
		this.adoptReason = adoptReason;
		this.parentExp = parentExp;
		this.havePetYN = havePetYN;
		this.petType = petType;
		this.petAge = petAge;
		this.petGender = petGender;
		this.petNeutral = petNeutral;
		this.aMate = aMate;
		this.cMate = cMate;
		this.childAge = childAge;
		this.agreeYPN = agreeYPN;
		this.eventMngAni = eventMngAni;
		this.emptyHour = emptyHour;
		this.houseType = houseType;
		this.hselfYN = hselfYN;
		this.agreeNeiYN = agreeNeiYN;
		this.expCost = expCost;
	}
	
	public AdoptApply(String anlistNo, int memNo, String memName, String aaTitle, String aaName, int aaAge,
			String aaGender, String aaPhone, String aaEmail, String aaAddress, String marriageYN, String aaJob,
			String adoptReason, String parentExp, String havePetYN, String petType, String petAge, String petGender,
			String petNeutral, int aMate, int cMate, int childAge, String agreeYPN, String eventMngAni,
			String emptyHour, String houseType, String hselfYN, String agreeNeiYN, int expCost) {
		super();
		this.anlistNo = anlistNo;
		this.memNo = memNo;
		this.memName = memName;
		this.aaTitle = aaTitle;
		this.aaName = aaName;
		this.aaAge = aaAge;
		this.aaGender = aaGender;
		this.aaPhone = aaPhone;
		this.aaEmail = aaEmail;
		this.aaAddress = aaAddress;
		this.marriageYN = marriageYN;
		this.aaJob = aaJob;
		this.adoptReason = adoptReason;
		this.parentExp = parentExp;
		this.havePetYN = havePetYN;
		this.petType = petType;
		this.petAge = petAge;
		this.petGender = petGender;
		this.petNeutral = petNeutral;
		this.aMate = aMate;
		this.cMate = cMate;
		this.childAge = childAge;
		this.agreeYPN = agreeYPN;
		this.eventMngAni = eventMngAni;
		this.emptyHour = emptyHour;
		this.houseType = houseType;
		this.hselfYN = hselfYN;
		this.agreeNeiYN = agreeNeiYN;
		this.expCost = expCost;
	}

	public String getAalistNo() {
		return aalistNo;
	}

	public void setAalistNo(String aalistNo) {
		this.aalistNo = aalistNo;
	}

	public String getAnlistNo() {
		return anlistNo;
	}

	public void setAnlistNo(String anlistNo) {
		this.anlistNo = anlistNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getAaTitle() {
		return aaTitle;
	}

	public void setAaTitle(String aaTitle) {
		this.aaTitle = aaTitle;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
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

	public String getAaName() {
		return aaName;
	}

	public void setAaName(String aaName) {
		this.aaName = aaName;
	}

	public int getAaAge() {
		return aaAge;
	}

	public void setAaAge(int aaAge) {
		this.aaAge = aaAge;
	}

	public String getAaGender() {
		return aaGender;
	}

	public void setAaGender(String aaGender) {
		this.aaGender = aaGender;
	}

	public String getAaPhone() {
		return aaPhone;
	}

	public void setAaPhone(String aaPhone) {
		this.aaPhone = aaPhone;
	}

	public String getAaEmail() {
		return aaEmail;
	}

	public void setAaEmail(String aaEmail) {
		this.aaEmail = aaEmail;
	}

	public String getAaAddress() {
		return aaAddress;
	}

	public void setAaAddress(String aaAddress) {
		this.aaAddress = aaAddress;
	}

	public String getMarriageYN() {
		return marriageYN;
	}

	public void setMarriageYN(String marriageYN) {
		this.marriageYN = marriageYN;
	}

	public String getAaJob() {
		return aaJob;
	}

	public void setAaJob(String aaJob) {
		this.aaJob = aaJob;
	}

	public String getAdoptReason() {
		return adoptReason;
	}

	public void setAdoptReason(String adoptReason) {
		this.adoptReason = adoptReason;
	}

	public String getParentExp() {
		return parentExp;
	}

	public void setParentExp(String parentExp) {
		this.parentExp = parentExp;
	}

	public String getHavePetYN() {
		return havePetYN;
	}

	public void setHavePetYN(String havePetYN) {
		this.havePetYN = havePetYN;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getPetAge() {
		return petAge;
	}

	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getPetNeutral() {
		return petNeutral;
	}

	public void setPetNeutral(String petNeutral) {
		this.petNeutral = petNeutral;
	}

	public int getaMate() {
		return aMate;
	}

	public void setaMate(int aMate) {
		this.aMate = aMate;
	}

	public int getcMate() {
		return cMate;
	}

	public void setcMate(int cMate) {
		this.cMate = cMate;
	}

	public int getChildAge() {
		return childAge;
	}

	public void setChildAge(int childAge) {
		this.childAge = childAge;
	}

	public String getAgreeYPN() {
		return agreeYPN;
	}

	public void setAgreeYPN(String agreeYPN) {
		this.agreeYPN = agreeYPN;
	}

	public String getEventMngAni() {
		return eventMngAni;
	}

	public void setEventMngAni(String eventMngAni) {
		this.eventMngAni = eventMngAni;
	}

	public String getEmptyHour() {
		return emptyHour;
	}

	public void setEnmptyHour(String enmptyHour) {
		this.emptyHour = enmptyHour;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getHselfYN() {
		return hselfYN;
	}

	public void setHselfYN(String hselfYN) {
		this.hselfYN = hselfYN;
	}

	public String getAgreeNeiYN() {
		return agreeNeiYN;
	}

	public void setAgreeNeiYN(String agreeNeiYN) {
		this.agreeNeiYN = agreeNeiYN;
	}

	public int getExpCost() {
		return expCost;
	}

	public void setExpCost(int expCost) {
		this.expCost = expCost;
	}

	@Override
	public String toString() {
		return "AdoptApply [aalistNo=" + aalistNo + ", anlistNo=" + anlistNo + ", memNo=" + memNo + ", memName="
				+ memName + ", aaTitle=" + aaTitle + ", payStatus=" + payStatus + ", adtStatus=" + adtStatus
				+ ", postStatus=" + postStatus + ", aaName=" + aaName + ", aaAge=" + aaAge + ", aaGender=" + aaGender
				+ ", aaPhone=" + aaPhone + ", aaEmail=" + aaEmail + ", aaAddress=" + aaAddress + ", marriageYN="
				+ marriageYN + ", aaJob=" + aaJob + ", adoptReason=" + adoptReason + ", parentExp=" + parentExp
				+ ", havePetYN=" + havePetYN + ", petType=" + petType + ", petAge=" + petAge + ", petGender="
				+ petGender + ", petNeutral=" + petNeutral + ", aMate=" + aMate + ", cMate=" + cMate + ", childAge="
				+ childAge + ", agreeYPN=" + agreeYPN + ", eventMngAni=" + eventMngAni + ", emptyHour=" + emptyHour
				+ ", houseType=" + houseType + ", hselfYN=" + hselfYN + ", agreeNeiYN=" + agreeNeiYN + ", expCost="
				+ expCost + "]";
	}
	
	
}
