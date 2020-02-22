package com.itbank.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.dao.ImageDAO;
import com.itbank.dao.storeBoardDAO;
import com.itbank.dao.storeBoardVO;

@Service
public class storeBoardService {
	@Autowired ImageDAO idao;
	@Autowired storeBoardDAO dao;
	
	public List<storeBoardVO> selectAll(HttpServletRequest request){
		String type=request.getParameter("type"), search=request.getParameter("search");
		if(search==null||search.equals("")) return dao.selectAll();
		else return dao.selectAll(type,search);
	}
	
	public List<storeBoardVO> boardList(HttpServletRequest request) {

		int page = 1;
		if(request.getParameter("page") != null) page = Integer.parseInt(request.getParameter("page"));
		int end=page*5;
		int start=end-5;

		List<storeBoardVO> all;
		String type=request.getParameter("type"), search=request.getParameter("search");
		if(search==null||search.equals("")) all = dao.selectAll();
		else all = dao.selectAll(type,search);
		if(end>all.size()) end=all.size(); 

		List<storeBoardVO> list = new ArrayList<storeBoardVO>();
		for(int i = start;i<end;i++) {
			list.add(all.get(i));
		}
		return list;
		
	}
	

	public int insertbo(storeBoardVO vo) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		vo.setWridate(sdf.format(date));
		vo.setKey(getKey());

		return dao.insertBoard(vo);
	}
	

	public String checkAddress(String address) {
		return dao.checkAddress(address);
	}
	

	public List<storeBoardVO> selectBest(String type){
		List<storeBoardVO> tmp = dao.selectBest(type);
		List<storeBoardVO> bestBoard = new ArrayList<storeBoardVO>();
		int end = 5;
		if(tmp.size()<5) end = tmp.size();
		for(int i = 0; i<end; i++) {
			bestBoard.add(tmp.get(i));
		}
		return bestBoard;
	}
	

	public int getKey() {
		int key = 1;
		List<storeBoardVO> list = dao.selectAll();
		if(list.size()!=0) {
			for(storeBoardVO vo : list) {
				if(vo.getKey()>=key) {
					key = vo.getKey()+1;
				}
			}
		}
		return key;
	}
	
	public storeBoardVO getMyStore(String userid) {
		return dao.getMyStore(userid);
	}
	
	public storeBoardVO selectStore(int key) {
		return dao.selectStore(key);
	}
	
	public List<storeBoardVO> getPlace(String x, String y){
		Map<String, String> map = new HashMap<String, String>();
		map.put("x", x);
		map.put("y", y);
		return dao.getplace(map);
	}
	
	public int viewcount(int key) {
		return dao.viewcount(key);
	}

	public List<storeBoardVO> getBoardList() {
		return dao.selectAll();
	}
	
	public void storeDel(int key) {
		dao.storeDel(key);
		idao.imgDel(key);
	}
	
	public storeBoardVO storeModify(storeBoardVO vo) {
		int row = dao.storeModify(vo);

		return  dao.getMyStore(vo.getWriter());
	}
}
