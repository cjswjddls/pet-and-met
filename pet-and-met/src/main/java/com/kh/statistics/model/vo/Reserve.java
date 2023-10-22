package com.kh.statistics.model.vo;

public class Reserve {
	private String date;
	private int reserve;
	private int empty;
	
	public Reserve() {}

	public Reserve(String date, int reserve, int empty) {
		this.date = date;
		this.reserve = reserve;
		this.empty = empty;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getReserve() {
		return reserve;
	}

	public void setReserve(int reserve) {
		this.reserve = reserve;
	}

	public int getEmpty() {
		return empty;
	}

	public void setEmpty(int empty) {
		this.empty = empty;
	}

	@Override
	public String toString() {
		return "Reserve [date=" + date + ", reserve=" + reserve + ", empty=" + empty + "]";
	}
}