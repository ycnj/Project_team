package com.team.spring.rsch.vo;

public class RschVO {
	private int cd;
	private String title;
	private int sdate;
	private int edate;
	private int use;
	private int rdate;
	private String comm;
	private int cnt;
	
	// Getter/Setter
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
	public int setSdate() {
		return sdate;
	}
	public void setSdate(int sdate) {
		this.sdate = sdate;
	}
	public int setEdate() {
		return edate;
	}
	public void setedate(int edate) {
		this.edate = edate;
	}
	public int setUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	public int SetRdate() {
		return rdate;
	}
	public void setRdate(int rdate) {
		this.rdate = rdate;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public int SetCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	//toString
	@Override
	public String toString() {
		return "rschVO [cd=" + cd +", title=" +title+", sdate="+sdate+", edate="+edate+",use="+use+",rdate="+rdate+"]";
	}

}

