package com.itbank.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.MemberVO;
import com.itbank.dao.ReserVO;
import com.itbank.dao.StoreTotalNumVO;
import com.itbank.dao.storeBoardVO;
import com.itbank.service.ImageService;
import com.itbank.service.MemberService;
import com.itbank.service.ReserService;
import com.itbank.service.StoreReviewService;
import com.itbank.service.StoreTotalNumService;
import com.itbank.service.storeBoardService;


@Controller
public class storeController {
	@Autowired private ImageService is;
	@Autowired private storeBoardService bs;
	@Autowired private ReserService reserservice;
	@Autowired private MemberService memberservice;
	@Autowired private StoreReviewService storeReviewService;
	@Autowired private StoreTotalNumService Storetotalnumservice;

	@RequestMapping(value="storemain",method=RequestMethod.GET)
	public ModelAndView bomain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("store/store_main");
		int listSize = bs.selectAll(request).size();
		if(listSize%5!=0) mv.addObject("listSize",bs.selectAll(request).size()/5+1);
		else mv.addObject("listSize",bs.selectAll(request).size()/5);
		if(request.getParameter("page")==null)mv.addObject("page","1");
		else mv.addObject("page",request.getParameter("page"));
		mv.addObject("boardList",bs.boardList(request));
		mv.addObject("type",request.getParameter("type"));
		mv.addObject("search",request.getParameter("search"));
		mv.addObject("bestBoard",bs.selectBest("viewcount"));
		return mv;
	}
	
	@RequestMapping(value="insertStore",method=RequestMethod.GET)
	public ModelAndView board() {
		return new ModelAndView("store/store_form");
	}
	
	@RequestMapping(value="insertStore",method=RequestMethod.POST)
	public ModelAndView board(HttpServletRequest request,storeBoardVO bvo,
			MultipartHttpServletRequest mpRequest, HttpSession session) { 
		List<MultipartFile> files = mpRequest.getFiles("file");
		is.uploadBLOB(files,bs.insertbo(bvo));
		MemberVO member = (MemberVO)session.getAttribute("member");
		int a = memberservice.insertStoreComember(member.getUserid());	
		session.setAttribute("member", memberservice.getMemberById(member.getUserid()));
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/checkAddress",produces="application/text;charset=utf-8")
	@ResponseBody
	public String checkAddress(HttpServletRequest request) throws Exception{ 
		return bs.checkAddress(request.getParameter("address"));
	}

	@RequestMapping(value="/add_adress",produces="application/text;charset=utf-8")
	@ResponseBody
	public String ajax(HttpServletRequest request)throws Exception{ 
		return request.getParameter("test1");
	}
	
	@RequestMapping("store_viewBlob")
	public void viewBlob(@RequestParam int key, HttpServletResponse response) throws IOException {
		
		InputStream iss = null;						
		ServletOutputStream os = null;				
		byte[] bytes;								
		
		String contentType="image/jpeg";			
		response.setContentType(contentType);
		
		bytes = is.selectBlob(key,1);						
		iss = new ByteArrayInputStream(bytes);		
		os = response.getOutputStream();			
		int binaryRead;								
		while((binaryRead=iss.read())!=-1) {			
			os.write(binaryRead);					
		}
	}
	

	
	@RequestMapping("/myStoreReservation")							
	public String calendar() {
		return "myPage/myStoreReservation";
	}
	
	@RequestMapping(value="/myStoreReservation", method = RequestMethod.POST)
	public ModelAndView calendar(HttpServletRequest request, HttpSession session) {				
		ModelAndView mv = new ModelAndView("myPage/myStoreReservation");
		storeBoardVO mystore = (storeBoardVO)session.getAttribute("myStore");
		
		String resdate = request.getParameter("resdate");
		List<ReserVO> list = null;
		
		try {
			list = reserservice.getReserListByDate(mystore.getKey(), resdate);
		}catch(NullPointerException e) {list=null;}
		mv.addObject("resDate", resdate);
		mv.addObject("reservationList", list);
		
		return mv;
	}
	
	@RequestMapping(value = "/mystoreModify", method = RequestMethod.POST)
	public ModelAndView mystoreModify(storeBoardVO newStoreData, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("redirect:/myPage");
		MemberVO member = (MemberVO)session.getAttribute("member");
		newStoreData.setWriter(member.getUserid());
		
		bs.storeModify(newStoreData);
		
		return mv;
	}

	@RequestMapping(value="myStoreImage")
	public void myStoreImage (String key, String num, HttpServletResponse response) throws IOException {
			
			try {
				 		
				
				InputStream ist = null;				
				ServletOutputStream os = null;		
				
				String contentType="image/jpeg";	
				response.setContentType(contentType);
				byte[] bytes = is.selectBlob(Integer.parseInt(key), Integer.parseInt(num));   
				ist = new ByteArrayInputStream(bytes);		
			
				os = response.getOutputStream();			
				
				int binaryRead;						
				while((binaryRead = ist.read()) != -1) {	
					os.write(binaryRead);				
				}
			}catch(NullPointerException e) {

			}
	}
}
