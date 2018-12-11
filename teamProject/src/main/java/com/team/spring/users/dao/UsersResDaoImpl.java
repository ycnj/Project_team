package com.team.spring.users.dao;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.users.dto.UsersResDto;

@Repository
public class UsersResDaoImpl implements UsersResDao{
	//의존객체를 주입 받기 위해 
	@Autowired
	private SqlSession session;

	@Override
	public UsersResDto getData(String id) {		
		return session.selectOne("usersRes.getData", id);
	}

	@Override
	public void insert(UsersResDto dto) {
		session.insert("usersRes.insert", dto);		
	}

	@Override
	public int getSumPrice(String id) {
		return session.insert("usersRes.getSumPrice", id);		
	}

	@Override
	public void cancelRes(UsersResDto dto) {
		session.insert("usersRes.cancelRes", dto);		
	}
	
}











