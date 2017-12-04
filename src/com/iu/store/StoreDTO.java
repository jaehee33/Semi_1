package com.iu.store;

import com.iu.member.MemberDTO;

public class StoreDTO extends MemberDTO {
	
	private String id;
	private String store;
	private String area;
	private String storetel;
	private String holiday;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStoretel() {
		return storetel;
	}
	public void setStoretel(String storetel) {
		this.storetel = storetel;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	
	
	
}
