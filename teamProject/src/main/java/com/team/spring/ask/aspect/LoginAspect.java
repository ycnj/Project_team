package com.team.spring.ask.aspect;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class LoginAspect {
	// return type 이 ModelAndView 이면서 auth 로 시작하는 모든 메소드가
	// aop 가 적용되는 곳(point cut) 이다. 
	@Around("execution(org.springframework.web.servlet.ModelAndView auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		//aop 가 적용된 메소드에 전달된 값을 Object[] 로 얻어오기
		Object[] args=joinPoint.getArgs();
		//로그인 여부
		boolean isLogin=false;
		HttpServletRequest request=null;
		for(Object tmp:args) {
			//인자로 전달된 값중에 HttpServletRequest type 을 찾아서
			if(tmp instanceof HttpServletRequest) {
				//원래 type 으로 casting
				request=(HttpServletRequest)tmp;
				//HttpSession 객체 얻어내기 
				HttpSession session=request.getSession();
				//세션에 "id" 라는 키값으로 저장된게 있는지 확인(로그인 여부)
				if(session.getAttribute("id") != null) {
					isLogin=true;
				}
			}
		}
		
		//로그인 했는지 여부 
		if(isLogin) {
			//aop 가 적용된 메소드 정상 수행하고 리턴된값 리턴해 주기 
			Object obj=joinPoint.proceed();
			return obj;
		}
		//원래 요청된 목적지 정보
		String url=request.getRequestURI();
		//query 문자열 
		String queryStr=request.getQueryString();
		if(queryStr==null) {
			queryStr="";
		}else {
			queryStr = "?"+queryStr;
		}
		ModelAndView mView=new ModelAndView();
		mView.setViewName("redirect:/users/loginform.do?url="+url+queryStr);
		return mView;	
	}
	// return type 이 Map 이면서 auth 로 시작하는 모든 메소드가
	// aop 가 적용되는 곳(point cut) 이다. 
	@Around("execution(java.util.Map auth*(..))")
	public Object loginCheckJSON(ProceedingJoinPoint joinPoint) throws Throwable{
		//aop 가 적용된 메소드에 전달된 값을 Object[] 로 얻어오기
		Object[] args=joinPoint.getArgs();
		//로그인 여부
		boolean isLogin=false;
		HttpServletRequest request=null;
		for(Object tmp:args) {
			//인자로 전달된 값중에 HttpServletRequest type 을 찾아서
			if(tmp instanceof HttpServletRequest) {
				//원래 type 으로 casting
				request=(HttpServletRequest)tmp;
				//HttpSession 객체 얻어내기 
				HttpSession session=request.getSession();
				//세션에 "id" 라는 키값으로 저장된게 있는지 확인(로그인 여부)
				if(session.getAttribute("id") != null) {
					isLogin=true;
				}
			}
		}
		
		//로그인 했는지 여부 
		if(isLogin) {
			//aop 가 적용된 메소드 정상 수행하고 리턴된값 리턴해 주기 
			Object obj=joinPoint.proceed();
			return obj;
		}
		//로그인 하지 않았으면 {"isSuccess":false} 가 응답되도록 한다.
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", false);
		return map;
	}
}










