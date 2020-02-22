package com.itbank.dao;

import java.util.Date;

public class ReserVO {
	
	private String resdate, resname, resnum, reshour, userid, storename;
	private int respeople, key;
	
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getReshour() {
		return reshour;
	}
	public void setReshour(String reshour) {
		this.reshour = reshour;
	}
	public int getRespeople() {
		return respeople;
	}
	public void setRespeople(int respeople) {
		this.respeople = respeople;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	
	
}
