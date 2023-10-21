package com.kh.reservation.model.vo;

public class Room {
	// 필드부
	private int roomNo;//	ROOM_NO	NUMBER
	private String roomType;//	ROOM_TYPE	CHAR(2 BYTE)
	private int roomFee;//	ROOM_FEE	NUMBER
	private int roomUseable;//	ROOM_USEABLE	NUMBER
	private int roomSize;//	ROOM_SIZE	NUMBER
	
	// 생성자부
	public Room() {}

	public Room(int roomNo, String roomType, int roomFee, int roomUseable, int roomSize) {
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.roomFee = roomFee;
		this.roomUseable = roomUseable;
		this.roomSize = roomSize;
	}
	
	// 객실 정보 생정자
	public Room(String roomType, int roomFee, int roomSize) {
		this.roomType = roomType;
		this.roomFee = roomFee;
		this.roomSize = roomSize;
	}
	
	// 필드부
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

	public int getRoomUseable() {
		return roomUseable;
	}

	public void setRoomUseable(int roomUseable) {
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