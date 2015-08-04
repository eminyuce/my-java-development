package com.alcatel.lucent;


public class Person {
	
	private String name;
	private int phoneNo;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(int phoneNo) {
		this.phoneNo = phoneNo;
	}

	

	@Override
	public String toString() {
		return "Name="+this.name+" No="+this.phoneNo;
	}
	


}
