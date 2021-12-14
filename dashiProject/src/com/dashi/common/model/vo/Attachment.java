package com.dashi.common.model.vo;

import java.sql.Date;

public class Attachment {

	private String attachNo;
	private String refNo;
	private String path;
	private Date upload;
	private String originName;
	private String changeName;
	private String attachStatus;
	private int attachLevel;
	
	public Attachment() {}
	
	public Attachment(String attachNo, String refNo, String path, Date upload, String originName, String changeName,
			String attachStatus, int attachLevel) {
		super();
		this.attachNo = attachNo;
		this.refNo = refNo;
		this.path = path;
		this.upload = upload;
		this.originName = originName;
		this.changeName = changeName;
		this.attachStatus = attachStatus;
		this.attachLevel = attachLevel;
	}

	public String getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(String attachNo) {
		this.attachNo = attachNo;
	}

	public String getRefNo() {
		return refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getUpload() {
		return upload;
	}

	public void setUpload(Date upload) {
		this.upload = upload;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getAttachStatus() {
		return attachStatus;
	}

	public void setAttachStatus(String attachStatus) {
		this.attachStatus = attachStatus;
	}

	public int getAttachLevel() {
		return attachLevel;
	}

	public void setAttachLevel(int attachLevel) {
		this.attachLevel = attachLevel;
	}

	@Override
	public String toString() {
		return "Attachment [attachNo=" + attachNo + ", refNo=" + refNo + ", path=" + path + ", upload=" + upload
				+ ", originName=" + originName + ", changeName=" + changeName + ", attachStatus=" + attachStatus
				+ ", attachLevel=" + attachLevel + "]";
	}
	
	
}
