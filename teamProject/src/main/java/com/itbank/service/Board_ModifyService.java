package com.itbank.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommunityDAO;
import com.itbank.dao.CommunityVO;

@Service
public class Board_ModifyService {

	@Autowired private CommunityDAO dao;
	
	public int modifyBoard(CommunityVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int row = 0;
		
		map.put("title", vo.getTitle());
		map.put("context", vo.getContext());
		map.put("bnum", vo.getBnum());
		
		return dao.modifyBoard(map);
	}

}
