package com.kh.reservation.model.vo;

public class Room {
	private int roomNo;
	private String roomType;
	private int roomFee;
	private String roomUseable;
	private int roomSize;
	
	public Room() {}

	public Room(int roomNo, String roomType, int roomFee, String roomUseable, int roomSize) {
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.roomFee = roomFee;
		this.roomUseable = roomUseable;
		this.roomSize = roomSize;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomFee() {
		return roomFee;
	}

	public void setRoomFee(int roomFee) {
		this.roomFee = roomFee;
	}

	public String getRoomUseable() {
		return roomUseable;
	}

	public void setRoomUseable(String roomUseable) {
		this.roomUseable = roomUseable;
	}

	public int getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(int roomSize) {
		this.roomSize = roomSize;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomType=" + roomType + ", roomFee=" + roomFee + ", roomUseable="
				+ roomUseable + ", roomSize=" + roomSize + "]";
	}
}