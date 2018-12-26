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
		service.validUser(session, mView, dto);
		mView.setViewName("users/login");
		return mView;
	}
	//로그아웃 요청 처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	//아이디 중복 확인 ajax 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);

		return map;
	}
	//개인 정보 보기 요청 처리
	@RequestMapping("/users/info")
	public ModelAndView authInfo(ModelAndView mView, HttpServletRequest request) {
		
		service.showInfo(request.getSession(), mView);
		mView.setViewName("users/info");
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
		System.out.println("dto:"+dto.getAddr2()+"id:"+dto.getId()+dto.getPhon()+dto.getEmail()+"주"+dto.getAddr3());
		service.updateUser(dto);
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
	
	//비밀번호 수정폼 요청처리
	@RequestMapping("/users/pwd_updateform.do")
	public ModelAndView authPwdForm(HttpServletRequest request) {
		return new ModelAndView("users/pwd_updateform");
	}
	//비밀번호 수정반영 요청처리
	@RequestMapping("/users/update_pwd")
	public ModelAndView authUpdatePwd(HttpServletRequest request) {
		service.updatePwd(request);
		return new ModelAndView("users/update_pwd");
	}	
}