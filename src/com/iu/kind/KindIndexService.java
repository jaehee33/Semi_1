package com.iu.kind;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class KindIndexService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/kind/kindIndex.jsp");
		
		return actionForward;
	}

}
