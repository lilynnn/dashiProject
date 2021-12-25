package com.dashi.member.model.vo;

import java.sql.Date;

public class Pay {
	private int memNo;
	private String memName;
	private String payType;
	private String cardInfo;
	private String pbank;
	private Date phone;
	private String payDate;
	private String amount;
	
	
	public Pay() {
	}


	public Pay(int memNo, String memName, String payType, String cardInfo, String pbank, Date phone, String payDate,
			String amount) {
		this.memNo = memNo;
		this.memName = memName;
		this.payType = payType;
		this.cardInfo = cardInfo;
		this.pbank = pbank;
		this.phone = phone;
		this.payDate = payDate;
		this.amount = amount;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getPayType() {
		return payType;
	}


	public void setPayType(String payType) {
		this.payType = payType;
	}


	public String getCardInfo() {
		return cardInfo;
	}


	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}


	public String getPbank() {
		return pbank;
	}


	public void setPbank(String pbank) {
		this.pbank = pbank;
	}


	public Date getPhone() {
		return phone;
	}


	public void setPhone(Date phone) {
		this.phone = phone;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	@Override
	public String toString() {
		return "Pay [memNo=" + memNo + ", memName=" + memName + ", payType=" + payType + ", cardInfo=" + cardInfo
				+ ", pbank=" + pbank + ", phone=" + phone + ", payDate=" + payDate + ", amount=" + amount + "]";
	}
	
	
	
	
}
