package com.itbank.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired private SqlSessionTemplate template;
	
	public List<MemberVO> selectMemberAll(){
		return template.selectList("memberList");
	}
	
	public MemberVO selectMember(String userid) {
		return template.selectOne("memberById", userid);
	}
	
	public MemberVO selectMemberByemail(String userid) {
		return template.selectOne("memberByEmail", userid);
	}

	public int insertMember(MemberVO vo) {
		System.out.println("dao 진행 : "+vo.getMembertype());
		return template.insert("join", vo);
	}

	public Integer updateMember(MemberVO vo) {
		return template.update("updateMember", vo);
	}


	public Integer deleteMember(String userid) {
		System.out.println("삭제 (dao)");
		return template.delete("deleteMember", userid);
	}

	public int setNewPw(Map<String, String> map) {
		System.out.println("비밀번호 변경");
		return template.update("setNewPw", map);
	}

	public int getAllMyrownum(Map<String, String> map) {
		if (map.containsKey("userid") && map.containsValue("storereview")) return template.selectOne("getMyReviewnum", map);
		else if (map.containsKey("userid")) return template.selectOne("getAllMyrownum", map);
		else  return template.selectOne("getAllMyStoreReviewnum", map);
	}
	
	public int insertStoreComember(String userid) {
		return template.update("insertStoreComember", userid);
	}
	
}
