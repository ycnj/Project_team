package com.team.spring.faq.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.faq.dto.FaqDto;
import com.team.spring.faq.service.FaqService;


@Controller
public class FaqController {
	@Autowired
	private FaqService service;
	
	@RequestMapping("/faq/faqlistview")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("faq/faqlistview");
	}
	
	@RequestMapping("/faq/faqlist")
	public ModelAndView getListQNA(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("faq/faqlist");
	}
		
	@RequestMapping("/faq/detailview")
	public ModelAndView getListdetail(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("faq/detailview");
	}		
	
	@RequestMapping("/faq/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		//view 페이지로 forward 이동해서 새글 작성 폼 출력하기 
		return new ModelAndView("faq/insertform");
	}
	
	@RequestMapping("/faq/insertformview")
	public ModelAndView authinsertformview(HttpServletRequest request) {
		service.getList(request);
		return new ModelAndView("faq/insertformview");
	}	
	
	@RequestMapping("/faq/insert")
	public ModelAndView authInsert(@ModelAttribute FaqDto dto,HttpServletRequest request) {
		//faqDto 객체에 작성자의 아이디를 담아서 
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		//새글을 저장한다. 
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/faq/faqlistview.do");
	}
	
	
	@RequestMapping("/faq/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("faq/detailview");
	}
	
	@RequestMapping("/faq/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num);
		return new ModelAndView("redirect:/faq/faqlistview.do");
	}
	@RequestMapping("/faq/updateformview")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("faq/updateformview");
		return mView;
	}
	@RequestMapping("/faq/update")
	public ModelAndView authUpdate(@ModelAttribute FaqDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/faq/detail.do?num="+dto.getNum());
	}
}




































































































