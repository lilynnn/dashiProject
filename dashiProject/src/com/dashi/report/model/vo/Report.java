package com.dashi.report.model.vo;

import java.sql.Date;

public class Report {
	
	private String reportNo;
	private String contentNo;
	private String replyNo;
	private int reportingMem;
	private int reportedMem;
	private String reportContent;
	private Date reportDate;
	private String reportStatus;
	private int reportCategory;
	
	public Report() {}

	public Report(String reportNo, String contentNo, String replyNo, int reportingMem, int reportedMem,
			String reportContent, Date reportDate, String reportStatus, int reportCategory) {
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

	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
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

	public int getReportingMem() {
		return reportingMem;
	}

	public void setReportingMem(int reportingMem) {
		this.reportingMem = reportingMem;
	}

	public int getReportedMem() {
		return reportedMem;
	}

	public void setReportedMem(int reportedMem) {
		this.reportedMem = reportedMem;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
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

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", contentNo=" + contentNo + ", replyNo=" + replyNo + ", reportingMem="
				+ reportingMem + ", reportedMem=" + reportedMem + ", reportContent=" + reportContent + ", reportDate="
				+ reportDate + ", reportStatus=" + reportStatus + ", reportCategory=" + reportCategory + "]";
	}
	
		
}
