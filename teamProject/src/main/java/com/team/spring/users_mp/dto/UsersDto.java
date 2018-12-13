package com.team.spring.users_mp.dto;

public class UsersDto {

	private String name; //이름
	private String rrn; //생년월일
	private String id; //회원아이디
	private String pwd; //회원비밀번호
	private String email;//회원이메일
	private int phon; //핸드폰
	private String addr1; //지번
	private String addr2; //주소
	private String addr3; //상세주소
	private String gender; //성별
	private int gubun; //구분
	private String date; //가입일
	
	public UsersDto() {}

	public UsersDto(String name, String rrn, String id, String pwd, String email, int phon, String addr1, String addr2,
			String addr3, String gender, int gubun, String date) {
		super();
		this.name = name;
		this.rrn = rrn;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.phon = phon;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.gender = gender;
		this.gubun = gubun;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwdl) {
		this.pwd = pwdl;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhon() {
		return phon;
	}

	public void setPhon(int phon) {
		this.phon = phon;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	
}

