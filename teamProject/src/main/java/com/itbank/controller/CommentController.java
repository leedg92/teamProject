package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.CommentVO;
import com.itbank.dao.CommunityVO;
import com.itbank.service.Board_GetBoardService;
import com.itbank.service.Comment_DeleteService;
import com.itbank.service.Comment_GetCommentService;
import com.itbank.service.Comment_ModifyService;
import com.itbank.service.Comment_UploadService;

@Controller
public class CommentController {
	@Autowired private Comment_UploadService comment_UploadService;
	@Autowired private Comment_GetCommentService getCommentService;
	@Autowired private Board_GetBoardService getBoardService;
	@Autowired private Comment_DeleteService commentDeleteService;
	@Autowired private Comment_ModifyService commentModifyService;

	@RequestMapping(value="/comment", method = RequestMethod.POST)
	public ModelAndView commentSubmit(CommentVO cvo, int bnum) {
		
		ModelAndView mv = new ModelAndView("redirect:/board");
		CommunityVO Bvo = getBoardService.getBoard(bnum);
		List<CommentVO> commentList = getCommentService.getCommentList(bnum);

		mv.addObject("bnum", bnum);
		cvo.setBoardnum(bnum);
		mv.addObject("commentVO",comment_UploadService.commentUpload(cvo));
		mv.addObject("vo", Bvo);
		mv.addObject("cvo", cvo);
		
		mv.addObject("commentList", commentList);
		
		
		System.out.println("commentController vo : " + cvo.getBoard_num());
		System.out.println("int Boardnum : " + bnum);
		System.out.println("commentController vo : " + cvo.getC_context());
		
		

		return mv;
	}
	
	@RequestMapping(value="/comment_delete", method = RequestMethod.GET)
	public ModelAndView commentDelete(int Boardnum, int Commentnum) {
		ModelAndView mv = new ModelAndView("community/commentDeleteResult");
		mv.addObject("bnum", Boardnum);
		commentDeleteService.commentDelete(Commentnum);
		
		return mv;
	}
	
	
	@RequestMapping(value="/comment_modify", method = RequestMethod.GET)
	public ModelAndView commentModify(int Boardnum, int Commentnum) {
		ModelAndView mv = new ModelAndView("community/commentModifyForm");
		mv.addObject("bnum", Boardnum);
		CommentVO cvo = getCommentService.getComment(Commentnum);
		mv.addObject("cvo", cvo);
		
		return mv;
	}
	
	@RequestMapping(value="/comment_modify", method = RequestMethod.POST)
	public ModelAndView commentModify(CommentVO vo) {
		ModelAndView mv = new ModelAndView("community/commentModifyResult");
		commentModifyService.commentModify(vo);
		
		mv.addObject("bnum", vo.getBoard_num());
		
		return mv;
	}
	
}
