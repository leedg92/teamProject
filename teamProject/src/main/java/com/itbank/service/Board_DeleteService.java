package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommentDAO;
import com.itbank.dao.CommunityDAO;
import com.itbank.dao.Community_isLikeDAO;

@Service
public class Board_DeleteService {
	
	@Autowired private CommunityDAO dao;
	@Autowired private CommentDAO Cdao;
	@Autowired private Community_isLikeDAO ldao;

	public int deleteBoard(int bnum) {
		ldao.deleteLikeWithBoard(bnum);
		Cdao.deleteCommentWithBoard(bnum);
		dao.deleteImage(bnum);
		return dao.deleteBoard(bnum);
	}

}
