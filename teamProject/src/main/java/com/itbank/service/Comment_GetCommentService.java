package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommentDAO;
import com.itbank.dao.CommentVO;

@Service
public class Comment_GetCommentService {

	@Autowired private CommentDAO dao;

	public List<CommentVO> getCommentList(int Boardnum) {
		return dao.getCommentList(Boardnum);
	}
	
	public CommentVO getComment(int cnum) {
		return dao.getComment(cnum);
	}

}
