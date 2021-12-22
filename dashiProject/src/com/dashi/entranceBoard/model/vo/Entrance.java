package com.dashi.entranceBoard.model.vo;

import java.sql.Date;

public class Entrance {
	
	private String entNo;
	private String memNo;
	private String memName;
	private  String entTitle;
	private Date entApplyDate;
	private String processResult;
	private String animalVariety;
	private String animalName;
	private String animalGender;
	private int animalAge;
	private String animalVaccinated;
	private String animalNeturalization;
	private String animalDisease;
	private String animalIssue;
	private Date entWantDate;
	private String entWantTime;
	private String reqPhone;
	private Date entDate;
	private String animalType;
	
	public Entrance() {}

	public Entrance(String entNo, String memNo, String memName, String entTitle, Date entApplyDate, String processResult,
			String animalVariety, String animalName, String animalGender, int animalAge, String animalVaccinated,
			String animalNeturalization, String animalDisease, String animalIssue, Date entWantDate, String entWantTime,
			String reqPhone, Date entDate, String animalType) {
		super();
		this.entNo = entNo;
		this.memNo = memNo;
		this.memName = memName;
		this.entTitle = entTitle;
		this.entApplyDate = entApplyDate;
		this.processResult = processResult;
		this.animalVariety = animalVariety;
		this.animalName = animalName;
		this.animalGender = animalGender;
		this.animalAge = animalAge;
		this.animalVaccinated = animalVaccinated;
		this.animalNeturalization = animalNeturalization;
		this.animalDisease = animalDisease;
		this.animalIssue = animalIssue;
		this.entWantDate = entWantDate;
		this.entWantTime = entWantTime;
		this.reqPhone = reqPhone;
		this.entDate = entDate;
		this.animalType = animalType;
	}

	public String getEntNo() {
		return entNo;
	}

	public void setEntNo(String entNo) {
		this.entNo = entNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEntTitle() {
		return entTitle;
	}

	public void setEntTitle(String entTitle) {
		this.entTitle = entTitle;
	}

	public Date getEntApplyDate() {
		return entApplyDate;
	}

	public void setEntApplyDate(Date entApplyDate) {
		this.entApplyDate = entApplyDate;
	}

	public String getProcessResult() {
		return processResult;
	}

	public void setProcessResult(String processResult) {
		this.processResult = processResult;
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

	public String getAnimalVaccinated() {
		return animalVaccinated;
	}

	public void setAnimalVaccinated(String animalVaccinated) {
		this.animalVaccinated = animalVaccinated;
	}

	public String getAnimalNeturalization() {
		return animalNeturalization;
	}

	public void setAnimalNeturalization(String animalNeturalization) {
		this.animalNeturalization = animalNeturalization;
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

	public Date getEntWantDate() {
		return entWantDate;
	}

	public void setEntWantDate(Date entWantDate) {
		this.entWantDate = entWantDate;
	}

	public String getEntWantTime() {
		return entWantTime;
	}

	public void setEntWantTime(String entWantTime) {
		this.entWantTime = entWantTime;
	}

	public String getReqPhone() {
		return reqPhone;
	}

	public void setReqPhone(String reqPhone) {
		this.reqPhone = reqPhone;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	@Override
	public String toString() {
		return "Entrance [entNo=" + entNo + ", memNo=" + memNo + ", memName=" + memName + ", entTitle=" + entTitle
				+ ", entApplyDate=" + entApplyDate + ", processResult=" + processResult + ", animalVariety="
				+ animalVariety + ", animalName=" + animalName + ", animalGender=" + animalGender + ", animalAge="
				+ animalAge + ", animalVaccinated=" + animalVaccinated + ", animalNeturalization="
				+ animalNeturalization + ", animalDisease=" + animalDisease + ", animalIssue=" + animalIssue
				+ ", entWantDate=" + entWantDate + ", entWantTime=" + entWantTime + ", reqPhone=" + reqPhone
				+ ", entDate=" + entDate + ", animalType=" + animalType + "]";
	}

	
	

}
