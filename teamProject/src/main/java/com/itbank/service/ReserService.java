package com.itbank.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.ReserDAO;
import com.itbank.dao.ReserVO;
import com.itbank.dao.storeBoardVO;

@Service
public class ReserService {
	
	@Autowired private ReserDAO dao;
	@Autowired private storeBoardService storeboardservice;

public int reserInsert(ReserVO vo) {
		
		ReserVO vo2 = new ReserVO();
		
		vo2.setResdate(vo.getResdate());
		vo2.setReshour(vo.getReshour());
		vo2.setResname(vo.getResname());
		vo2.setRespeople(vo.getRespeople());
		vo2.setResnum(vo.getResnum());
		vo2.setUserid(vo.getUserid());
		vo2.setKey(vo.getKey());
		vo2.setStorename(getReserStoreName(vo.getKey()));
		return dao.insertReser(vo2);
	}


	public ReserVO getUser(String resname) {
		System.out.println("2");
		return dao.selectUser(resname);
	}


	public Integer modifyMember(Map<String, String> map) {
		Integer row = dao.updateReser(map);
		return null;
		
	}


	public int deleteMember(String resname, int key) {
		
		int row = dao.deleteUser(resname, key);
		return row;
	}
	
	public List<ReserVO> getReserListByDate(int key, String date){
		String skey = key+"";
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", skey);
		map.put("date", date);
		
		return dao.getReserListByDate(map);
	}


	public String getReserStoreName(int key) {
		return storeboardservice.selectStore(key).getStorename();
	}


}
