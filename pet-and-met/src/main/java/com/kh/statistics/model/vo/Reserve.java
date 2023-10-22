package com.kh.statistics.model.vo;

public class Reserve {
	private String name;
	private int reserve;
	private int empry;
	
	public Reserve() {}

	public Reserve(String name, int reserve, int empry) {
		this.name = name;
		this.reserve = reserve;
		this.empry = empry;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getReserve() {
		return reserve;
	}

	public void setReserve(int reserve) {
		this.reserve = reserve;
	}

	public int getEmpry() {
		return empry;
	}

	public void setEmpry(int empry) {
		this.empry = empry;
	}

	@Override
	public String toString() {
		return "Reserve [name=" + name + ", reserve=" + reserve + ", empry=" + empry + "]";
	}
}