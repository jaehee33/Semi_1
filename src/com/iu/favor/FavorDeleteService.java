package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class FavorDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		FavorDTO favorDTO = (FavorDTO)request.getSession().getAttribute("favor");
		
		
		return actionForward;
	}

}
