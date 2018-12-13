package com.team.spring.file.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDto {
	private int num;
	private String id;
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public FileDto(int num, String id, String title, String orgFileName, String saveFileName, long fileSize,
			int downCount, String regdate, int startRowNum, int endRowNum, MultipartFile file) {
		super();
		this.num = num;
		this.id = id;
		this.title = title;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.file = file;
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

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
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

	private String title;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private int downCount;
	private String regdate;
	// 페이징 처리를 하기 위한 필드 추가 
	private int startRowNum;
	private int endRowNum;
	//Spring 에서 파일 업로드 처리를 하기 위한 필드 추가
	//<input type="file" name="file" /> 에서 name 속성의 value 와 
	//같도록 필드명을 정한다.
	private MultipartFile file;
	
	public FileDto() {}



	
}













