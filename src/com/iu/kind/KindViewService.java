package com.iu.kind;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class KindViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num=0;
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
			KindDAO kindDAO = new KindDAO();
			KindDTO kindDTO = kindDAO.selectone(num);			
			request.setAttribute("kind", kindDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindview.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return actionForward;
	}

}
