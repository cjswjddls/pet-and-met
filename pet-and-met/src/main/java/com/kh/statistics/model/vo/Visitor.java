package com.kh.statistics.model.vo;

public class Visitor {
	private int month;
	private int confirm;
	private int cancel;
	
	public Visitor() {}

	public Visitor(int month, int confirm, int cancel) {
		this.month = month;
		this.confirm = confirm;
		this.cancel = cancel;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getConfirm() {
		return confirm;
	}

	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}

	public int getCancel() {
		return cancel;
	}

	public void setCancel(int cancel) {
		this.cancel = cancel;
	}

	@Override
	public String toString() {
		return "Visitor [month=" + month + ", confirm=" + confirm + ", cancel=" + cancel + "]";
	}
}