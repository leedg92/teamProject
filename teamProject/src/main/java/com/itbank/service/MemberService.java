package com.itbank.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itbank.dao.CommunityDAO;
import com.itbank.dao.CommunityVO;
import com.itbank.dao.MemberDAO;
import com.itbank.dao.MemberVO;
import com.itbank.dao.ReserDAO;
import com.itbank.dao.StoreReviewDAO;
import com.itbank.exception.DuplicateEmailException;
import com.itbank.exception.DuplicateIdException;
import com.itbank.exception.idNotMatchRullException;
import com.itbank.exception.memberNotFoundException;
import com.itbank.exception.passwordNotMatchException;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	@Autowired private BCryptPasswordEncoder passwordencoder;
	@Autowired private CommunityDAO comudao;
	@Autowired private StoreReviewDAO storereviewdao;
	@Autowired private ReserDAO reserdao;
	
	public List<MemberVO> getMemberList(){		
		return dao.selectMemberAll();
	}
	
	public MemberVO getMemberById(String userid) {	
		return dao.selectMember(userid);
	}
	public MemberVO getMemberByEmail(String email) {	
		return dao.selectMemberByemail(email);
	}
	
	private boolean isIdMatch(String id) {
		String[] str = {"<", " ", "\\", "/"};
		for (int i=0; i<str.length;i++) {
			if (id.contains(str[i])) return false;
		}
		return true;
	}

	public int joinMember(MemberVO vo, String confirmpw) {	
		
		if (getMemberById(vo.getUserid())!=null) throw new DuplicateIdException();	
		if (getMemberByEmail(vo.getEmail())!=null) throw new DuplicateEmailException(); 	
		
		if (!vo.getUserpw().equals(confirmpw))	throw new passwordNotMatchException();								
		
		if( isIdMatch(vo.getUserid())==false) throw new idNotMatchRullException();			
		
		String userpw = passwordencoder.encode(vo.getUserpw());				

		
		MemberVO newmember = new MemberVO();
		newmember.setUserid(vo.getUserid());
		newmember.setUserpw(userpw);
		newmember.setUsername(vo.getUsername());
		newmember.setGender(vo.getGender());
		newmember.setPhone(vo.getPhone());
		newmember.setEmail(vo.getEmail());
		newmember.setMembertype(vo.getMembertype());
		
		return dao.insertMember(newmember); 
	}

	public MemberVO modifyMember(MemberVO vo) {			

		Integer row = dao.updateMember(vo);
		return getMemberById(vo.getUserid());
	}

	
	public Integer deleteMember(String userid) {	
		return dao.deleteMember(userid);
	}

	public MemberVO login(Map<String, String> map) {		
		 MemberVO vo = getMemberById(map.get("userid"));
		 if (vo==null) throw new memberNotFoundException();
		 else {
			 if (passwordencoder.matches(map.get("inputpass"), vo.getUserpw())) return vo;
			 else throw new passwordNotMatchException();
		 }
	}
	
	public String findId(String email, String username) {
		MemberVO vo = getMemberByEmail(email);
		if (vo==null) throw new memberNotFoundException();
		if (username.equals(vo.getUsername())) return vo.getUserid();
		else throw new memberNotFoundException();
	}

	public boolean isPasswordCollect(String inputpass, String userpw) {
		return passwordencoder.matches(inputpass, userpw);
		
	}
			
	public void setNewPW(Map<String, String> map) {						
		MemberVO vo = getMemberById(map.get("userid"));
		if (vo==null) throw new memberNotFoundException();			
		if (!map.get("inputpass").equals(map.get("confirmpass"))) throw new passwordNotMatchException();	
		
		String userpw = passwordencoder.encode(map.get("inputpass"));		
		map.replace("inputpass", userpw);
		
		int row = dao.setNewPw(map);
	}

	public List<CommunityVO> getMyList(String userid, String page, String type) {		
		List<CommunityVO> list = null;
		if (page==null) page ="1";
		
		if (type.equals("community")) list = comudao.getMyComuList(userid);
		else if (type.equals("storereview")) list = storereviewdao.getMyReviewList(userid);			
		else if (type.equals("reservation")) list = reserdao.getMyreserList(userid);

		int start = (Integer.parseInt(page)-1)*5;
		int end=0;
		if (list.size() >= start+4) end = start+4;
		else end = list.size();

		list = list.subList(start, end);
		
		return list;
	}

	public int getAllMyrownum(Map<String, String> map) {		
		try {
			return dao.getAllMyrownum(map);
		}catch(NullPointerException e) {
			return 0;
		}
	}
	
	public int insertStoreComember(String userid) {
		return dao.insertStoreComember(userid);
	}
	
	
}
