package com.edu.member.model;

import java.util.Date;

public class MemberDto {
	private int userNo = 0;
	private String id = "";
	private String passWord = "";
	private String userName = "";
	private String address = "";
	private String phone = "";
	private Date creDate = null;
	private Date modDate = null;
	private int cash = 0;
	private String admin = "F";
	
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(int userNo, String id, String passWord, 
			String userName, String address, String phone,
			Date creDate, Date modDate, int cash, String admin) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.passWord = passWord;
		this.userName = userName;
		this.address = address;
		this.phone = phone;
		this.creDate = creDate;
		this.modDate = modDate;
		this.cash = cash;
		this.admin = admin;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberDto [userNo=" + userNo + ", id=" + id + ", passWord=" + passWord + ", userName=" + userName
				+ ", address=" + address + ", phone=" + phone + ", creDate=" + creDate + ", modDate=" + modDate
				+ ", cash=" + cash + ", admin=" + admin + "]";
	}
	
}
