package com.iu.pos;

import java.sql.Date;

import com.iu.util.MakeRow;

public class PosMakeRow extends MakeRow{
	private String kind;
	private String type;
	private Date date;

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		if(kind==null) {
			this.kind="kind";
		}else {
		this.kind = kind;
	}
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		if(type==null) {
		this.type = "pos_import,expend";
		}else {
			this.type= type;
		}
	}
	
}
