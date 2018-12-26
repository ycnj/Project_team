package com.team.spring.rsch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.dto.RschListDto;
import com.team.spring.rsch.service.RschService;


@Controller
public class rschController {
	@Autowired
	private RschService rschService;
	
	//게시글 목록
	@RequestMapping("/rsch/rschList")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		rschService.getList(request);
		//view 페이지로 forward 이동(해서 글 목록 출력하기 
		return new ModelAndView("rsch/list");
	}
	//게시글 작성화면
	@RequestMapping("/rsch/rschWrite")
	public ModelAndView authrschWrite(HttpServletRequest requset) {
		return new ModelAndView("rsch/rschWrite");
	}
	//게시글 작성처리
	@RequestMapping("/rsch/insert")
	public ModelAndView authCreate(@ModelAttribute RschListDto dto, HttpServletRequest request) {
		rschService.saveComm(dto);
		return new ModelAndView("redirect:/rsch/rschList.do");
	}
	//게시글 상세조회
	@RequestMapping("/rsch/rschJoinList")
	public ModelAndView detail(HttpServletRequest request) {
		rschService.getDetail(request);
		return new ModelAndView("rsch/rschJoinList");
}
	//게시글 수정
	@RequestMapping("/rsch/update")
	public ModelAndView authUpdate(@ModelAttribute RschListDto dto,HttpServletRequest request) {
		rschService.updateComm(dto);
		return new ModelAndView("redirect:/rsch/rschList.do?num="+dto.getCd());
	}
	//게시글 삭제
	@RequestMapping("/rsch/delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(@RequestParam int cd, HttpServletRequest request) {
		rschService.deleteComm(cd);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	

}
	
	