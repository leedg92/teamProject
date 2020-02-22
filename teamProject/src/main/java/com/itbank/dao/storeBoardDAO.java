package com.itbank.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class storeBoardDAO {
	@Autowired private SqlSessionTemplate template;
	
	public List<storeBoardVO> selectAll(){
		return template.selectList("selectAll");
	}
	
	public List<storeBoardVO> selectAll(String type, String search){
		List<storeBoardVO> all = selectAll();
		ArrayList<storeBoardVO> list = new ArrayList<storeBoardVO>();
		switch(type) {
		case "foodtype" :	for(storeBoardVO vo : all) {
								if(vo.getFoodtype().contains(search))list.add(vo);
							} break;
		case "raname"	:	for(storeBoardVO vo : all) {
								if(vo.getStorename().contains(search))list.add(vo);
							} break;
		case "writer"	:	for(storeBoardVO vo : all) {
								if(vo.getWriter().contains(search))list.add(vo);
							} break;
		case "address"	:	for(storeBoardVO vo : all) {
								if(vo.getAddress().contains(search))list.add(vo);
							} break;
		}
		return list;
	}
	
	public int insertBoard(storeBoardVO vo) {
		vo.setMembertype("user");
		template.insert("insertBoard",vo);
		return vo.getKey();
	}
	
	public String checkAddress(String address) {
		List<storeBoardVO> bolist = template.selectList("selectAll");
		for(storeBoardVO vo : bolist) {
			if(vo.getAddress().equals(address)) {
				return "false";
			}
		}
		return "true";
	}

	public List<storeBoardVO> selectBest(String type){
		return template.selectList("selectBest",type);
	}
	
	public storeBoardVO getMyStore(String userid) {
		return template.selectOne("getMyStore", userid);
	}
	
	public storeBoardVO selectStore(int key) {
		return template.selectOne("selectStore",key);
	}
	
	public List<storeBoardVO> getplace(Map<String, String> map) {
		return template.selectList("place", map);
	}
	
	public int viewcount(int key){
		return template.update("viewcount",key);
	}
	
	public void storeDel(int key) {
		template.update("storedel",key);
		
	}
	public int storeModify(storeBoardVO vo) {
		return template.update("storeModify", vo);
	}

}
