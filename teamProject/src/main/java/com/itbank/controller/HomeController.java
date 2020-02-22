package com.itbank.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.CommunityVO;
import com.itbank.dao.ImageVO;
import com.itbank.dao.storeBoardVO;
import com.itbank.service.Board_GetBoardService;
import com.itbank.service.Comment_UploadService;
import com.itbank.service.GetBoardNumService;
import com.itbank.service.ImageService;
import com.itbank.service.storeBoardService;

@Controller
public class HomeController {

	@Autowired private Board_GetBoardService getBoardService;
	@Autowired private GetBoardNumService getBoardNumService;
	@Autowired private storeBoardService sbs;
	@Autowired private ImageService imgService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView map(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("addr",req.getRemoteAddr());
		if (session.getAttribute("admin")!=null) mv.setViewName("admin/adminPage");				//관리자면 메인이 관리자페이지
		return mv;
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
		public ModelAndView map(String x, String y) {
			ModelAndView mv = new ModelAndView("map2");
			mv.addObject("x", x);
			mv.addObject("y", y);

			List<storeBoardVO> storelist = sbs.getPlace(x, y);
			for(int i=0; i<storelist.size(); i++) {
				System.out.println(storelist.get(i).getStorename());
			}		
			mv.addObject("storelist", storelist);
			return mv;
		}
	
	@RequestMapping("viewB")
	public void viewB(@RequestParam("key") String key, HttpServletResponse response) throws IOException {
		ImageVO vo = imgService.getImageBlob(key); 				//DB에서 BLOB을 가져와서
	
		InputStream is = null;									//입력스트림
		ServletOutputStream os = null;							// 서블릿 출력스트림
		byte[] bytes;											//바이트 배열
		String contentType = "image/jpeg";						//response의 형식
		response.setContentType(contentType);	
		bytes = vo.getFILEDATA();								//BLOB을 byte 배열에 담는다.
		is = new ByteArrayInputStream(bytes);					// 그 byte 배열을 읽어드릴 InputStream 준비
		os = response.getOutputStream();						// 읽어서 서블릿 출력으로 전달할 준비
		int binaryRead;											// 바이트값 하나
		while((binaryRead = is.read())!= -1) {					// end of file이 아닐때 까지 (파일끝까지)
			os.write(binaryRead);								//하나씩 읽어서 바이너리를 서블릿에 기록한다(응답 만들기)
		}		
	}


@RequestMapping(value = "/community", method = RequestMethod.GET)
	public ModelAndView community(HttpServletRequest request, @RequestParam(defaultValue = "1") int page) {
		
		int row = 0;
		row = getBoardNumService.getBoardCount();
		
		int allCount = row;
		int perPage = 5;
		int pageCount = allCount / perPage + ((allCount % perPage == 0) ? 0 : 1);
		int start = (page - 1) * perPage + 1;
		int end = (page == pageCount) ? allCount : start + perPage - 1; 

		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/community");

		int[] pageList = new int[pageCount];
		for(int i = 1; i <= pageList.length; i++) {
			pageList[i-1] = i;
		}
		
		List<CommunityVO> list = getBoardService.getBoardList(start, end);
		mv.addObject("pageCount", pageList);
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping("delll")
	public String gd(@RequestParam int key) {
		sbs.storeDel(key);
		return "home";
	}
}
