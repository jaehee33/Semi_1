package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.sun.org.apache.bcel.internal.generic.ACONST_NULL;

public class PosDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int num=0;
		int result=0;
		PosDAO posDAO=new PosDAO();
		try {
			num=Integer.parseInt(request.getParameter("num"));
			result=posDAO.delete(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result>0) {
			actionForward.setPath("./posIndex.pos");
		}else {
			request.setAttribute("message", "delete fail");
			request.setAttribute("path", "./posIndex.pos");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
			
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
