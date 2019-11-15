package com.edu.board.model;

import java.util.Date;

public class BoardDto {
	private int strNo = 0;
	private int userNo = 0;
	private String userName = "";
	private String title = "";
	private String story = "";
	private Date creDate = null;
	private Date modDate = null;
	
	public BoardDto() {
		super();
	}

	public BoardDto(int strNo, int userNo, String userName, String title, String story, Date creDate, Date modDate) {
		super();
		this.strNo = strNo;
		this.userNo = userNo;
		this.userName = userName;
		this.title = title;
		this.story = story;
		this.creDate = creDate;
		this.modDate = modDate;
	}

	public int getStrNo() {
		return strNo;
	}

	public void setStrNo(int strNo) {
		this.strNo = strNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
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

	@Override
	public String toString() {
		return "BoardDto [strNo=" + strNo + ", userNo=" + userNo + ", userName=" + userName + ", title=" + title
				+ ", story=" + story + ", creDate=" + creDate + ", modDate=" + modDate + "]";
	}

	
}