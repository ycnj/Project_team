package com.team.spring.movieChart.dto;

import org.springframework.web.multipart.MultipartFile;

public class MovieChartDto {
	private int num;
	private String writer;
	private String title;
	private String content;
	private String opendate;
	private int liketo;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	// 페이징 처리를 하기 위한 필드 추가 
	private int startRowNum;
	private int endRowNum;
	//Spring 에서 파일 업로드 처리를 하기 위한 필드 추가
	//<input type="file" name="file" /> 에서 name 속성의 value 와 
	//같도록 필드명을 정한다.
	private MultipartFile file;
	
	public MovieChartDto() {}

	public MovieChartDto(int num, String writer, String title, String content, String opendate, int liketo,
			String orgFileName, String saveFileName, long fileSize, String regdate, int startRowNum, int endRowNum,
			MultipartFile file) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.opendate = opendate;
		this.liketo = liketo;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.file = file;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOpendate() {
		return opendate;
	}

	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}

	public int getLiketo() {
		return liketo;
	}

	public void setLiketo(int liketo) {
		this.liketo = liketo;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
	
}




