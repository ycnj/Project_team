package com.team.spring.users_mp.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.users_mp.dao.UsersDao;
import com.team.spring.users_mp.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDao dao;

	public void addUser(ModelAndView mView, UsersDto dto) {
		//dto 에 저장된 비밀번호를 암호화 해서 다시 넣어준다.
		String planText=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String hash=encoder.encode(planText);
		//hash 문자열을 setter 메소드를 이용해서 다시 dto 에 넣어준다. 
		dto.setPwd(hash);
		//UsersDao 를 이용해서 DB 에 저장하기 
		dao.insert(dto);
		mView.addObject("id", dto.getId());
	}
	//UsersDto 에 담긴 id, pwd 가 유효한 정보인지 확인해서 로그인 처리를 하는 메소드
	@Override
	public void validUser(HttpSession session, ModelAndView mView, UsersDto dto) {
		//UsersDao 를 이용해서 아이디 비밀번호가 유효한지 여부를 알아낸다. 
		boolean isValid=false;
		//DB 에 저장된 암호화된 비밀번호를 읽어온다. 
		String pwdHash=dao.getPwdHash(dto.getId());
		if(pwdHash != null) {
			//입력한 비밀번호와 암호화된 비밀번호의 일치여부를 isValid 에 넣어준다.
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			//로그인 처리를 해준다.
			session.setAttribute("id", dto.getId());
			//로그인 성공 여부를 ModelAndView 객체에 담는다.
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
	}
	@Override
	public Map<String, Object> canUseId(String inputId) {
		//UsersDao 를 이용해서 입력한 아이디가 존재하는지 여부를 받아온다. 
		boolean isExist=dao.isExist(inputId);
		// jackson 라이브러리가 JSON 문자열을 출력하도록 하는 Map 객체 
		Map<String, Object> map=new HashMap<>();
		if(isExist) {
			map.put("canUse", false);
		}else {
			map.put("canUse", true);
		}
		return map;
	}
	@Override
	public void showInfo(HttpSession session, ModelAndView mView) {
		String id=(String)session.getAttribute("id");
		//UsersDao 객체를 이용해서 개인정보 가져와서
		UsersDto dto=dao.getData(id);
		//ModelAndView 객체에 담으면 HttpServletRequest 에 담긴다. 
		mView.addObject("dto", dto);
	}
	@Override
	public void updateUser(UsersDto dto) {
		//UsersDao 객체를 이용해서 수정 반영한다. 
		dao.update(dto);
	}
	@Override
	public void deleteUser(HttpSession session) {
		// 세션에 저장된 아이디를 읽어와서 
		String id=(String)session.getAttribute("id");
		// 삭제한다.
		dao.delete(id);
		// 로그 아웃처리
		session.invalidate();
	}
	@Override
	public void updatePwd(HttpServletRequest request) {
		//비밀번호를 수정할 회원의 아이디를 세션에서 얻어온다. 
		String id=(String)request.getSession().getAttribute("id");
		//새 비밀번호를 읽어온다.
		String pwd=request.getParameter("pwd");
		//비밀 번호를 암호화 한다.
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		//UsersDto 객체를 생성해서 담는다.
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(encoder.encode(pwd));
		//dao 를 이용해서 DB 에 수정 반영한다.
		dao.updatePwd(dto);
	}
	
}