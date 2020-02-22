package com.itbank.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.StoreReviewVO;
import com.itbank.dao.StoreTotalNumVO;
import com.itbank.service.StoreReviewService;
import com.itbank.service.StoreTotalNumService;
import com.itbank.service.storeBoardService;

@Controller
public class storePageController {
	
	@Autowired
	storeBoardService StoreboardService;
	@Autowired
	private StoreReviewService StorereviewService;
	@Autowired
	StoreTotalNumService Storetotalnumservice;

	@RequestMapping("storeview")
	public ModelAndView storeView(@RequestParam int key) {
		ModelAndView mv = new ModelAndView("store/store_view");
		double avg = StorereviewService.getavg(key);
		double avg2 = Double.parseDouble(String.format("%.2f", avg));
		mv.addObject("avg", avg2);
		mv.addObject("board",StoreboardService.selectStore(key));
		mv.addObject("add",999999);
		StoreboardService.viewcount(key);
		List<StoreReviewVO> list = StorereviewService.getFileList(key);
		mv.addObject("list", list);
		
		List<StoreTotalNumVO> totalnum = Storetotalnumservice.getTotalList();
		if (totalnum.size() != 0) {
			mv.addObject("Storetotalnum", totalnum);
			int max = Storetotalnumservice.getmaxnum(key);
			
			mv.addObject("max", max);
		}
		
		
		
		return mv;
	}

	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public ModelAndView review(MultipartHttpServletRequest mpRequest, @RequestParam String userid, StoreReviewVO rvo,@RequestParam int key) throws Exception {

		ModelAndView mv = new ModelAndView("storePage/review2");

		StorereviewService.upload(mpRequest,userid, rvo,key);
		mv.addObject("key", rvo.getKey());
		return mv;

	}
	
	@RequestMapping(value = "/total", method = RequestMethod.POST)
	public ModelAndView totalnumadd(String userid, @RequestParam int key) {
		ModelAndView mv = new ModelAndView("redirect:/storeview?key="+key);
		
		int add = Storetotalnumservice.add(userid,key);
		mv.addObject("add", add); 
		return mv;
	}


	@RequestMapping("number") // 페이지에서 움직이지 않고 함수만 실행함(이동 x)
	@ResponseBody
	public int number(@RequestParam String userid,@RequestParam int key) {
		List<StoreTotalNumVO> list = Storetotalnumservice.getTotalList();
		if (list.size() >= 0) {
			Storetotalnumservice.minnum(key);
			Storetotalnumservice.delete();
		}
		
		return Storetotalnumservice.getmynum(userid);

	}
	
	@RequestMapping("getmynum") // ?럹?씠吏??뿉?꽌 ??吏곸씠吏? ?븡怨? ?븿?닔留? ?떎?뻾?븿(?씠?룞 x)
	@ResponseBody
	public int getMyNum(@RequestParam String userid, @RequestParam int key) {
		return Storetotalnumservice.getmynum(userid,key);

	}
	
	@RequestMapping("getMaxNum")
	@ResponseBody
	public int gmn(@RequestParam int key) {
		return Storetotalnumservice.getmaxnum(key);
	}

}
