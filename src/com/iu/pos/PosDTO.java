package com.iu.pos;

import java.sql.Date;

public class PosDTO {

	private Date pos_date;
	private int pos_import;
	private int expend;
	private String kind;
	private int total;
	private String store;
	private boolean pos_coupon;
	private int num;
	private String state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getPos_date() {
		return pos_date;
	}
	public void setPos_date(Date pos_date) {
		this.pos_date = pos_date;
	}
	public int getPos_import() {
		return pos_import;
	}
	public void setPos_import(int pos_import) {
		this.pos_import = pos_import;
	}
	public int getExpend() {
		return expend;
	}
	public void setExpend(int expend) {
		this.expend = expend;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public boolean isPos_coupon() {
		return pos_coupon;
	}
	public void setPos_coupon(boolean pos_coupon) {
		this.pos_coupon = pos_coupon;
	}
	
	
	
}
