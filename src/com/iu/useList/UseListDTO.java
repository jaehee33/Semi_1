package com.iu.useList;

import java.sql.Date;

public class UseListDTO {
	
	private String id;
	private Date ul_date;
	private String ul_store;
	private String ul_style;
	private int ul_price;
	private String ul_coupon;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getUl_date() {
		return ul_date;
	}
	public void setUl_date(Date ul_date) {
		this.ul_date = ul_date;
	}
	public String getUl_store() {
		return ul_store;
	}
	public void setUl_store(String ul_store) {
		this.ul_store = ul_store;
	}
	public String getUl_style() {
		return ul_style;
	}
	public void setUl_style(String ul_style) {
		this.ul_style = ul_style;
	}
	public int getUl_price() {
		return ul_price;
	}
	public void setUl_price(int ul_price) {
		this.ul_price = ul_price;
	}
	public String getUl_coupon() {
		return ul_coupon;
	}
	public void setUl_coupon(String ul_coupon) {
		this.ul_coupon = ul_coupon;
	}
	

}
