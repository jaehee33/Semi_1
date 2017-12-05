package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StroeUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		StoreDAO storeDAO=new StoreDAO();
		String id="";
		try {
		id=request.getParameter("id");
		}catch (Exception e){
			
		}
		if(method.equals("GET")) {
			StoreDTO storeDTO=null;
			try {
				storeDTO = storeDAO.selectOne(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("store", storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeUpdate.jsp");
		}else {
			int result=0;
			StoreDTO storeDTO=new StoreDTO();
			storeDTO.setArea(request.getParameter("area"));
			storeDTO.setHoliday(request.getParameter("holiday"));
			storeDTO.setStore(request.getParameter("store"));
			storeDTO.setStoretel(request.getParameter("storetel"));
			try {
				result=storeDAO.update(storeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./storeView.store");
			}else {
				request.setAttribute("message", "update Fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
		}
		
		
		return actionForward;
	}

}
