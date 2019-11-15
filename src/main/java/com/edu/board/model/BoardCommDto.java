package com.edu.board.model;

import java.util.Date;

public class BoardCommDto {
	private int comNo = 0;
	private int strNo = 0;
	private int userNo = 0;
	private String story = "";
	private Date creDate = null;
	
	public BoardCommDto() {
		super();
	}

	public BoardCommDto(int comNo, int strNo, int userNo, String story, Date creDate) {
		super();
		this.comNo = comNo;
		this.strNo = strNo;
		this.userNo = userNo;
		this.story = story;
		this.creDate = creDate;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
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

	@Override
	public String toString() {
		return "BoardComDto [comNo=" + comNo + ", strNo=" + strNo + ", userNo=" + userNo + ", story=" + story
				+ ", creDate=" + creDate + "]";
	}

}
