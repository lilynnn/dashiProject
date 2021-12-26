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
	private int viewCount;
	

	public Answer() {}


	public Answer(String inquireNo, int memNo, String qTitle, String qContent, String anContent,
			Date qCreat, Date inquireAnswerDate, int mnNo , int viewCount) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.anContent = anContent;
		this.qCreat = qCreat;
		this.inquireAnswerDate = inquireAnswerDate;
		this.mnNo = mnNo;
		this.viewCount=viewCount;
	}
	
	public Answer(String inquireNo, int memNo, String qTitle, String qContent, Date qCreat) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreat = qCreat;
		
	}
 
	public Answer(String inquireNo, int memNo, String qTitle, String qContent, Date qCreat, String anContent) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreat = qCreat;
		this.anContent=anContent;
	}
	
	public Answer(String inquireNo, int memNo, String qTitle, String qContent, Date qCreat, String anContent,int mnNo) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreat = qCreat;
		this.anContent=anContent;
		this.mnNo=mnNo;
	}
	
	public Answer(String inquireNo, int memNo, String qTitle, String qContent, Date qCreat, int viewCount) {
		super();
		this.inquireNo = inquireNo;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qCreat = qCreat;
		this.viewCount=viewCount;
	}
 
	
	public Answer(String status, String inquireNo, String memId, String qTitle, String qContent) {
		super();
		 
		this.inquireNo=inquireNo;
		this.memId=memId;
		this.qTitle=qTitle;
	
	}
	
	 
	
	public Answer(  String inquireNo, String memId, String qTitle, String qContent, Date qCreat, String anContent) {
		super();
		 
		this.inquireNo=inquireNo;
		this.memId=memId;
		this.qTitle=qTitle;
		this.qCreat=qCreat;
		this.anContent=anContent;
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

	public void setMemNo(int string) {
		this.memNo = string;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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





