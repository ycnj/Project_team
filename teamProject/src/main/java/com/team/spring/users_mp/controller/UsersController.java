package com.team.spring.users_mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "users/signup_form";
	}
}
