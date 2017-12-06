package com.iu.pos;

import com.iu.util.MakeRow;

public class PosMakeRow extends MakeRow{
	private String kind;
	private String type;

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
		if(kind==null) {
		this.type = "pos_import,expend";
		}else {
			this.type= type;
		}
	}
	
}
