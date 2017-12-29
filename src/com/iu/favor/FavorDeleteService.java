package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class FavorDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String store_id=request.getParameter("store_id");
		int result=0;
		try {
			FavorDAO favorDAO = new FavorDAO();
			result=favorDAO.delete(store_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(result>0) {
			request.setAttribute("message", "즐겨찾기에서 삭제되었습니다.");
		}else {
			request.setAttribute("message", "삭제 실패");
		}
		request.setAttribute("path", "../store/storeView.store?&id="+store_id);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		
		return actionForward;
	}

}
