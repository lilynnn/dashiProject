package com.dashi.report.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private String contentNo;
	private String replyNo;
	private String reportingMem;
	private String reportedMem;
	private String reportContent;
	private String reportDate;
	private String reportStatus;
	private int reportCategory;
	private int typeBR;
	private String arTitle;
	private String arContent;
	private String replyContent;
	private String dspTitle;
	private String animalIssue;
	private String dspEtc;
	
	
	public Report() {}

	
	
	


	public Report(int reportNo, String contentNo, String replyNo, String reportedMem, String reportContent,
			String reportDate, String reportStatus, int reportCategory, String arTitle, String replyContent) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.replyNo = replyNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.arTitle = arTitle;
		this.replyContent = replyContent;
	}


	public Report(int reportNo, int reportCategory, String contentNo, String replyNo, String reportedMem, String reportContent,
			String reportDate, String reportStatus, String arTitle, String arContent) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.replyNo = replyNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.arTitle = arTitle;
		this.arContent = arContent;
	}


	public Report(int reportNo, String contentNo, String reportedMem, String reportContent, String reportDate,
			String reportStatus, int reportCategory, String dspTitle, String animalIssue, String dspEtc) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.dspTitle = dspTitle;
		this.animalIssue = animalIssue;
		this.dspEtc = dspEtc;
	}




	public Report(int reportNo, String contentNo, String replyNo, String reportingMem, String reportedMem,
			String reportContent, String reportDate, String reportStatus, int reportCategory, int typeBR) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.replyNo = replyNo;
		this.reportingMem = reportingMem;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.typeBR = typeBR;
	}
	
	public Report(int reportNo, String contentNo, String replyNo, String reportingMem, String reportedMem,
			String reportContent, String reportDate, String reportStatus, int reportCategory) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.replyNo = replyNo;
		this.reportingMem = reportingMem;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
	}
	
	public Report(int reportNo, String contentNo, String reportedMem, String reportContent, String reportDate,
			String reportStatus, int reportCategory, String arTitle, String arContent) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.arTitle = arTitle;
		this.arContent = arContent;
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

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getContentNo() {
		return contentNo;
	}

	public void setContentNo(String contentNo) {
		this.contentNo = contentNo;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getReportingMem() {
		return reportingMem;
	}

	public void setReportingMem(String reportingMem) {
		this.reportingMem = reportingMem;
	}

	public String getReportedMem() {
		return reportedMem;
	}

	public void setReportedMem(String reportedMem) {
		this.reportedMem = reportedMem;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	public int getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(int reportCategory) {
		this.reportCategory = reportCategory;
	}

	public int getTypeBR() {
		return typeBR;
	}

	public void setTypeBR(int typeBR) {
		this.typeBR = typeBR;
	}
	

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getDspTitle() {
		return dspTitle;
	}

	public void setDspTitle(String dspTitle) {
		this.dspTitle = dspTitle;
	}

	public String getAnimalIssue() {
		return animalIssue;
	}

	public void setAnimalIssue(String animalIssue) {
		this.animalIssue = animalIssue;
	}

	public String getDspEtc() {
		return dspEtc;
	}

	public void setDspEtc(String dspEtc) {
		this.dspEtc = dspEtc;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", contentNo=" + contentNo + ", replyNo=" + replyNo + ", reportingMem="
				+ reportingMem + ", reportedMem=" + reportedMem + ", reportContent=" + reportContent + ", reportDate="
				+ reportDate + ", reportStatus=" + reportStatus + ", reportCategory=" + reportCategory + ", typeBR="
				+ typeBR + ", arTitle=" + arTitle + ", arContent=" + arContent + ", replyContent=" + replyContent
				+ ", dspTitle=" + dspTitle + ", animalIssue=" + animalIssue + ", dspEtc=" + dspEtc + "]";
	}

	
		
}
