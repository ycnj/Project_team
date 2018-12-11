package com.team.spring.users_mp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.spring.users_mp.dao.UsersDao;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDao usersdao;

}
