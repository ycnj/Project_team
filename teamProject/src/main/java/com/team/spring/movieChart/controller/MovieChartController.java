package com.team.spring.movieChart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movieChart.dto.MovieChartDto;
import com.team.spring.movieChart.service.MovieChartService;

@Controller
public class MovieChartController {
	@Autowired
	private MovieChartService service;
	
	@RequestMapping("/movie/listChart")
	public String getList(HttpServletRequest request) {
		service.getList(request);
		// view 페이지로 forward 이동해서 파일 목록 출력하기 
		return "movie/listChart";
	}
	
	@RequestMapping("/movie/delete")
	public ModelAndView authDelete(@RequestParam int num, 
			HttpServletRequest request, HttpServletResponse response) {
		service.removeFileInfo(num, request, response);
		return new ModelAndView("redirect:/movie/listChart.do");
	}
	@RequestMapping("/movie/uploadChart_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("movie/host/uploadChart_form");
	}
	//파일 업로드 요청 처리 
	@RequestMapping("/movie/uploadChart")
	public ModelAndView authUpload(@ModelAttribute MovieChartDto dto, 
			HttpServletRequest request) {
		service.saveFile(dto, request);
		//파일 목록보기로 리다일렉트 시킨다. 
		return new ModelAndView("redirect:/movie/listChart.do");
	}
	//파일 업로드 요청 처리 
	@RequestMapping("/movie/liketo")
	@ResponseBody
	public Map<String, Object> authLiketo(HttpServletRequest request) {
		return service.liketo(request);
	}	
}


