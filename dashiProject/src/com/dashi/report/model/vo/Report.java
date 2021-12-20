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

	public Report() {}

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

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", contentNo=" + contentNo + ", replyNo=" + replyNo + ", reportingMem="
				+ reportingMem + ", reportedMem=" + reportedMem + ", reportContent=" + reportContent + ", reportDate="
				+ reportDate + ", reportStatus=" + reportStatus + ", reportCategory=" + reportCategory + ", typeBR="
				+ typeBR + "]";
	}

	
		
}
