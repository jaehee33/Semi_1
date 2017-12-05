package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class StoreWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		
		if(method.equals("GET")) {
			actionForward.setCheck(true);
			System.out.println("djksdfhkdfdkfsdkfskjs");
			actionForward.setPath("../WEB-INF/view/store/storeWrite.jsp");
		}else {
			String id=((MemberDTO)request.getSession().getAttribute("member")).getId();
			StoreDTO storeDTO=new StoreDTO();
			storeDTO.setArea(request.getParameter("area"));
			storeDTO.setHoliday(request.getParameter("holiday"));
			storeDTO.setStoretel(request.getParameter("storetel"));
			storeDTO.setStore(request.getParameter("store"));
			storeDTO.setId(id);
			StoreDAO storeDAO=new StoreDAO();
			int result=0;
			try {
				result=storeDAO.insert(storeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "store Fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
		}
		
		return actionForward;
	}

}
