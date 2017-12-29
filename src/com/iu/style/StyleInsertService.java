package com.iu.style;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class StyleInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		String id=((MemberDTO)request.getSession().getAttribute("member")).getId();
		String method=request.getMethod();
		int num=0;
		int price=0;
		try {
		num=Integer.parseInt(request.getParameter("num"));
		price=Integer.parseInt(request.getParameter("price"));
		}catch (Exception e) {
		}

		if(method.equals("POST")) {
			String page=request.getParameter("page");
			StyleDAO styleDAO=new StyleDAO();
			int count=0;
			int result=0;
			try {
				count=styleDAO.TotalCount();

				if(count>3) {
					request.setAttribute("message", "즐겨찾기는 최대 3개까지 가능합니다");
					request.setAttribute("path", "../favor/favorStyle.jsp");
				}
				else {
					StyleDTO styleDTO=new StyleDTO();
					styleDTO.setId(id);
					styleDTO.setStyle(request.getParameter("style"));
					styleDTO.setPrice(Integer.parseInt(request.getParameter("price")));
					styleDTO.setStore(request.getParameter("store"));
					result=styleDAO.insert(styleDTO);
					
					if(page.equals("view")) {
						if(result>0) {
							actionForward.setCheck(false);
							actionForward.setPath("../kind/kindView.kind?num="+num);
						}else {
							request.setAttribute("message", "추가 실패");
							request.setAttribute("path", "./kindView.kind?num="+num);
							actionForward.setCheck(true);
							actionForward.setPath("../WEB-INF/view/common/result.jsp");
						}
					}else {
						if(result>0) {
							actionForward.setCheck(false);
							actionForward.setPath("./kindFList.kind");
						}else {
							request.setAttribute("message", "추가 실패");
							request.setAttribute("path", "./kinFList.kind");
							actionForward.setCheck(true);
							actionForward.setPath("../WEB-INF/view/common/result.jsp");
						}
					}					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			request.setAttribute("num",num);
			request.setAttribute("style", request.getParameter("style"));
			request.setAttribute("price",price);
			request.setAttribute("store", request.getParameter("store"));
			request.setAttribute("page", request.getParameter("page"));
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindFavorAjax.jsp");
		}

		return actionForward;
	}

}
