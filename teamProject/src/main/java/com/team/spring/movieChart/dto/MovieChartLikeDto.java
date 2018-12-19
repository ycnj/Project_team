package com.team.spring.movieChart.dto;


public class MovieChartLikeDto {
	private int num;
	private int movieInfoNum;
	private String id;
	private int like_check;
	
	public MovieChartLikeDto() {}

	public MovieChartLikeDto(int num, int movieInfoNum, String id, int like_check) {
		super();
		this.num = num;
		this.movieInfoNum = movieInfoNum;
		this.id = id;
		this.like_check = like_check;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getMovieInfoNum() {
		return movieInfoNum;
	}

	public void setMovieInfoNum(int movieInfoNum) {
		this.movieInfoNum = movieInfoNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	
}