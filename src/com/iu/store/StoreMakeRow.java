package com.iu.store;

import com.iu.util.MakeRow;

public class StoreMakeRow extends MakeRow{


	private String kind;

	public void setKind(String kind) {
		if(kind==null) {
			this.kind="store";
		}else {
			this.kind = kind;
		}
	}
}