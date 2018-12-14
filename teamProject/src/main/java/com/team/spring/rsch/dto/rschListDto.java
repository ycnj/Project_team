package com.team.spring.rsch.dto;

public class rschListDto {
	private int cd;
	private String title;
	private int sdate;
	private int edate;
	private String use;
	private int rdate;
	
	public rschListDto() {}
	public rschListDto(int cd, String title, int sdate, int edate, String use, int rdate) {
		
		super();
		this.cd = cd;
		this.title = title;
		this.sdate = sdate;
		this.edate = edate;
		this.use = use;
		this.rdate = rdate;
	}
	public int getCd() {
		return cd;
	}
	public void setCd(int cd) {
		this.cd = cd;		
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSdate() {
		return sdate;
	}
	public void setSdate(int sdate) {
		this.sdate = sdate;
	}
	public int getEdate() {
		return edate;
	}
	public void setEdate(int edate) {
		this.edate = edate;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public int getRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
}
