package com.team.spring.ask.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.team.spring.ask.dao.AskCommentDao;
import com.team.spring.ask.dao.AskDao;
import com.team.spring.ask.dto.AskCommentDto;
import com.team.spring.ask.dto.AskDto;

@Service
public class AskServiceImpl implements AskService{
	@Autowired
	private AskDao askDao;
	
	@Autowired
	private AskCommentDao askCommentDao;
	 
	static final int PAGE_ROW_COUNT=5;
	 
	static final int PAGE_DISPLAY_COUNT=3;
	
	@Override
	public void getList(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		AskDto dto=new AskDto();
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("titlecontent")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			request.setAttribute("condition", condition);
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=askDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		// startRowNum 과 endRowNum 을 CafeDto 객체에 담고 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		// startRowNum 과 endRowNum 에 해당하는 카페글 목록을 select 해 온다.
		List<AskDto> list=askDao.getList(dto);
		
		//view 페이지에서 필요한 값을 request 에 담고 
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		//전체 글의 갯수도 request 에 담는다.
		request.setAttribute("totalRow", totalRow);		
	}

	@Override
	public void saveContent(AskDto dto) {
		askDao.insert(dto);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		//글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//검색과 관련된 정보를 CafeDto 객체에 선택적으로 담는다.
		AskDto dto=new AskDto();
		if(keyword != null) {//검색 키워드가 전달된 경우
			if(condition.equals("titlecontent")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			//request 에 검색 조건과 키워드 담기
			request.setAttribute("condition", condition);
			/*
			 *  검색 키워드에는 한글이 포함될 가능성이 있기 때문에
			 *  링크에 그대로 출력가능하도록 하기 위해 미리 인코딩을 해서
			 *  request 에 담아준다.
			 */
			String encodedKeyword=null;
			try {
				encodedKeyword=URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//인코딩된 키워드와 인코딩 안된 키워드를 모두 담는다.
			request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("keyword", keyword);
		}		
		//CafeDto 에 글번호도 담기
		dto.setNum(num);
		
		//글정보 얻어오기
		//CafeDto 객체를 getData() 의 인자로 전달해서 글정보를 얻어온다. 
		AskDto resultDto=askDao.getData(dto);
		//글 조회수 올리기
		askDao.addViewCount(num);
		//request 에 글정보를 담고
		request.setAttribute("dto", resultDto);
		List<AskCommentDto> commentList=askCommentDao.getList(num);
		//request 에 댓글 목록을 담는다.
		request.setAttribute("commentList", commentList);			
	}

	@Override
	public void deleteContent(int num) {
		askDao.delete(num);
	}

	@Override
	public void getUpdateData(ModelAndView mView, int num) {
		//글 수정 폼에 필요한 데이터를 얻어온다.
		AskDto dto=askDao.getData(num);
		//ModelAndView 객체에 dto를 담아준다. 
		mView.addObject("dto", dto);
	}

	@Override
	public void updateContent(AskDto dto) {
		askDao.update(dto);
	}

	@Override
	public void deleteComment(int num) {
		//댓글 삭제
		askCommentDao.delete(num);
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		//댓글 작성자
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 그룹번호
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		//댓글의 대상자 아이디
		String target_id=request.getParameter("target_id");
		//댓글의 내용
		String content=request.getParameter("content");
		//댓글 내에서의 그룹번호 (null 이면 원글의 댓글이다)
		String comment_group=request.getParameter("comment_group");
		//저장할 댓글의 primary key 값을 미리 얻어낸다. 
		int seq=askCommentDao.getSequence();
		//댓글 정보를 CafeCommentDto 객체에 담는다.
		AskCommentDto dto=new AskCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setRef_group(ref_group);
		dto.setContent(content);
		if(comment_group == null) { //원글의 댓글인경우
			//댓글의 글번호가 댓글 내에서의 그룹번호가 된다. 
			dto.setComment_group(seq);
		}else {//댓글의 댓글인 경우 
			//전달된 comment_group 번호를 새로 추가될 댓글의 그룹번호로 부여한다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장한다.
		askCommentDao.insert(dto);
	}

	@Override
	public void updateComment(AskCommentDto dto) {
		//CafeCommentDao 객체를 이용해서 댓글 내용을 update 한다. 
		askCommentDao.update(dto);
	}



		
}


	







