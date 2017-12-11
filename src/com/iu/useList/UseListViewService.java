package com.iu.useList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class UseListViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward= new ActionForward();
		
		int num=0;
		try {
		num=Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
		}
		
		UseListDAO useListDAO = new UseListDAO();
		UseListDTO useListDTO = null;
		
		try {
			useListDTO = useListDAO.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(useListDTO != null) {
			
			request.setAttribute("view", useListDTO);
			actionForward.setPath("../WEB-INF/view/useList/useListView.jsp");
		}else {
			request.setAttribute("message", "fail");
			request.setAttribute("path", "../member/memberMyPage.member");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
