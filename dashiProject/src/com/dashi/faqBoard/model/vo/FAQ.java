package com.dashi.faqBoard.model.vo;

import java.sql.Date;

public class FAQ {

	private String FAQNo;
	private String FAQTitle;
	private String FAQContent;
	private Date FAQEnrollDate;
	private Date FAQModifyDate;
	private String FAQStatus;
	private int mnNo;
	private int FAQCategory;
	
	public FAQ() {}

	public FAQ(String fAQNo, String fAQTitle, String fAQContent, Date fAQEnrollDate, Date fAQModifyDate,
			String fAQStatus, int mnNo, int fAQCategory) {
		super();
		FAQNo = fAQNo;
		FAQTitle = fAQTitle;
		FAQContent = fAQContent;
		FAQEnrollDate = fAQEnrollDate;
		FAQModifyDate = fAQModifyDate;
		FAQStatus = fAQStatus;
		this.mnNo = mnNo;
		FAQCategory = fAQCategory;
	}
	
	public FAQ(String fAQNo, String fAQTitle, String fAQContent, int fAQCategory) {
		super();
		FAQNo = fAQNo;
		FAQTitle = fAQTitle;
		FAQContent = fAQContent;
		FAQCategory = fAQCategory;
	}

	public FAQ(String fAQNo, String fAQTitle, String fAQContent, Date fAQEnrollDate, int fAQCategory) {
		super();
		FAQNo = fAQNo;
		FAQTitle = fAQTitle;
		FAQContent = fAQContent;
		FAQEnrollDate = fAQEnrollDate;
		FAQCategory = fAQCategory;
	}

	public String getFAQNo() {
		return FAQNo;
	}

	public void setFAQNo(String fAQNo) {
		FAQNo = fAQNo;
	}

	public String getFAQTitle() {
		return FAQTitle;
	}

	public void setFAQTitle(String fAQTitle) {
		FAQTitle = fAQTitle;
	}

	public String getFAQContent() {
		return FAQContent;
	}

	public void setFAQContent(String fAQContent) {
		FAQContent = fAQContent;
	}

	public Date getFAQEnrollDate() {
		return FAQEnrollDate;
	}

	public void setFAQEnrollDate(Date fAQEnrollDate) {
		FAQEnrollDate = fAQEnrollDate;
	}

	public Date getFAQModifyDate() {
		return FAQModifyDate;
	}

	public void setFAQModifyDate(Date fAQModifyDate) {
		FAQModifyDate = fAQModifyDate;
	}

	public String getFAQStatus() {
		return FAQStatus;
	}

	public void setFAQStatus(String fAQStatus) {
		FAQStatus = fAQStatus;
	}

	public int getMnNo() {
		return mnNo;
	}

	public void setMnNo(int mnNo) {
		this.mnNo = mnNo;
	}

	public int getFAQCategory() {
		return FAQCategory;
	}

	public void setFAQCategory(int fAQCategory) {
		FAQCategory = fAQCategory;
	}

	@Override
	public String toString() {
		return "FAQ [FAQNo=" + FAQNo + ", FAQTitle=" + FAQTitle + ", FAQContent=" + FAQContent + ", FAQEnrollDate="
				+ FAQEnrollDate + ", FAQModifyDate=" + FAQModifyDate + ", FAQStatus=" + FAQStatus + ", mnNo=" + mnNo
				+ ", FAQCategory=" + FAQCategory + "]";
	}

	
}
