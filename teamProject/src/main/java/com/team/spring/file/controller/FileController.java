package com.team.spring.file.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.spring.file.dto.FileDto;
import com.team.spring.file.service.FileService;

@Controller
public class FileController {
	@Autowired
	private FileService service;
	
	@RequestMapping("/file/list")
	public String getList(HttpServletRequest request) {
		//FileService 객체의 getList() 메소드에 HttpServletRequest 객체의 
		//참조값을 전달해서 view 페이지에 필요한 값이 request 영역에 담기게 한다. 
		service.getList(request);
		// view 페이지로 forward 이동해서 파일 목록 출력하기 
		return "file/list";
	}
	@RequestMapping("/file/delete")
	public ModelAndView authDelete(@RequestParam int num, 
			HttpServletRequest request, HttpServletResponse response) {
		service.removeFileInfo(num, request, response);
		return new ModelAndView("redirect:/file/list.do");
	}
	@RequestMapping("/file/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("file/upload_form");
	}
	//파일 업로드 요청 처리 
	@RequestMapping("/file/upload")
	public ModelAndView authUpload(@ModelAttribute FileDto dto, 
			HttpServletRequest request) {
		//FileDto 에는 업로드된 파일의 제목(title)과 파일정보(file)이 들어있다.
		service.saveFile(dto, request);
		//파일 목록보기로 리다일렉트 시킨다. 
		return new ModelAndView("redirect:/file/list.do");
	}
	//파일 다운로드 요청 처리
	@RequestMapping("/file/download")
	public ModelAndView download(ModelAndView mView, @RequestParam int num) {
		/* 파라미터로 전달되는 다운로드할 파일의 번호를 이용해서
		 * 파일정보를 DB 에서 읽어와서 
		 * ModelAndView 객체에 담고
		 * 파일을 다운로드 시켜줄 view 로 이동해서 다운로드 시켜주기 
		 */
		service.getFileData(mView, num);
		service.addDownCount(num); //다운로드 횟수 증가 시키기 
		// 추상 view 의 이름 : "fileDownView" 
		mView.setViewName("fileDownView");
		return mView;
	}
}



































