package com.kh.statistics.model.vo;

public class Percent {
	private int typeA;
	private int typeB;
	private int typeAll;
	
	public Percent() {}

	public Percent(int typeA, int typeB, int typeAll) {
		this.typeA = typeA;
		this.typeB = typeB;
		this.typeAll = typeAll;
	}

	public int getTypeA() {
		return typeA;
	}

	public void setTypeA(int typeA) {
		this.typeA = typeA;
	}

	public int getTypeB() {
		return typeB;
	}

	public void setTypeB(int typeB) {
		this.typeB = typeB;
	}

	public int getTypeAll() {
		return typeAll;
	}

	public void setTypeAll(int typeAll) {
		this.typeAll = typeAll;
	}

	@Override
	public String toString() {
		return "Percent [typeA=" + typeA + ", typeB=" + typeB + ", typeAll=" + typeAll + "]";
	}
}