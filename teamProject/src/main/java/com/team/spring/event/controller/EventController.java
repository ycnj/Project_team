package com.team.spring.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.event.dto.EventDto;
import com.team.spring.event.dto.EventImageDto;
import com.team.spring.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService service;
	
	@RequestMapping("/event/list")
	public ModelAndView getList(HttpServletRequest request) {
		service.getList(request);
		return new ModelAndView("event/list");
	}
	@RequestMapping("/event/uploadform")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		return new ModelAndView("event/uploadform");
	}
	@RequestMapping("/event/upload")
	public ModelAndView authUpload(@ModelAttribute EventDto dto,
			HttpServletRequest request) {
		service.saveContent(dto, request);
		return new ModelAndView("redirect:/event/list.do");
	}
	@RequestMapping("/event/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);		
		return new ModelAndView("event/detail");
	}
	
	@RequestMapping("/event/delete")
	public ModelAndView authDelete(@RequestParam int num, 
			HttpServletRequest request, HttpServletResponse response) {
		service.deleteContent(num, request, response);
		return new ModelAndView("redirect:/event/list.do");
	}
	@RequestMapping("/event/updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getDetail(request);
		mView.setViewName("event/updateform");
		return mView;
	}
	@RequestMapping("/event/update")
	public ModelAndView authUpdate(@ModelAttribute EventDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto, request); //수정
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/event/detail.do?num="+dto.getNum());
	}
	@RequestMapping("event/imageUploadform")
	@ResponseBody
	public ModelAndView authImageUploadform(@ModelAttribute EventDto dto, HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("event/imageUploadform");
	}
	@RequestMapping("/event/ImageUpload")
	public ModelAndView authImageUpload(@ModelAttribute EventImageDto dto,
			HttpServletRequest request) {		
		service.saveImage(dto, request);
		return new ModelAndView("redirect:/event/detail.do?num="+dto.getRef_group());
	}
}
