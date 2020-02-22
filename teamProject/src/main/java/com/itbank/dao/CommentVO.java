package com.itbank.dao;

import java.sql.Date;

public class CommentVO {
	
	private int board_num, comment_num;
	private String c_userid, c_context;
	private Date c_date;
	
	
	public String getC_userid() {
		return c_userid;
	}
	public void setCuserid(String c_userid) {
		this.c_userid = c_userid;
	}
	public String getC_context() {
		return c_context;
	}
	public void setCcontext(String c_context) {
		this.c_context = c_context;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setCdate(Date c_date) {
		this.c_date = c_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoardnum(int board_num) {
		this.board_num = board_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setCommentnum(int comment_num) {
		this.comment_num = comment_num;
	}
}
