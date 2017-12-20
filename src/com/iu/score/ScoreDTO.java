package com.iu.score;

import com.iu.board.BoardDTO;

public class ScoreDTO extends BoardDTO {

	private Double point;
	private int rec;
	private String store;

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public int getRec() {
		return rec;
	}

	public void setRec(int rec) {
		this.rec = rec;
	}

	public Double getPoint() {
		return point;
	}

	public void setPoint(Double point) {
		this.point = point;
	}
	
	

	
	
}
