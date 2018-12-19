package com.team.spring.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.user.dto.UserCommentDto;
import com.team.spring.user.dto.UserDto;
import com.team.spring.user.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService service;

	@RequestMapping("/user/userlistboard")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("user/userlistboard");
	}

	@RequestMapping("/user/userboard")
	public ModelAndView getList2(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("user/userboard");
	}
	
	@RequestMapping("/user/list3")
	public ModelAndView authgetList3(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("user/list3");
	}
	
	@RequestMapping("/user/detailview")
	public ModelAndView getList4(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("user/detailview");
	}
	@RequestMapping("/user/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		//view 페이지로 forward 이동해서 새글 작성 폼 출력하기 
		return new ModelAndView("user/insertform");
	}
	@RequestMapping("/user/insert")
	public ModelAndView authInsert(@ModelAttribute UserDto dto,HttpServletRequest request) {
		//userDto 객체에 작성자의 아이디를 담아서 
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		//새글을 저장한다. 
		service.saveContent(dto);
		//글 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/user/userlistboard.do");
	}
	@RequestMapping("/user/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("user/detailview");
	}
		
	
	@RequestMapping("/user/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		service.deleteContent(num);
		return new ModelAndView("redirect:/user/userlistboard.do");
	}
	@RequestMapping("/user/updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, 
			HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("user/updateform");
		return mView;
	}
	@RequestMapping("/user/update")
	public ModelAndView authUpdate(@ModelAttribute UserDto dto,HttpServletRequest request) {
		//서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		//dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/user/detail.do?num="+dto.getNum());
	}
	@RequestMapping("/user/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(@RequestParam int num, HttpServletRequest request) {
		// num 은 삭제할 댓글의 글번호 이다.
		service.deleteComment(num);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	//댓글 추가 요청처리
	@RequestMapping("/user/comment_insert")
	public ModelAndView authCommentInsert(@RequestParam int ref_group, HttpServletRequest request) {
		//서비스를 이용해서 새 댓글을 저장하고 
		service.saveComment(request);
		//ref_group 은 원글의 글번호 이다. (댓글의 그룹번호)
		return new ModelAndView("redirect:/user/detail.do?num="+ref_group);
	}
	//댓글 수정 요청 처리
	@RequestMapping("/user/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(@ModelAttribute UserCommentDto dto,
			HttpServletRequest request){
		//서비스를 통해서 댓글을 업데이트 하는 작업을 하고
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
}




































































































