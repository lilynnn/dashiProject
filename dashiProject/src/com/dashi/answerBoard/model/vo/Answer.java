package com.dashi.answerBoard.model.vo;

import java.sql.Date;

public class Answer {

	private String inquireNo;
	private int memNo;
	private String memId;
	private String qTitle;
	private String qContent;
	private String anContent;
	private Date qCreat;
	private Date inquireAnswerDate;
	private int mnNo;
	private int asCategory;


	public Answer() {}


	public Answer(String inquireNo, int memNo, String memId, String qTitle, String qContent, String anContent,
			Date qCreat, Date inquireAnswerDate, int mnNo, int asCategory) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.memId = memId;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.anContent = anContent;
		this.qCreat = qCreat;
		this.inquireAnswerDate = inquireAnswerDate;
		this.mnNo = mnNo;
		this.asCategory = asCategory;
	}
	

	public Answer(String inquireNo, int asCategory, String qTitle, String qContent, String memId, Date qCreat) {
		super();
		this.inquireNo = inquireNo;
		this.memId = memId;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreat = qCreat;
		this.asCategory = asCategory;
	}


	public String getInquireNo() {
		return inquireNo;
	}


	public void setInquireNo(String inquireNo) {
		this.inquireNo = inquireNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getqTitle() {
		return qTitle;
	}


	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}


	public String getqContent() {
		return qContent;
	}


	public void setqContent(String qContent) {
		this.qContent = qContent;
	}


	public String getAnContent() {
		return anContent;
	}


	public void setAnContent(String anContent) {
		this.anContent = anContent;
	}


	public Date getqCreat() {
		return qCreat;
	}
	
	public void setasCategory(int asCategory) {
		this.asCategory=asCategory;
	}
	
	public int getasCategory() {
		return asCategory;
	}


	public void setqCreat(Date qCreat) {
		this.qCreat = qCreat;
	}


	public Date getInquireAnswerDate() {
		return inquireAnswerDate;
	}


	public void setInquireAnswerDate(Date inquireAnswerDate) {
		this.inquireAnswerDate = inquireAnswerDate;
	}


	public int getMnNo() {
		return mnNo;
	}


	public void setMnNo(int mnNo) {
		this.mnNo = mnNo;
	}


	@Override
	public String toString() {
		return "Answer [inquireNo=" + inquireNo + ", memNo=" + memNo + ", memId=" + memId + ", qTitle=" + qTitle
				+ ", qContent=" + qContent + ", anContent=" + anContent + ", qCreat=" + qCreat + ", inquireAnswerDate="
				+ inquireAnswerDate + ", mnNo=" + mnNo + "]";
	}	
		
		
		}





