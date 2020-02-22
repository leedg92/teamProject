package com.itbank.dao;

import java.sql.Date;

public class CommunityVO {
	private String ORG_FILE_NAME, STORED_FILE_NAME, userid, title, context, username;
	private Long FILESIZE;
	private Date time;
	private int belike;
	private byte[] FILEDATA;
	private int bnum;
	private int deleted;
	private String address;
	private int hits;
	private String restaurant;
	
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getORG_FILE_NAME() {
		return ORG_FILE_NAME;
	}
	public void setORGFILENAME(String oRG_FILE_NAME) {
		ORG_FILE_NAME = oRG_FILE_NAME;
	}
	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}
	public void setSTOREDFILENAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Long getFILESIZE() {
		return FILESIZE;
	}
	public void setFILESIZE(Long fILESIZE) {
		FILESIZE = fILESIZE;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getBelike() {
		return belike;
	}
	public void setBelike(int belike) {
		this.belike = belike;
	}
	public byte[] getFILEDATA() {
		return FILEDATA;
	}
	public void setFILEDATA(byte[] fILEDATA) {
		FILEDATA = fILEDATA;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
}
