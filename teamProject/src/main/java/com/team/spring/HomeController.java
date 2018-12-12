package com.team.spring;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request) {
		//오늘의 공지 사항
		List<String> noticeList=new ArrayList<>();
		noticeList.add("곧 겨울 입니다.");
		noticeList.add("수료가 얼마 남지 않았군요~");
		noticeList.add("어쩌구...");
		noticeList.add("저쩌구...");
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("noticeList", noticeList);
		mView.setViewName("home");
		request.getSession().setAttribute("id", "1");
		return mView;
	}
	
}

