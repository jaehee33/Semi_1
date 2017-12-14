package com.iu.member;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

import oracle.net.aso.r;



public class MemberStyleService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/kind/kindList.jsp");
		return actionForward;
	}

}
