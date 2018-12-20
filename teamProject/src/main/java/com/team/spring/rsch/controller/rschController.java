package com.team.spring.rsch.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.rsch.service.RschService;
import com.team.spring.rsch.vo.RschVO;

@Controller
@RequestMapping("/rsch/*")
public class rschController {
	@Inject
	RschService rschService;
	//게시글 목록
	@RequestMapping("rschList.do")
	public ModelAndView list() throws Exception{
	List<RschVO> list= rschService.listAll();
	//modelAndView - 모델과 뷰
	ModelAndView mav = new ModelAndView();
	mav.setViewName("rsch/rschList");
	mav.addObject("rschList", list);
	return mav;
	}
	//게시글 작성화면
	@RequestMapping(value="rschWrite.do", method=RequestMethod.GET)
	public String write() {
		return "rsch/rschWrite";
	}
	//게시글 작성처리
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute RschVO vo) throws Exception{
		rschService.create(vo);
		return "redirect:rschList.do";
	}
	//게시글 상세조회
	@RequestMapping(value="rschJoinList.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int cd, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		//뷰의이름
		mav.setViewName("rsch/rschJoinList");
		//뷰에 전달할 데이터
		mav.addObject("dto",rschService.read(cd));
		return mav;
	}
	//게시글 수정
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute RschVO vo) throws Exception{
		rschService.update(vo);
		return "redirect:rschList.do";
	}
	//게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cd) throws Exception{
		rschService.delete(cd);
		return "redirect:rschList.do";
	}
	

}
	
	