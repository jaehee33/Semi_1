package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StoreMapView implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		actionForward.setCheck(true);
		actionForward.setPath("../map/mapp.jsp");
		return actionForward;
	}

}
