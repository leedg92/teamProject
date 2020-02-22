package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommunityDAO;

@Service
public class GetBoardNumService {

	@Autowired private CommunityDAO dao;
	
	public int getBoardNum() {
		return dao.getBoardNum();
		
	}

	public int getBoardCount() {
		return dao.getBoardCount();
	}

}
