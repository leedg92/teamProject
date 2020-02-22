package com.itbank.dao;

public class StoreReviewVO {
	
	private String ORG_FILE_NAME,STORED_FILE_NAME,writer,content;
	private Long FILESIZE;
	private int score,key;
	public String getORG_FILE_NAME() {
		return ORG_FILE_NAME;
	}
	public void setORGFILENAME(String oRG_FILE_NAEM) {
		ORG_FILE_NAME = oRG_FILE_NAEM;
	}
	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}
	public void setSTOREDFILENAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}
	public Long getFILESIZE() {
		return FILESIZE;
	}
	public void setFILESIZE(Long fILESIZE) {
		FILESIZE = fILESIZE;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}



	
}
