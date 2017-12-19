package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StoreMapService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String area="";
		try {
			area=request.getParameter("area");
		}catch (Exception e) {
		}
		request.setAttribute("area", area);
		actionForward.setCheck(true);
		actionForward.setPath("../map/map2.jsp");
		return actionForward;
	}

}
