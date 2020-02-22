package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommunityDAO;

@Service
public class Board_hitsService {

	@Autowired private CommunityDAO dao;
	
	public int hits(int bnum) {
		return dao.hits(bnum);
		
	}

}
