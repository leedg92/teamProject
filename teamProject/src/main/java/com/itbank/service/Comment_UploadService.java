package com.itbank.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommentDAO;
import com.itbank.dao.CommentVO;

@Service
public class Comment_UploadService {
	
	@Autowired private CommentDAO dao;

	public int commentUpload(CommentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("comment_num", vo.getComment_num());
		map.put("c_userid", vo.getC_userid());
		map.put("c_context", vo.getC_context());
		map.put("board_num", vo.getBoard_num());
		
		
		return dao.commentUpload(map);
	}

}
