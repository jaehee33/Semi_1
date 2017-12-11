package com.iu.pos;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class PosIndexService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String store=request.getParameter("store");
				request.setAttribute("store", store);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/pos/posIndex.jsp");
		
		return actionForward;
	}

}
