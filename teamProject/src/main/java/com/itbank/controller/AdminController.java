package com.itbank.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.MemberVO;
import com.itbank.dao.storeBoardVO;
import com.itbank.service.Board_DeleteService;
import com.itbank.service.Board_GetBoardService;
import com.itbank.service.MemberService;
import com.itbank.service.storeBoardService;



@Controller
public class AdminController {

	@Autowired MemberService memberService;
	@Autowired Board_GetBoardService boardService;
	@Autowired storeBoardService storeboardservice;
	@Autowired Board_DeleteService boardDeledteservice;
	// 회원 리스트
		@RequestMapping("adminUserList")
			public ModelAndView UserList() {
				System.out.println("회원리스트");
				ModelAndView mv = new ModelAndView("admin/userList");
				mv.addObject("memberlist", memberService.getMemberList());
			
			return mv;
		}
//		// 회원 탈퇴
		@RequestMapping(value = "adminUserDrop", method = RequestMethod.GET)
		public ModelAndView UserDrop() {
			return new ModelAndView("admin/userDrop");
		}
		
		@RequestMapping("adminUserDrop")
        public ModelAndView UserDrop(MemberVO vo) {
           ModelAndView mv = new ModelAndView("admin/userDrop");
           MemberVO deluser = memberService.getMemberById(vo.getUserid());
           if(deluser.getMembertype().equals("comember")&&deluser.getStore().equals('o')) {                  //사업자 회원이라면 가게 정보도 삭제
              storeBoardVO store = storeboardservice.getMyStore(deluser.getUserid());
              storeboardservice.storeDel(store.getKey());
           }
           int row = memberService.deleteMember(deluser.getUserid());         
           
           return mv;
        }
		
//		// 리뷰 리스트 및 삭제
		@RequestMapping("adminReviewList")
		public ModelAndView ReviewList() {
			ModelAndView mv = new ModelAndView("admin/reviewList");
			mv.addObject("review", boardService.getBoardList());
			return mv;
		}
	
		@RequestMapping(value = "admindeltest", produces = "application/text;charset=utf8")
		@ResponseBody
		public ModelAndView delete(@RequestParam String testval) {

			ModelAndView mv = new ModelAndView("reviewList");
			int row = boardDeledteservice.deleteBoard(Integer.parseInt(testval));
			
			return mv;
			
			
		}

	
}
