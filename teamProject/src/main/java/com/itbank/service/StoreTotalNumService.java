package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.dao.StoreTotalNumDAO;
import com.itbank.dao.StoreTotalNumVO;

@Service
public class StoreTotalNumService {

	@Autowired
	private StoreTotalNumDAO dao;

	public List<StoreTotalNumVO> getTotalList() {
		return dao.TotalAll();
	}

	public void minnum (int key) {
		 dao.minnum(key);
	}

	public int getmaxnum(int key) {
		return dao.getmaxnum(key);
	}

	public int delete( ) {
		return dao.delete();
	}

	public int add(String userid,int key) {
		return dao.add(userid,key);
	}

	public int getmynum(String userid) {
		return dao.getmynum(userid);
	}
	
	public int getmynum(String userid,int key) {
		return dao.getmynum(userid,key);
	}

}
