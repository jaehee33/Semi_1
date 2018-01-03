package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class FavorDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		String method=request.getMethod();
		String store_id=request.getParameter("store_id");

		int result=0;
		FavorDTO favorDTO=null;

		if(method.equals("POST")) {
			try {
				FavorDAO favorDAO = new FavorDAO();
				result=favorDAO.delete(store_id);
				favorDTO=favorDAO.selectOne(store_id);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			if(result>0 && favorDTO == null) {
				actionForward.setCheck(false);
				actionForward.setPath("../store/storeView.store?id="+store_id);
			}else {
				request.setAttribute("message", "삭제 실패");
				request.setAttribute("path", "../store/storeView.store?id="+store_id);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			request.setAttribute("store_id", store_id);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeFavorDelete.jsp");
		}

		return actionForward;
	}

}
