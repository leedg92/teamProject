package com.itbank.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.Community_isLikeDAO;
import com.itbank.dao.Community_isLikeVO;

@Service
public class Board_LikeCheckService {


	@Autowired
	private Community_isLikeDAO dao;
	
	public int getLikeNum(Community_isLikeVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bnum", vo.getBnum());
		map.put("userid", vo.getUserid());

		return dao.getLikeNum(map);
		
	}

	public int like(Community_isLikeVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("bnum", vo.getBnum());
		map.put("userid", vo.getUserid());
		

		return dao.like(map);
	}

	public int dislike(int likeNum) {

		
		return dao.dislike(likeNum);
	}
	

	
	public int likeCheck(Community_isLikeVO lvo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bnum", lvo.getBnum());
		map.put("userid", lvo.getUserid());
		
		
		return dao.likeCheck(map);
	}

}
