package com.itbank.dao;

public class ImageVO {
	String type, oriname, storename;
	int key,num;
	private byte[] FILEDATA;
	private Long FILESIZE;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public byte[] getFILEDATA() {
		return FILEDATA;
	}
	public void setFILEDATA(byte[] fILEDATA) {
		FILEDATA = fILEDATA;
	}
	public Long getFILESIZE() {
		return FILESIZE;
	}
	public void setFILESIZE(Long fILESIZE) {
		FILESIZE = fILESIZE;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
