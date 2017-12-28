package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.style.StyleDAO;
import com.iu.style.StyleDTO;

public class FavorInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String id=((MemberDTO)request.getSession().getAttribute("member")).getId();
		String method=request.getMethod();

		if(method.equals("POST")) {
			String page=request.getParameter("page");
			StyleDAO styleDAO=new StyleDAO();
			int count=0;
			int result=0;
			try {
				count=styleDAO.TotalCount();
				System.out.println(count);

				if(count>2) {
					request.setAttribute("message", "즐겨찾기는 최대 3개까지 가능합니다");
					request.setAttribute("path", "../favor/favorList.favor");
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}else {
					StyleDTO styleDTO=new StyleDTO();
					styleDTO.setId(id);
					styleDTO.setStore(request.getParameter("store"));
					result=styleDAO.insert(styleDTO);

					if(page.equals("view")) {
						if(result>0) {
							actionForward.setCheck(false);
							actionForward.setPath("../store/storeView.store?id="+id);
						}else {
							request.setAttribute("message", "추가 실패");
							request.setAttribute("path", "./storeView.store?id="+id);
							actionForward.setCheck(true);
							actionForward.setPath("../WEB-INF/view/common/result.jsp");
						}
					}else {
						if(result>0) {
							actionForward.setCheck(false);
							actionForward.setPath("./storeList.store");
						}else {
							request.setAttribute("message", "추가 실패");
							request.setAttribute("path", "./storeList.store");
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
			request.setAttribute("store", request.getParameter("store"));
			request.setAttribute("page", request.getParameter("page"));
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeFavorAjax.jsp");
		}

		return actionForward;
	}

}
