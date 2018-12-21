package com.team.spring.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCount(UserDto dto) {
		
		return session.selectOne("user.getCount", dto);
	}

	@Override
	public List<UserDto> getList(UserDto dto) {
		
		return session.selectList("user.getList", dto);
	}

	@Override
	public void insert(UserDto dto) {
		
		session.insert("user.insert", dto);
	}

	@Override
	public UserDto getData(UserDto dto) {
		
		return session.selectOne("user.getData2", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("user.addViewCount", num);
	}

	@Override
	public void delete(int num) {
		session.delete("user.delete", num);
	}

	@Override
	public UserDto getData(int num) {
		
		return session.selectOne("user.getData2", num);
	}

	@Override
	public void update(UserDto dto) {
		session.update("user.update", dto);
	}
	
}











