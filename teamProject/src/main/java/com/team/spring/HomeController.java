package com.team.spring;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
	
	@RequestMapping("home")
	public ModelAndView home() {	


		ModelAndView mView=new ModelAndView();
			mView.setViewName("home");	
			
		
		return mView;
	}

	
}

