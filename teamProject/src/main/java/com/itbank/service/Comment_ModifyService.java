package com.itbank.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommentDAO;
import com.itbank.dao.CommentVO;

@Service
public class Comment_ModifyService {

	@Autowired private CommentDAO dao;
	
	public int commentModify(CommentVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("c_context", vo.getC_context());
		map.put("cnum", vo.getComment_num());
		
		return dao.modifyComment(map);
		
	}

}
