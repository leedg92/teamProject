package com.itbank.dao;

import java.sql.Timestamp;

public class storeBoardVO {
	private String storename, storenumber, runtime, 
		breaktime, price, foodtype, wridate, writer, address,membertype, parking;
	private float adlocationx,adlocationy;
	private int viewcount, key;
	
	public String getStorename() {
		return storename;
	}
	
	public void setStorename(String storename) {
		this.storename = storename;
	}
	
	public String getStorenumber() {
		return storenumber;
	}
	
	public void setStorenumber(String storenumber) {
		this.storenumber = storenumber;
	}
	
	public String getRuntime() {
		return runtime;
	}
	
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	
	public String getBreaktime() {
		return breaktime;
	}
	
	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getFoodtype() {
		return foodtype;
	}
	
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	
	public String getWridate() {
		return wridate;
	}
	
	public void setWridate(String wridate) {
		this.wridate = wridate;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getViewcount() {
		return viewcount;
	}
	
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	
	public int getKey() {
		return key;
	}
	
	public void setKey(int key) {
		this.key = key;
	}
	
	public String getMembertype() {
		return membertype;
	}
	
	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}
	
	public float getAdlocationx() {
		return adlocationx;
	}
	
	public void setAdlocationx(float adlocationx) {
		this.adlocationx = adlocationx;
	}
	
	public float getAdlocationy() {
		return adlocationy;
	}
	
	public void setAdlocationy(float adlocationy) {
		this.adlocationy = adlocationy;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}
	
}
