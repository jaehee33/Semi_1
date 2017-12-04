package com.iu.customer;

import java.util.Date;

public class BookDTO {
	private String id;
	private Date bk_date;
	private String bk_store;
	private int bk_price;
	private String bk_coupon;
	private String bk_hour;
	private String bk_min;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getBk_date() {
		return bk_date;
	}
	public void setBk_date(Date bk_date) {
		this.bk_date = bk_date;
	}
	public String getBk_store() {
		return bk_store;
	}
	public void setBk_store(String bk_store) {
		this.bk_store = bk_store;
	}
	public int getBk_price() {
		return bk_price;
	}
	public void setBk_price(int bk_price) {
		this.bk_price = bk_price;
	}
	public String getBk_coupon() {
		return bk_coupon;
	}
	public void setBk_coupon(String bk_coupon) {
		this.bk_coupon = bk_coupon;
	}
	public String getBk_hour() {
		return bk_hour;
	}
	public void setBk_hour(String bk_hour) {
		this.bk_hour = bk_hour;
	}
	public String getBk_min() {
		return bk_min;
	}
	public void setBk_min(String bk_min) {
		this.bk_min = bk_min;
	}
	
	
}
