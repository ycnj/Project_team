package com.team.spring.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.team.spring.freeboard.dto.FreeBoardCommentDto;
import com.team.spring.freeboard.dto.FreeBoardDto;
import com.team.spring.freeboard.service.FreeBoardService;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;

	@RequestMapping("/freeboard/list")
	public ModelAndView getList(HttpServletRequest request) {
		// HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다.
		service.getList(request);
		// view 페이지로 forward 이동해서 글 목록 출력하기
		return new ModelAndView("freeboard/list");
	}

	@RequestMapping("/freeboard/insertform")
	public ModelAndView authInsertform(HttpServletRequest request) {
		// view 페이지로 forward 이동해서 새 글 작성 폼 출력하기
		return new ModelAndView("freeboard/insertform");
	}

	@RequestMapping("/freeboard/detail")
	public ModelAndView detail(HttpServletRequest request) {
		service.getDetail(request);
		return new ModelAndView("freeboard/detail");
	}

	@RequestMapping("/freeboard/delete")
	public ModelAndView authDelete(@RequestParam int num, 
			HttpServletRequest request, @ModelAttribute FreeBoardDto dto ) {
		service.deleteContent(num, dto, request);
		return new ModelAndView("redirect:/freeboard/list.do");
	}

	//첨부파일 삭제 컨트롤러 매핑
	
	
	@RequestMapping("/freeboard/updateform")
	public ModelAndView authUpdateForm(ModelAndView mView, @RequestParam int num, HttpServletRequest request) {
		service.getUpdateData(mView, num);
		mView.setViewName("freeboard/updateform");
		return mView;
	}

	@RequestMapping("/freeboard/update")
	public ModelAndView authUpdate(@ModelAttribute FreeBoardDto dto, HttpServletRequest request) {
		// 서비스를 이용해서 글을 수정반영하고
		service.updateContent(dto);
		// dto 에 담긴 글 번호를 이용해서 글자세히 보기로 리다일렉트 이동시킨다.
		return new ModelAndView("redirect:/freeboard/detail.do?num=" + dto.getNum());
	}
	
	@RequestMapping("/freeboard/comment_delete")
	@ResponseBody
	public Map<String, Object> authCommentDelete(@RequestParam int num, HttpServletRequest request) {
		// num 은 삭제할 댓글의 글번호 이다.
		service.deleteComment(num);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	//댓글 추가 요청처리
	@RequestMapping("/freeboard/comment_insert")
	public ModelAndView authCommentInsert(@RequestParam int ref_group, HttpServletRequest request) {
		//서비스를 이용해서 새 댓글을 저장하고 
		service.saveComment(request);
		//ref_group 은 원글의 글번호 이다. (댓글의 그룹번호)
		return new ModelAndView("redirect:/freeboard/detail.do?num="+ref_group);
	}
	//댓글 수정 요청 처리
	@RequestMapping("/freeboard/comment_update")
	@ResponseBody
	public Map<String, Object> authCommentUpdate(@ModelAttribute FreeBoardCommentDto dto,
			HttpServletRequest request){
		//서비스를 통해서 댓글을 업데이트 하는 작업을 하고
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	@RequestMapping("/freeboard/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("freeboard/upload_form");
	}
	//파일 업로드 요청 처리 
	@RequestMapping("/freeboard/upload")
	public ModelAndView authUpload(@ModelAttribute FreeBoardDto dto, 
			HttpServletRequest request) {
		//FileDto 에는 업로드된 파일의 제목(title)과 파일정보(file)이 들어있다.
		service.saveContent(dto, request);
		//파일 목록보기로 리다일렉트 시킨다. 
		return new ModelAndView("redirect:/freeboard/list.do");
	}
	//파일 다운로드 요청 처리
		@RequestMapping("/freeboard/download")
		public ModelAndView download(ModelAndView mView, @RequestParam int num) {
			/* 파라미터로 전달되는 다운로드할 파일의 번호를 이용해서
			 * 파일정보를 DB 에서 읽어와서 
			 * ModelAndView 객체에 담고
			 * 파일을 다운로드 시켜줄 view 로 이동해서 다운로드 시켜주기 
			 */
			service.getFileData(mView, num);
			// 추상 view 의 이름 : "fileDownView" 
			mView.setViewName("fileDownView");
			return mView;
	
		}


}
