package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommunityDAO;

@Service
public class Board_CountLikeService {
	
	@Autowired private CommunityDAO dao;

	public int countLike(int bnum) {
		return dao.countLike(bnum);
	}

}
