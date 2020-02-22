package com.itbank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreTotalNumDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<StoreTotalNumVO> TotalAll() {

		return template.selectList("Storetotalnum");
	}
	
	public List<StoreTotalNumVO> selectASC(){
		return template.selectList("selectASC");
	}
	
	public List<StoreTotalNumVO> selectTotal(int key){
		return template.selectList("selectTotal",key);
	}

	public void minnum(int key) {
		List<StoreTotalNumVO> list = selectASC();
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getKey()==key)
			template.update("minnum", list.get(i));
		}
	}

	public int getmaxnum(int key) {
		if(template.selectOne("max", key)==null) return 0;
		return template.selectOne("max", key);
	}

	public int delete() {
		return template.delete("numdelete");
	}

	public int add(String userid, int key) {
		if(template.selectOne("getmynum",userid)!=null)return 0;
		// TODO Auto-generated method stub
		StoreTotalNumVO vo = new StoreTotalNumVO();
		vo.setKey(key);
		vo.setUserid(userid);
		if(template.selectList("selectnum",key)==null) {
			return template.insert("add1",vo);
		}
		System.out.println("Tlqkf"+getmaxnum(key));
		vo.setTotalnumber(getmaxnum(key)+1);
		return template.insert("add2",vo);
	}

	public int selectSize() {
		List<StoreTotalNumVO> list = selectASC();
		return list.size();
	}

	public int getmynum(String userid) {
		if(template.selectOne("getmynum",userid)==null)return 0;
		return template.selectOne("getmynum",userid);
	}
	
	public int getmynum(String userid,int key) {
		List<StoreTotalNumVO> list = selectTotal(key);
		if(list.size()==0)return 0;
		for(int i = 0;i<list.size();i++) {
			if(list.get(i).getUserid().equals(userid)) {
				
				if(template.selectOne("getmynum",userid)==null)return 0;
				return template.selectOne("getmynum",userid);				
			}
		}
		return 0;
	}

	
}
