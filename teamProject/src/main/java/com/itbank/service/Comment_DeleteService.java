package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommentDAO;

@Service
public class Comment_DeleteService {

	@Autowired private CommentDAO dao;
	
	public int commentDelete(int cnum) {
		return dao.deleteComment(cnum);
		
	}

}
