package com.itbank.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.dao.CommentVO;
import com.itbank.dao.CommunityVO;
import com.itbank.dao.Community_isLikeVO;
import com.itbank.dao.MemberVO;
import com.itbank.service.Board_CountLikeService;
import com.itbank.service.Board_DeleteService;
import com.itbank.service.Board_GetBoardService;
import com.itbank.service.Board_LikeCheckService;
import com.itbank.service.Board_ModifyService;
import com.itbank.service.Board_UploadService;
import com.itbank.service.Board_hitsService;
import com.itbank.service.Comment_GetCommentService;
import com.itbank.service.GetBoardNumService;

@Controller
public class CommunityController {
	@Autowired private Board_UploadService uploadService;
	@Autowired private Board_GetBoardService getBoardService;
	@Autowired private Board_DeleteService deleteService;
	@Autowired private Board_ModifyService modifyService;
	@Autowired private Comment_GetCommentService getCommentService;
	@Autowired private GetBoardNumService getBoardNumService;
	@Autowired private Board_hitsService hitsService;
	@Autowired private Board_LikeCheckService likeCheckService;
	@Autowired private Board_CountLikeService countLikeService;

	@RequestMapping(value = "/communityWriteForm", method = RequestMethod.GET)
	public ModelAndView communityWrite() {
		
		return new ModelAndView("community/communityWriteForm");
	}
	
@RequestMapping(value = "/communityWriteForm", method = RequestMethod.POST)
	public ModelAndView community(MultipartHttpServletRequest mpRequest, CommunityVO vo, String address) {
		ModelAndView mv = new ModelAndView("redirect:/board");
		MultipartFile file = mpRequest.getFile("file");
		if (file.isEmpty() == false) {
			int maxbnum = getBoardNumService.getBoardNum();
			vo.setBnum(maxbnum);
			mv.addObject("STORED_FILE_NAME", uploadService.upload(file, vo));

			mv.addObject("vo", vo);
			mv.addObject("bnum", vo.getBnum());

		}
		return mv;
	}

	
	@RequestMapping("viewBlob")
	public void viewBlob(String filename, HttpServletResponse response) throws IOException {
		CommunityVO vo = getBoardService.getImageBLOB(filename);

		InputStream is = null; 
		ServletOutputStream os = null; 
		byte[] bytes; 

		String contentType = "image/jpeg"; 
		response.setContentType(contentType);
		bytes = vo.getFILEDATA(); 
		is = new ByteArrayInputStream(bytes); 
		os = response.getOutputStream(); 

		int binaryRead; 

		while ((binaryRead = is.read()) != -1) { 
			os.write(binaryRead);
		}
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public ModelAndView showBoard(int bnum, Community_isLikeVO lvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("community/board");
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		hitsService.hits(bnum);
		CommunityVO vo = getBoardService.getBoard(bnum);
		int countLike = countLikeService.countLike(bnum);
		vo.setBelike(countLike);

		lvo.setUserid(mvo.getUserid());
		int isLike = likeCheckService.likeCheck(lvo);


		List<CommentVO> commentList = getCommentService.getCommentList(bnum);

		mv.addObject("commentList", commentList);
		mv.addObject("vo",vo);
		mv.addObject("isLike", isLike);
		return mv;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(int bnum) {
		deleteService.deleteBoard(bnum);
		
		return new ModelAndView("community/communityDeleteResult");
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modify(int bnum) {
		ModelAndView mv = new ModelAndView("community/communityModifyForm");
		CommunityVO vo = getBoardService.getBoard(bnum);
		mv.addObject("vo",vo);
		
		return mv;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(CommunityVO vo) {
		modifyService.modifyBoard(vo);
		
		return new ModelAndView("community/communityModifyResult");
	}
	
	@RequestMapping("/likeCheck")
	@ResponseBody
	public String like(String bnum, Community_isLikeVO lvo) {
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper jsonMapper = new ObjectMapper();	
		String jsonString = null;
		lvo.setBnum(Integer.parseInt(bnum));
	
		int like = likeCheckService.likeCheck(lvo);

		try {
		if(like == 0) {
			likeCheckService.like(lvo);
			String countLike = Integer.toString(countLikeService.countLike(lvo.getBnum()));

			map.put("likeCheck", "1");
			map.put("countLike", countLike);
			jsonString = jsonMapper.writeValueAsString(map);
		
		}else {
			int likeNum = likeCheckService.getLikeNum(lvo);
			likeCheckService.dislike(likeNum);
			String countLike = Integer.toString(countLikeService.countLike(lvo.getBnum()));

			map.put("likeCheck", "0");
			map.put("countLike", countLike);

			jsonString = jsonMapper.writeValueAsString(map);
			
		}
		}catch (JsonProcessingException e) {
			System.out.println("JSON error!!");

		}
		return map.size() != 0 ? jsonString : null;
	}
}
