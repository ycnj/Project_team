package com.team.spring.movie.dto;

public class MovieSercDto {
	private String query;
	private int display;
	private int start;
	private String genre;
	private String country;
	private int yearfrom;
	private int yearto;
	
	public MovieSercDto() {}

	
	
	public MovieSercDto(String query, int display, int start, String genre, String country, int yearfrom, int yearto) {
		super();
		this.query = query;
		this.display = display;
		this.start = start;
		this.genre = genre;
		this.country = country;
		this.yearfrom = yearfrom;
		this.yearto = yearto;
	}



	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getYearfrom() {
		return yearfrom;
	}

	public void setYearfrom(int yearfrom) {
		this.yearfrom = yearfrom;
	}

	public int getYearto() {
		return yearto;
	}

	public void setYearto(int yearto) {
		this.yearto = yearto;
	}

	

}
