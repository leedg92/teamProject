package com.itbank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserDAO {
	@Autowired private SqlSessionTemplate template;
	
	public int insertReser(ReserVO vo2) {
		return template.insert("reser", vo2);
	}

	public ReserVO selectUser(String resname) {
		System.out.println("3");
		return template.selectOne("user", resname);
	}

	public Integer updateReser(Map<String, String> map) {
		String type = map.get("type");
		String key = null;
		switch(type) {
		case "1": key = "resdate"; break;
		case "2": key = "reshour"; break;
		case "3": key = "respeople"; break;
		}
		String val = map.get(key);
		map.put("column",key);
		map.put("val",val);
		System.out.println(map.get("column"));
		System.out.println(map.get("val"));
		template.update("update",map);
		
		return template.update("update", map);
	}

	public int deleteUser(String resname, int key) {
		ReserVO vo = new ReserVO();
		vo.setResname(resname);
		vo.setKey(key);
		return template.delete("delete", vo);
	}
	public List<ReserVO> getReserListByDate(Map<String, String> map) {

		List<ReserVO> list = template.selectList("getReserListByDate", map);

		return template.selectList("getReserListByDate", map);
	}

	public List<CommunityVO> getMyreserList(String userid) {
		return template.selectList("getMyReserList", userid);
	}
	

}
