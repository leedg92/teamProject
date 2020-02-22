package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	@Autowired private SqlSessionTemplate template;

	public int commentUpload(Map<String, Object> map) {
		return template.insert("commentUpload", map);
	}

	public List<CommentVO> getCommentList(int Boardnum) {
		return template.selectList("getCommentList", Boardnum);		
	}

	public CommentVO getComment(int cnum) {
		return template.selectOne("getComment", cnum);
	}

	public int deleteCommentWithBoard(int bnum) {
		return template.update("deleteCommentWithBoard", bnum);
	}

	public int deleteComment(int cnum) {
		return template.update("deleteComment", cnum);	
	}

	public int modifyComment(Map<String, Object> map) {
		return template.update("modifyComment", map);
	}



}
