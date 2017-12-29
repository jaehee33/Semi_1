package com.iu.score;

import com.iu.util.MakeRow;

public class ScoreMakeRow extends MakeRow{

	private String kind;

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		if(kind==null) {
			kind="";
		}else {
		this.kind = kind;
		}
	}
	
	
}
