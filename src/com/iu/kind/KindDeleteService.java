package com.iu.kind;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;

public class KindDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		KindDAO kindDAO=new KindDAO();
		FilesDAO filesDAO=new FilesDAO();
		int result=0;
		int result2=0;
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			result=kindDAO.delete(num);
			result2=filesDAO.delete(num);
		}catch(Exception e) {
			
		}
		if(result>0 && result2>0) {
			actionForward.setPath("./kindIndex.kind");
		}else {
			request.setAttribute("message", "delete fail");
			request.setAttribute("path", "./kindIndex.kind");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
			
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
