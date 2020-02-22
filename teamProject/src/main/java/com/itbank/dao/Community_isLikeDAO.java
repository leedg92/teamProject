package com.itbank.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Community_isLikeDAO {
	
	@Autowired private SqlSessionTemplate template;

	public int like(Map<String, Object> map) {
		return template.insert("like", map);
	}

	public int dislike(int likenum) {
		System.out.println("likeDAO - dislike - likenum : " + likenum);
		return template.delete("dislike", likenum);
	}

	public int likeCheck(Map<String, Object> map) {
		return template.selectOne("likeCheck", map);
	}

	public int getLikeNum(Map<String, Object> map) {
		return template.selectOne("getLikeNum", map);
	}

	public int deleteLikeWithBoard(int bnum) {
		return template.delete("deleteLike", bnum);
		
	}

	

}
