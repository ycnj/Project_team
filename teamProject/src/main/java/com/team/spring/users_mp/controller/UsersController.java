package com.team.spring.users_mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.users_mp.dto.UsersDto;
import com.team.spring.users_mp.service.UsersService;






@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "users/signup_form";
	}
	//회원 가입 요청 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(ModelAndView mView, @ModelAttribute UsersDto dto) {
		//@ModelAttribute 라는 어노테이션을 UsersDto 앞에 붙여 놓으면
		//폼전송되는 파라미터가 추출되어서 UsersDto 객체에 담겨서 전달된다.
		//ModelAndView 객체가 필요하면 메소드에 받을 준비를 해놓으면 전달된다.
		service.addUser(mView, dto);
		mView.setViewName("users/greeting");
		return mView;
	}
	//로그인 폼 요청 처리 
	@RequestMapping("/users/loginform")
	public String loginform() {
		
		return "users/loginform";
	}
	//로그인 요청 처리
	@RequestMapping("/users/login")
	public ModelAndView login(HttpSession session, ModelAndView mView, @ModelAttribute UsersDto dto) {
		//UsersService 를 통해서 로그인 관련 처리를 하고
		service.validUser(session, mView, dto);
		//view 페이지 정보를 담고 
		mView.setViewName("users/login");
		//ModelAndView 객체를 리턴해 준다. 
		return mView;
	}
	//로그아웃 요청 처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		//로그 아웃 처리를 하고 
		session.invalidate();
		//home.do 로 리다일렉트 이동 시킨다.
		return "redirect:/home.do";
	}
	//아이디 중복 확인 ajax 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);
		//출력 되는 JSON 문자열은
		//{"canUse":true} 또는 {"canUse":false} 이다.
		return map;
	}
	//개인 정보 보기 요청 처리
	@RequestMapping("/users/info")
	public ModelAndView authInfo(ModelAndView mView, HttpServletRequest request) {
		
		service.showInfo(request.getSession(), mView);
		//view 페이지 정보를 담아서 
		mView.setViewName("users/info");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	//개인정보 수정 폼 요청처리
	@RequestMapping("/users/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request, ModelAndView mView) {
		service.showInfo(request.getSession(), mView);
		mView.setViewName("users/updateform");
		return mView;
	}
	//개인정보 수정 요청처리
	@RequestMapping("/users/update")
	public ModelAndView authUpdate(@ModelAttribute UsersDto dto, HttpServletRequest request) {
		//UsersService 객체를 이용해서 수정반영
		service.updateUser(dto);
		// new ModelAndView("view 페이지 정보")
		return new ModelAndView("redirect:/users/info.do");
	}
	@RequestMapping("/users/delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		service.deleteUser(request.getSession());
		return new ModelAndView("users/delete");
	}
	
	@RequestMapping("/users/list")
	public ModelAndView getList() {
		ModelAndView mView=new ModelAndView();
		service.getUsersList(mView);
		mView.setViewName("users/list");
		return mView;
	}
}