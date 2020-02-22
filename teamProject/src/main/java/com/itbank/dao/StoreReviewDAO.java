package com.itbank.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreReviewDAO {
	@Autowired private SqlSessionTemplate template;
	
	public int insert(Map<String, Object> map) {
		return template.insert("Store",map);
	}
	
	public List<StoreReviewVO> view(int key) {
		return template.selectList("Storereview",key);
	}
	
	public double getAvg(int key) {
		if(template.selectOne("avg",key)==null)return 0;
		else return template.selectOne("avg",key);
	}

	public List<StoreReviewVO> getMyStoreReview(int key) {
		return template.selectList("getMyStoreReview", key);
	}

	public List<CommunityVO> getMyReviewList(String userid) {
		return template.selectList("getMyReviewList", userid);
	}

}
