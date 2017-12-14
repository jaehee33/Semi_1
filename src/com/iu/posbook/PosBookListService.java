package com.iu.posbook;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class PosBookListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		String store="";
		
		
		
		PosBookDAO posBookDAO=new PosBookDAO();
		ArrayList<PosBookDTO> ar=null;
		
		try {
			store=request.getParameter("store");
			ar=(ArrayList<PosBookDTO>)posBookDAO.selectList(store);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("posbook", ar);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/pos/posBook.jsp");
		
		
		return actionForward;
	}

}
