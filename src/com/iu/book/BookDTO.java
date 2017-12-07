package com.iu.book;

import java.sql.Date;

import com.iu.member.MemberDTO;

public class BookDTO{
	private String id;
	private String name;
	private String phone;
	private Date bk_date;
	private String bk_store;
	private String bk_style;
	private int bk_price;
	private String bk_coupon;
	private String bk_time;
	private boolean bk_use;	
	
	public boolean isBk_use() {
		return bk_use;
	}
	public void setBk_use(boolean bk_use) {
		this.bk_use = bk_use;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
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
	public String getBk_style() {
		return bk_style;
	}
	public void setBk_style(String bk_style) {
		this.bk_style = bk_style;
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
	public String getBk_time() {
		return bk_time;
	}
	public void setBk_time(String bk_time) {
		this.bk_time = bk_time;
	}
	
	
}
