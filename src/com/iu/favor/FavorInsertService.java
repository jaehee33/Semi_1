package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class FavorInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		FavorDTO favorDTO = new FavorDTO();
		favorDTO.setId(request.getParameter("id"));
		favorDTO.setFav_store(request.getParameter("fav_store"));
		favorDTO.setCount(Integer.parseInt(request.getParameter("count")));
		
		int result=0;
		FavorDAO favorDAO = new FavorDAO();
		try {
			result=favorDAO.insert(favorDTO);
		} catch (Exception e) {
		}
		
		if(result>0) {
			request.setAttribute("favor", favorDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/favor/favorList.jsp");
		}else {
			request.setAttribute("message", "favor fail");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
			
		}
	
		return actionForward;
	}

}
