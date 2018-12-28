package com.team.spring.users.dto;

public class UsersResDto {
	//필드 
	private String id;
	private int num;
	private String movieName;
	private String saveFileName;
	private int price;
	private String paymentWay;
	private int currCon;
	private int point;
	private String regdate;
	
	//디폴트 생성자 
	public UsersResDto() {}

	public UsersResDto(String id, int num, String movieName, String saveFileName, int price, String paymentWay,
			int currCon, int point, String regdate) {
		super();
		this.id = id;
		this.num = num;
		this.movieName = movieName;
		this.saveFileName = saveFileName;
		this.price = price;
		this.paymentWay = paymentWay;
		this.currCon = currCon;
		this.point = point;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentWay() {
		return paymentWay;
	}

	public void setPaymentWay(String paymentWay) {
		this.paymentWay = paymentWay;
	}

	public int getCurrCon() {
		return currCon;
	}

	public void setCurrCon(int currCon) {
		this.currCon = currCon;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
	
	
}
