package com.itbank.dao;

import java.util.List;
import java.util.Map;

import javax.xml.transform.Templates;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO {
	
	@Autowired private SqlSessionTemplate template;

//	public int insert(Map<String, Object> map) {
//		return template.insert("upload", map);
//	}

	public List<CommunityVO> getBoardList(Map<String, Object> map) {
		return template.selectList("getBoardList", map);
	}

	public int insert(Map<String, Object> map) {
		return template.insert("upload", map);
	}
	
	public int cinsert(Map<String, Object> map) {
		return template.insert("cupload", map);
	}

	public CommunityVO selectImageBLOB(String filename) {
		return template.selectOne("selectImageBLOB", filename);
	}

	public CommunityVO getBoard(int bnum) {
		return template.selectOne("getBoard", bnum);
	}

	public int deleteBoard(int bnum) {
		return template.update("deleteBoard", bnum);
		
	}
	
	public int deleteImage(int bnum) {
		return template.update("deleteImage", bnum);
	}
	

	public int modifyBoard(Map<String, Object> map) {
		return template.update("modifyBoard", map);
	}

	public int getBoardNum() {
		return template.selectOne("getMaxBoardNum");
		
	}

	public int hits(int bnum) {
		return template.update("hitsPlus", bnum);
	}

	public List<CommunityVO> getMyComuList(String userid) {
		
		return template.selectList("myComuList", userid);
	}

	public int countLike(int bnum) {
		return template.selectOne("countLike", bnum);
	}

	public int getBoardCount() {
		return template.selectOne("getBoardCount");
	}

	public List<CommunityVO> getBoardList() {
		return template.selectList("getBoardList");
	}

	
	

	
	

}
