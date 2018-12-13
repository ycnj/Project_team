package com.team.spring;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public ModelAndView home() {
		//오늘의 공지 사항
		List<String> noticeList=new ArrayList<>();
		noticeList.add("문의페이지 입니다.");
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("noticeList", noticeList);
		mView.setViewName("home");
		return mView;
	}
	
}

