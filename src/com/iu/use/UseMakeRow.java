package com.iu.use;

import com.iu.util.MakeRow;

public class UseMakeRow extends MakeRow{
	private String kind;
	private String search;
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		if(kind==null) {
			this.kind="store";
		}else {
			this.kind = kind;
		}
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		if(search==null) {
			this.search="";
		}else {
			this.search = search;
		}
	}
	
	
}
