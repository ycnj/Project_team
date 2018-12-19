package com.team.spring.users_mp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.spring.users_mp.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SqlSession session;

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);		
	}

	@Override
	public boolean isValid(UsersDto dto) {
		/*
		 *  parameterType : UsersDto
		 *  resultType : String
		 */
		String id=session.selectOne("users.getId", dto);
		if(id == null) { //아이디 혹은 비밀번호가 틀리면 null 이다. 
			return false;
		}else { // null 이 아니면 유효한 정보이다. 
			return true; 
		}
	}
	//인자로 전달된 아이디가 존재하는지 여부를 리턴하는 메소드 
	@Override
	public boolean isExist(String inputId) {
		String id=inputId;
		String selectedId=session.selectOne("users.isExist", id);
		System.out.println("dd"+selectedId+"///"+id);
		if(selectedId==null) {// null 이면 해당아이디는 존재 하지 않는것이다.
			return false;
		}else {
			return true;
		}
	}

	@Override
	public UsersDto getData(String id) {
		
		return session.selectOne("users.getData", id);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public String getPwdHash(String id) {
		//비밀번호 hash 값을 select 해서 리턴해준다.
		return session.selectOne("users.getPwd", id);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		//비밀번호만 수정하기 
		session.update("users.updatePwd", dto);
	}

	@Override
	public List<UsersDto> getList() {
		List<UsersDto> list;
		list=session.selectList("users.getList");
		return list;
	}
	
	
}