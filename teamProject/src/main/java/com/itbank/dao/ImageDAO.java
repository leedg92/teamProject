package com.itbank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ImageDAO {
	@Autowired private SqlSessionTemplate template;
	
	public int insert(Map<String, Object> map) {
		return template.insert("insert",map);
	}
	
	public ImageVO selectBlob(int key, int num) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("key", key);
		hm.put("num", num);
		return template.selectOne("selectBlob", hm);
	}
	
	public void imgDel(int key) {
		template.update("imgdel",key);
		
	}
	
	public List<ImageVO> blobAll(int key){
		return template.selectList("blobAll",key);
	}
	public ImageVO selectImageBLOB(String key) {
		return template.selectOne("selectImgBLOB", key);
	}
}