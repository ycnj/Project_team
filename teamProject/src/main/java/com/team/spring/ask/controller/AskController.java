package com.team.spring.ask.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.ask.dto.AskCommentDto;
import com.team.spring.ask.dto.AskDto;
import com.team.spring.ask.service.AskService;

@Controller
public class AskController {
	@Autowired
	private AskService service;
	
	@RequestMapping("/ask/contact_home")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("ask/contact_home");
	}
	
	@RequestMapping("/ask/qnalist")
	public ModelAndView getListQNA(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("ask/qnalist");
	}
	
	@RequestMapping("/ask/qnalistview")
	public ModelAndView getListQNAVIEW(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("ask/qnalistview");
	}	
	
	@RequestMapping("/ask/detailview")
	public ModelAndView getListdetail(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("ask/detailview");
	}		
	
	@RequestMapping("/ask/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		//view 페이지로 forward 이동해서 새글 작성 폼 출력하기 
		return new ModelAndView("ask/insertform");
	}
	
	@RequestMapping("/ask/insertformview")
	public ModelAndView authinsertformview(HttpServletRequest request) {
		service.getList(request);
		return new ModelAndView("ask/insertformview");
	}	
	
	@RequestMapping("/ask/insert")
	public ModelAndView authInsert(@ModelAttribute AskDto dto,HttpServletRequest request) {
		//askDto 객체에 작성자의 아이디를 담아서 
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		//새글을 저장한다. 
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/ask/qnalistview.do");
	}
	
	
	@RequestMapping("/ask/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("ask/detailview");
	}
	
	@RequestMapping("/ask/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num);
		return new ModelAndView("redirect:/ask/qnalistview.do");
	}
	@RequestMapping("/ask/updateformview")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("ask/updateformview");
		return mView;
	}
	@RequestMapping("/ask/update")
	public ModelAndView authUpdate(@ModelAttribute AskDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/ask/detail.do?num="+dto.getNum());
	}
	@RequestMapping("/ask/comment_delete")
	@ResponseBody
	public Map<String, Object> CommentDelete(@RequestParam int num, HttpServletRequest request) {
		// num 은 삭제할 댓글의 글번호 이다.
		service.deleteComment(num);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	//댓글 추가 요청처리
	@RequestMapping("/ask/comment_insert")
	public ModelAndView CommentInsert(@RequestParam int ref_group, HttpServletRequest request) {
		//서비스를 이용해서 새 댓글을 저장하고 
		service.saveComment(request);
		//ref_group 은 원글의 글번호 이다. (댓글의 그룹번호)
		return new ModelAndView("redirect:/ask/detail.do?num="+ref_group);
	}
	//댓글 수정 요청 처리
	@RequestMapping("/ask/comment_update")
	@ResponseBody
	public Map<String, Object> CommentUpdate(@ModelAttribute AskCommentDto dto,
			HttpServletRequest request){
		//서비스를 통해서 댓글을 업데이트 하는 작업을 하고
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}

}




































































































