package com.iu.pos;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.kind.KindDAO;
import com.iu.kind.KindDTO;

public class PosIndexService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String store="";
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> ar=null;
		try {
			store=request.getParameter("store");
			ar=kindDAO.selectList(store);
		} catch (Exception e) {
			
		}
		request.setAttribute("kindlist", ar);
				request.setAttribute("store", store);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/pos/posIndex.jsp");
		
		return actionForward;
	}

}
