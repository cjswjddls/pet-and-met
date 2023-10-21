package com.kh.statistics.model.vo;

public class Income {
	private int date;
	private int income;
	private int profit;
	
	public Income() {}

	public Income(int date, int income, int profit) {
		this.date = date;
		this.income = income;
		this.profit = profit;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	@Override
	public String toString() {
		return "Income [date=" + date + ", income=" + income + ", profit=" + profit + "]";
	}
}