package com.iu.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.sun.accessibility.internal.resources.accessibility;

public class MemberLogoutService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		request.getSession().invalidate();
		actionForward.setCheck(false);
		actionForward.setPath("../index.jsp");
		
		return actionForward;
	}

}
