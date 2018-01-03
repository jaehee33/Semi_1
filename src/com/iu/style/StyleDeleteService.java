package com.iu.style;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StyleDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		String method=request.getMethod();
		String style=request.getParameter("style");

		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));			
		} catch (Exception e) {
			// TODO: handle exception
		}
		int result=0;
		StyleDTO styleDTO=null;

		if(method.equals("POST")) {
			try {
				StyleDAO styleDAO = new StyleDAO();
				result=styleDAO.delete(num);
				styleDTO=styleDAO.selectOne(num);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			if(result>0 && styleDTO == null) {
				actionForward.setCheck(false);
				actionForward.setPath("../kind/kindView.kind?num="+num+"&style="+style);
			}else {
				request.setAttribute("message", "삭제 실패");
				request.setAttribute("path", "../kind/kindView.kind?num="+num+"&style="+style);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {
			request.setAttribute("num",num);
			request.setAttribute("style", style);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindStyleDelete.jsp");
		}

		return actionForward;
	}

}
