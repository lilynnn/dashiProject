package com.dashi.notice.model.vo;

import java.sql.Date;

public class Notice {

	private String noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int viewCount;
	private Date writeDate;
	private String noticeYN;
	private String mnNo;
	private String status;
	
	public Notice(){}

	public Notice(String noticeNo, String noticeTitle, String noticeContent, int viewCount, Date writeDate,
			String noticeYN, String mnNo, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.noticeYN = noticeYN;
		this.mnNo = mnNo;
		this.status = status;
	}

	public Notice(String noticeNo, String noticeTitle, String noticeContent, int viewCount, Date writeDate,
			String noticeYN, String mnNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.noticeYN = noticeYN;
		this.mnNo = mnNo;
	}

	public Notice(String noticeNo, String noticeTitle, String noticeContent, int viewCount, Date writeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public Notice(String noticeNo, String noticeTitle, String noticeContent, int viewCount, Date writeDate,
			String mnNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.mnNo = mnNo;
	}

	public Notice(String noticeNo, String noticeTitle, int viewCount, Date writeDate, String mnNo) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.mnNo = mnNo;
	}
	
	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getNoticeYN() {
		return noticeYN;
	}

	public void setNoticeYN(String noticeYN) {
		this.noticeYN = noticeYN;
	}

	public String getMnNo() {
		return mnNo;
	}

	public void setMnNo(String mnNo) {
		this.mnNo = mnNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", viewCount=" + viewCount + ", writeDate=" + writeDate + ", noticeYN=" + noticeYN + ", mnNo=" + mnNo
				+ ", status=" + status + "]";
	}

	
	
}
