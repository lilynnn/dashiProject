package com.dashi.report.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private String contentNo;
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
	private String memId;
	private String memName;
	private String blacklist;
	private int count;
	
	public Report() {}

	public Report(int reportNo, String contentNo, String reportingMem, String reportedMem, String reportContent,
			String reportDate, String reportStatus, int reportCategory, int typeBR, String arTitle, String arContent,
			String replyContent, String dspTitle, String animalIssue, String dspEtc, String memId, String memName,
			String blacklist, int count) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportingMem = reportingMem;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.typeBR = typeBR;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.replyContent = replyContent;
		this.dspTitle = dspTitle;
		this.animalIssue = animalIssue;
		this.dspEtc = dspEtc;
		this.memId = memId;
		this.memName = memName;
		this.blacklist = blacklist;
		this.count = count;
	}

	// 전체게시글조회용
	public Report(int reportNo, String contentNo, String reportedMem, String reportContent, String reportDate,
			String reportStatus, int reportCategory) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
	}
	
		
	public Report(int reportNo, String contentNo, String reportingMem, String reportedMem, String reportContent,
			String reportDate, String reportStatus, int reportCategory) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportingMem = reportingMem;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
	}

	// 입양후기용
	public Report(int reportNo, int reportCategory, String contentNo, String reportedMem, String reportContent, String reportDate, String reportStatus,
			 String arTitle, String arContent) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.reportedMem = reportedMem;
	}
	
	// 실종보호용
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
	
	
	// 댓글상세조회용
	public Report(int reportNo, String contentNo, String reportedMem, String reportContent, String reportDate,
			String reportStatus, int reportCategory, String replyContent) {
		super();
		this.reportNo = reportNo;
		this.contentNo = contentNo;
		this.reportedMem = reportedMem;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
		this.reportCategory = reportCategory;
		this.replyContent = replyContent;
	}
	
	// 블랙리스트용
	public Report(String reportedMem, String memId, String memName, String blacklist, int count) {
		super();
		this.reportedMem = reportedMem;
		this.memId = memId;
		this.memName = memName;
		this.blacklist = blacklist;
		this.count = count;
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

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}



	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", contentNo=" + contentNo + ", reportingMem=" + reportingMem
				+ ", reportedMem=" + reportedMem + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", reportStatus=" + reportStatus + ", reportCategory=" + reportCategory + ", typeBR=" + typeBR
				+ ", arTitle=" + arTitle + ", arContent=" + arContent + ", replyContent=" + replyContent + ", dspTitle="
				+ dspTitle + ", animalIssue=" + animalIssue + ", dspEtc=" + dspEtc + ", memId=" + memId + ", memName="
				+ memName + ", blacklist=" + blacklist + ", count=" + count + "]";
	}

	
	
		
}
