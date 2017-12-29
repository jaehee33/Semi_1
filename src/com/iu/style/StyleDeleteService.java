package com.iu.style;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class StyleDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String style=request.getParameter("style");
		
		int num=0;
		int result=0;
		StyleDTO styleDTO=null;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			System.out.println("파라미터로 받아온 num : "+num);
			StyleDAO styleDAO = new StyleDAO();
			result=styleDAO.delete(num);
			styleDTO=styleDAO.selectOne(num);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(result>0 && styleDTO != null) {
			request.setAttribute("style", styleDTO);
			request.setAttribute("message", "즐겨찾기에서 삭제되었습니다.");
		}else {
			request.setAttribute("message", "삭제 실패");
		}
		request.setAttribute("path", "../kind/kindView.kind?num="+num+"&style="+style);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/view/common/result.jsp");
		
		return actionForward;
	}

}
