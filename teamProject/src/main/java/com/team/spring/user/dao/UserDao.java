package com.team.spring.user.dao;

import java.util.List;

import com.team.spring.user.dto.UserDto;

public interface UserDao {
	public int getCount(UserDto dto);
	public List<UserDto> getList(UserDto dto);
	public void insert(UserDto dto);
	public UserDto getData(UserDto dto);
	public void addViewCount(int num);
	public void delete(int num);
	public UserDto getData(int num);
	public void update(UserDto dto);
}

















