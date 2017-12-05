package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;

public class PosInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		if(method.equals("GET")) {
			String store=request.getParameter("store");
			request.setAttribute("sname", store);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/pos/posInsert.jsp");
		}else {
			PosDTO posDTO=new PosDTO();
			posDTO.setStore(request.getParameter("store"));
			posDTO.setTotal(Integer.parseInt(request.getParameter("total")));
			PosDAO posDAO=new PosDAO();
			int result=0;
			try {
				result=posDAO.insert(posDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "insert Fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
			
		}
		
		return actionForward;
	}

}
