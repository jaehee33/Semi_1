package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class PosTotalService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		PosDAO posDAO=new PosDAO();
		String store="";
		
		int totalMoney=0;
		try {
			store=request.getParameter("store");
			totalMoney=posDAO.getTotalMoney(store);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("total", totalMoney);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/pos/posTotal.jsp");
		
		return actionForward;
	}

}
