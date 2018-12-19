package com.team.spring.freeboard.dto;

import org.springframework.web.multipart.MultipartFile;

public class FreeBoardDto {
	private int num;
	private String id;
	private String title;
	private String content;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private int viewCount;
	private String regdate;	
	private MultipartFile file;
	//페이징 처리
	private int startRowNum;
	private int endRowNum;
	//이전 글, 다음 글의 글 번호를 담을 필드
	private int prevNum;
	private int nextNum;
	//생성자
	public FreeBoardDto() {}
	public FreeBoardDto(int num, String id, String title, String content, String orgFileName, String saveFileName,
			long fileSize, int viewCount, String regdate, MultipartFile file, int startRowNum, int endRowNum,
			int prevNum, int nextNum) {
		super();
		this.num = num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.file = file;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
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
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	
	
	
}
