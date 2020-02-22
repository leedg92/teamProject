
package com.itbank.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.CommunityVO;
import com.itbank.dao.MemberVO;
import com.itbank.dao.storeBoardVO;
import com.itbank.exception.DuplicateEmailException;
import com.itbank.exception.DuplicateIdException;
import com.itbank.exception.idNotMatchRullException;
import com.itbank.exception.memberNotFoundException;
import com.itbank.exception.passwordNotMatchException;
import com.itbank.service.ImageService;
import com.itbank.service.MemberService;
import com.itbank.service.StoreReviewService;
import com.itbank.service.StoreTotalNumService;
import com.itbank.service.mailSendService;
import com.itbank.service.storeBoardService;

@Controller
public class MemberController {

	@Autowired MemberService memberService;
	@Autowired storeBoardService storeboardservice;
	@Autowired mailSendService mailservice;
	@Autowired ImageService imageservice;
	@Autowired StoreReviewService storereviewservice;
	@Autowired StoreTotalNumService storetotalnumservice;

	@RequestMapping("memberList")			
	public ModelAndView memberList() {
		ModelAndView mv = new ModelAndView("memberList");
		mv.addObject("memberList", memberService.getMemberList());
		return mv;
	}
	
	@RequestMapping("memberInfo")
	public ModelAndView memberInfo(String userid) {
		ModelAndView mv = new ModelAndView("memberInfo");
		
		if (userid != null)
			mv.addObject("memberInfo", memberService.getMemberById(userid));
		
		return mv;
	}

	
	@RequestMapping(value="/memberJoin", method=RequestMethod.GET)		
	public ModelAndView memberJoin() {
		return new ModelAndView("memberJoin/memberJoin1");
	}
	
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.POST)	
	public ModelAndView memberJoin(String membertype) {
		
		ModelAndView mv = new ModelAndView("memberJoin/memberJoin2");
		System.out.println(membertype);
		mv.addObject("membertype", membertype);
		return mv;
	}
	
	@RequestMapping(value="/memberJoin2", method = RequestMethod.POST)
	public ModelAndView memberJoin2(MemberVO vo, String confirmpw) {		
		ModelAndView mv = new ModelAndView("memberJoin/memberJoin2");
		mv.addObject("membertype", vo.getMembertype());
		int row=0;

		try {
			row = memberService.joinMember(vo, confirmpw);			
			mv.setViewName("redirect:/login");
			mv.addObject("row", row);
		}catch(DuplicateIdException e) {
			mv.addObject("msg", "이미 존재하는 아이디 입니다");
		}catch(passwordNotMatchException e) {
			mv.addObject("msg", "패스워드가 일치하지 않습니다.");
		}catch(idNotMatchRullException e) {
			mv.addObject("msg", "아이디에 <, /, \\, 공백을 포함하지 말아주세요!");	
		}catch(DuplicateEmailException e) {		
			mv.addObject("msg", "이미 가입된 email입니다.");
		}

		System.out.println("row : "+row);
		return mv;
	}

	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)		
	public ModelAndView memberInfo() {
		return new ModelAndView("myPage/memberInfo");
	}


	@RequestMapping(value="/memberModify", method=RequestMethod.GET)
	public ModelAndView memberModify(@RequestParam HashMap<String, String> member) {
		ModelAndView mv = new ModelAndView("myPage/memberModify");

		
		return mv;
	}
	
	@RequestMapping(value="/memberModify", method=RequestMethod.POST)			
	public ModelAndView memberModify(MemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/memberInfo");
		
		MemberVO newvo = memberService.modifyMember(vo);
		session.setAttribute("member", newvo);
		
		return mv;
	}
	
	
	@RequestMapping(value="/memberDelete", produces="application/text;charset=utf8")			
	@ResponseBody
	public String memberDelete(HttpServletRequest request, HttpSession session) {
		
		String inputpass = request.getParameter("inputpass");
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		boolean fl = memberService.isPasswordCollect(inputpass, member.getUserpw());		
		if (fl) {
			memberService.deleteMember(member.getUserid());
			if(member.getMembertype().equals("comember")) {
				storeBoardVO myStore = (storeBoardVO)session.getAttribute("myStore");
				storeboardservice.storeDel(myStore.getKey());
			}
			session.invalidate();
			return "탈퇴되었습니다";
			}
			else return "비밀번호 불일치";
	} 
	
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("login/login");
		model.addAttribute("next", request.getParameter("next"));
		String row = request.getParameter("row");
		mv.addObject("row", row);
		return mv;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)			
	public ModelAndView login(@RequestParam HashMap<String, String> map, HttpSession session, HttpServletRequest request
			, HttpServletResponse response, String rememberid, String autologin) {
		ModelAndView mv = new ModelAndView();
		
		try {
			MemberVO vo = memberService.login(map);
			String next = request.getParameter("next");

			if (next!=null) {
				mv.setViewName("redirect:/"+next);		
			}
			else mv.setViewName("redirect:/");				
			
			
			if (vo.getUserid().equals("admin")) {				
				mv.setViewName("admin/adminPage");
				session.setAttribute("manager", vo);
			}else {
				mv.addObject("memberVO", vo);
				session.setAttribute("member", vo);		
			}
			
			
			if (rememberid != null) {							
				Cookie c = new Cookie("userid", vo.getUserid());
				c.setMaxAge(60*60*12);
				response.addCookie(c);
			}else {
				Cookie [] cs = request.getCookies();
				for (int i=0; i<cs.length;i++) {
					if(cs[i].getName().equals("userid")) {
						cs[i].setMaxAge(0);
						response.addCookie(cs[i]);
					}
				}
			}
			if (autologin != null) {				//
				Cookie c = new Cookie("JSESSIONID", session.getId());
				c.setMaxAge(60*60*12);
				response.addCookie(c);
			}
	
			
		}catch(memberNotFoundException e) { 
			mv.addObject("msg", "id가 존재하지 않습니다.");
			mv.setViewName("login/login");
		}
		catch(passwordNotMatchException e) {
			mv.addObject("msg", "패스워드가 일치하지 않습니다.");
			mv.setViewName("login/login");
		}
		return mv;
	}
	
	@RequestMapping(value="myPage", method=RequestMethod.GET)		
	public ModelAndView myPage(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage/myPage");
		MemberVO member = (MemberVO)session.getAttribute("member");

		if (member.getMembertype().equals("comember")) {				
			mv.setViewName("myPage/myPage_co");
			storeBoardVO myStore = storeboardservice.getMyStore(member.getUserid());
			session.setAttribute("myStore", myStore);
			if (myStore != null) {										
				mv.addObject("blobsize",imageservice.blobAll(myStore.getKey()).size());
				mv.addObject("myStoreReviewList", storereviewservice.getMyStoreReview(myStore.getKey()));	
				mv.addObject("MyStoreReviewPageCount", pageCount("storereview", myStore.getKey()));	
			}
		}
		
		if (member.getMembertype().equals("gemember")) {		
			String comuPage = request.getParameter("comuPage");
			String reviewPage = request.getParameter("reviewPage");
			String reservationPage = request.getParameter("reservationPage");
				
			List<CommunityVO> myComulist = memberService.getMyList(member.getUserid(), comuPage, "community");		
			List<CommunityVO> myReviewlist = memberService.getMyList(member.getUserid(), reviewPage, "storereview");			
			List<CommunityVO> myReservationlist = memberService.getMyList(member.getUserid(), reservationPage, "reservation");		
			
			mv.addObject("myComulist", myComulist);
			mv.addObject("myReviewlist", myReviewlist);
			mv.addObject("myReservationlist", myReservationlist);
				
			mv.addObject("MyComuPageCount", pageCount("community", member.getUserid()));
			mv.addObject("MyReviewPageCount", pageCount("storereview", member.getUserid()));
			mv.addObject("MyReservationPageCount", pageCount("reservation", member.getUserid()));
		}
		
		return mv;
	}
	
	
	private int pageCount(String type, String userid) {					
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("userid", userid);
		int allCount = memberService.getAllMyrownum(map);
		int perPage = 5;
		if (allCount==0) return 1;
		if (allCount%perPage ==0) return allCount/perPage;
		return allCount/perPage + 1;
	}
	
	private int pageCount(String type, int key) {					
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("key", key+"");
		int allCount = memberService.getAllMyrownum(map);
		int perPage = 5;
		if (allCount==0) return 1;
		if (allCount%perPage ==0) return allCount/perPage;
		return allCount/perPage + 1;
	}
	
	
	@RequestMapping("logout")									
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)					
	public ModelAndView findId() {
		return new ModelAndView("login/findId");
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)				
	public ModelAndView findId(String username, String email) {
		ModelAndView mv = new ModelAndView("login/findId");
		try {
			String userid = memberService.findId(email, username);
			mv.addObject("userid", userid);
			mv.addObject("username", username);
		}catch(memberNotFoundException e) {
			mv.addObject("msg", "일치하는 ID가 없습니다");
		}
		return mv;
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.GET)				
	public ModelAndView findPw() {
		return new ModelAndView("login/findPw");
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.POST)				
	public ModelAndView findPw(String userid) {
		ModelAndView mv = new ModelAndView("login/findPw");
		boolean fl;
		try {
			fl = mailservice.sendNewPwMail(userid);				
			if (fl) mv.addObject("result", "true");
			else mv.addObject("msg", "해당하는 ID가 존재하지 않습니다.");
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/changePw", method=RequestMethod.POST)					
	public ModelAndView changePw(@RequestParam HashMap<String, String> map) {
		ModelAndView mv = new ModelAndView("myPage/memberInfo");
		try {
			memberService.setNewPW(map);
			mv.addObject("result", "true");
		}catch(memberNotFoundException e) {
			mv.addObject("msg", "해당하는 ID가 존재하지 않습니다.");
		}catch(passwordNotMatchException e) {
			mv.addObject("msg",  "패스워드가 일치하지 않습니다.");
		}
		return mv;
	}
	
	@RequestMapping(value="/ticketNum", produces="application/text;charset=utf8")			//ajax 
	@ResponseBody
	public String ticketNum(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		int mynum = storetotalnumservice.getmynum(userid);

		return "내 번호 : "+mynum+"";
	}


}












