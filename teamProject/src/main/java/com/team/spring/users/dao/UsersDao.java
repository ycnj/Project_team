package com.team.spring.users.dao;

import com.team.spring.users.dto.UsersDto;

/* UsersDaoImpl 클래스가 구현할 인터페이스 */
public interface UsersDao {
	//회원정보를 DB 에 INSERT 하는 메소드
	public void insert(UsersDto dto);
	//유효한 정보인지 리턴해주는 메소드
	public boolean isValid(UsersDto dto);
	//인자로 전달된 아이디가 이미 DB에 존재하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId);
	//인자로 전달된 아이디에 해당하는 개인정보를 리턴해주는 메소드
	public UsersDto getData(String id);
	//회원정보를 수정반영하는 메소드
	public void update(UsersDto dto);
	//회원정보를 삭제하는 메소드 
	public void delete(String id);
	//아이디에 해당하는 비밀번호 hash 값을 리턴해주는 메소드
	public String getPwdHash(String id);
	//비밀번호 수정하는 메소드
	public void updatePwd(UsersDto dto);
}














