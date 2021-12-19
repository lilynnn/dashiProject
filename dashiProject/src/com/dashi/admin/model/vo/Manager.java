package com.dashi.admin.model.vo;

import java.sql.Date;

public class Manager {
	
	private int mnNo;
	private String mnId;
	private String mnPwd;
	private String mnNickname;
	private String mnName;
	private String mnEmail;
	private String mnPhone;
	private Date mnJoin;
	private String mnQuit;
	private String activation;
	
	public Manager() {}
	
	public Manager(int mnNo, String mnId, String mnName, String mnEmail, String mnPhone, Date mnJoin, String mnQuit,
			String activation) {
		super();
		this.mnNo = mnNo;
		this.mnId = mnId;
		this.mnName = mnName;
		this.mnEmail = mnEmail;
		this.mnPhone = mnPhone;
		this.mnJoin = mnJoin;
		this.mnQuit = mnQuit;
		this.activation = activation;
	}


	public Manager(int mnNo, String mnId, String mnPwd, String mnNickname, String mnName, String mnEmail,
			String mnPhone, Date mnJoin, String mnQuit, String activation) {
		super();
		this.mnNo = mnNo;
		this.mnId = mnId;
		this.mnPwd = mnPwd;
		this.mnNickname = mnNickname;
		this.mnName = mnName;
		this.mnEmail = mnEmail;
		this.mnPhone = mnPhone;
		this.mnJoin = mnJoin;
		this.mnQuit = mnQuit;
		this.activation = activation;
	}

	public int getMnNo() {
		return mnNo;
	}

	public void setMnNo(int mnNo) {
		this.mnNo = mnNo;
	}

	public String getMnId() {
		return mnId;
	}

	public void setMnId(String mnId) {
		this.mnId = mnId;
	}

	public String getMnPwd() {
		return mnPwd;
	}

	public void setMnPwd(String mnPwd) {
		this.mnPwd = mnPwd;
	}

	public String getMnNickname() {
		return mnNickname;
	}

	public void setMnNickname(String mnNickname) {
		this.mnNickname = mnNickname;
	}

	public String getMnName() {
		return mnName;
	}

	public void setMnName(String mnName) {
		this.mnName = mnName;
	}

	public String getMnEmail() {
		return mnEmail;
	}

	public void setMnEmail(String mnEmail) {
		this.mnEmail = mnEmail;
	}

	public String getMnPhone() {
		return mnPhone;
	}

	public void setMnPhone(String mnPhone) {
		this.mnPhone = mnPhone;
	}

	public Date getMnJoin() {
		return mnJoin;
	}

	public void setMnJoin(Date mnJoin) {
		this.mnJoin = mnJoin;
	}

	public String getMnQuit() {
		return mnQuit;
	}

	public void setMnQuit(String mnQuit) {
		this.mnQuit = mnQuit;
	}

	public String getActivation() {
		return activation;
	}

	public void setActivation(String activation) {
		this.activation = activation;
	}

	@Override
	public String toString() {
		return "Manager [mnNo=" + mnNo + ", mnId=" + mnId + ", mnPwd=" + mnPwd + ", mnNickname=" + mnNickname
				+ ", mnName=" + mnName + ", mnEmail=" + mnEmail + ", mnPhone=" + mnPhone + ", mnJoin=" + mnJoin
				+ ", mnQuit=" + mnQuit + ", activation=" + activation + "]";
	}

		
	
}
