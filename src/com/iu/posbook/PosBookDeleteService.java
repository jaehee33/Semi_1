package com.iu.posbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class PosBookDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		PosBookDAO posBookDAO= new PosBookDAO();
		int num=0;
		int result=0;
		String store="";
		try {
			store=request.getParameter("store");
			System.out.println(store);
			num=Integer.parseInt(request.getParameter("num"));
			result=posBookDAO.success(num);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("store", store);
		actionForward.setCheck(false);
		actionForward.setPath("./posbook.pos?store="+store);
		
		return actionForward;
	}

}
