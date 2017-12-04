package com.iu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response);

}
