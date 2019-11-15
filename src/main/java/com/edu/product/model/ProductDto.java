package com.edu.product.model;

import java.util.Date;

public class ProductDto {
	private int productNo = 0;
	private int genreNo = 0;
	private String title = "";
	private String titleFile = "";
	private String pdName = "";
	private String pdFile = "";
	private int price = 0;
	private int stock = 0;
	private String actor = "";
	private String adminCom = "";
	private int adminScore = 0;
	private String story = "";
	private Date creDate = null;
	private Date modDate = null;
	public ProductDto() {
		super();
	}
	public ProductDto(int productNo, int genreNo, String title, String titleFile, String pdName, String pdFile,
			int price, int stock, String actor, String adminCom, int adminScore, String story, Date creDate,
			Date modDate) {
		super();
		this.productNo = productNo;
		this.genreNo = genreNo;
		this.title = title;
		this.titleFile = titleFile;
		this.pdName = pdName;
		this.pdFile = pdFile;
		this.price = price;
		this.stock = stock;
		this.actor = actor;
		this.adminCom = adminCom;
		this.adminScore = adminScore;
		this.story = story;
		this.creDate = creDate;
		this.modDate = modDate;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleFile() {
		return titleFile;
	}
	public void setTitleFile(String titleFile) {
		this.titleFile = titleFile;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdFile() {
		return pdFile;
	}
	public void setPdFile(String pdFile) {
		this.pdFile = pdFile;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getAdminCom() {
		return adminCom;
	}
	public void setAdminCom(String adminCom) {
		this.adminCom = adminCom;
	}
	public int getAdminScore() {
		return adminScore;
	}
	public void setAdminScore(int adminScore) {
		this.adminScore = adminScore;
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
		return "ProductDto [productNo=" + productNo + ", genreNo=" + genreNo + ", title=" + title + ", titleFile="
				+ titleFile + ", pdName=" + pdName + ", pdFile=" + pdFile + ", price=" + price + ", stock=" + stock
				+ ", actor=" + actor + ", adminCom=" + adminCom + ", adminScore=" + adminScore + ", story=" + story
				+ ", creDate=" + creDate + ", modDate=" + modDate + "]";
	}
	
	
	
}
