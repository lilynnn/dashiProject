package com.dashi.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int viewCount;
	private Date writeDate;
	private String noticeYN;
	private int mnNo;
	private String status;
	
	public Notice(){}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, int viewCount, Date writeDate,
			String noticeYN, int mnNo, String status) {
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
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

	public int getMnNo() {
		return mnNo;
	}

	public void setMnNo(int mnNo) {
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
