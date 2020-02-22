package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired private SqlSessionTemplate template;
	
	public int insert(Map<String, Object> map) {
		return template.insert("review",map);
	}
	
	public List<ReviewVO> view() {
		return template.selectList("view");
	}
	
	public int kNum(){
		return template.selectOne("MaxkNum");
	}
}
