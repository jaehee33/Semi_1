package com.iu.use;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class UseDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num=0;
		int result=0;
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
			UseDAO bookDAO=new UseDAO();
			result=bookDAO.delete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			actionForward.setCheck(false);
			actionForward.setPath("./useList.use");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../memberMyPage.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
