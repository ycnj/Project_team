package com.team.spring.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.movie.dto.MovieDto;
import com.team.spring.movie.dto.MovieSercDto;
import com.team.spring.movie.service.MovieSercService;

@Controller
public class MovieController {

	@Autowired
	private MovieSercService service;
	
	@RequestMapping("/movie/findmovie")
	@ResponseBody
	public ModelAndView findMovie(ModelAndView mView, @ModelAttribute MovieSercDto dto) {
	
		service.Mserc(mView, dto);
		mView.setViewName("movie/findmovie");	
			
		
		return mView;
	} 
}
