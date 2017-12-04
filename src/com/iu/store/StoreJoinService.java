package com.iu.store;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StoreJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		StoreDTO storeDTO=new StoreDTO();
		storeDTO.setArea(request.getParameter("area"));
		storeDTO.setHoliday(request.getParameter("holiday"));
		storeDTO.setStoretel(request.getParameter("storetel"));
		storeDTO.setStore(request.getParameter("store"));
	
		return actionForward;
	}

}
