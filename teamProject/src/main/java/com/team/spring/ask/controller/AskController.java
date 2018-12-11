package com.team.spring.ask.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.ask.dto.AskDto;
import com.team.spring.ask.service.AskService;

@Controller
public class AskController {
	@Autowired
	private AskService service;
	
	@RequestMapping("/ask/list")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("ask/list");
	}
	@RequestMapping("/ask/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		//view 페이지로 forward 이동해서 새글 작성 폼 출력하기 
		return new ModelAndView("ask/insertform");
	}
	@RequestMapping("/ask/insert")
	public ModelAndView authInsert(@ModelAttribute AskDto dto,HttpServletRequest request) {
		//CafeDto 객체에 작성자의 아이디를 담아서 
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		//새글을 저장한다. 
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/ask/list.do");
	}
	@RequestMapping("/ask/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("ask/detail");
	}
	
	@RequestMapping("/ask/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num);
		return new ModelAndView("redirect:/ask/list.do");
	}
	@RequestMapping("/ask/updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("ask/updateform");
		return mView;
	}
	@RequestMapping("/ask/update")
	public ModelAndView authUpdate(@ModelAttribute AskDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/ask/detail.do?num="+dto.getNum());
	}

}




































































































