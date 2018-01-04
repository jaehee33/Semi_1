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
		String style=request.getParameter("style");
		String store=request.getParameter("store");
		String store_id=request.getParameter("store_id");
		
		try {
			num=Integer.parseInt(request.getParameter("num"));
			price=Integer.parseInt(request.getParameter("price"));
		}catch (Exception e) {
		}

		
		if(method.equals("POST")) {
			StyleDAO styleDAO=new StyleDAO();
			int count=0;
			int result=0;
			try {
				count=styleDAO.TotalCount();

				if(count>4) {
					request.setAttribute("message", "즐겨찾기는 최대 5개까지 가능합니다");
					request.setAttribute("path", "../kind/kindView.kind?num="+num+"&style="+style);
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}else {
					StyleDTO styleDTO=new StyleDTO();
					styleDTO.setId(id);
					styleDTO.setNum(num);
					styleDTO.setStyle(style);
					styleDTO.setPrice(Integer.parseInt(request.getParameter("price")));
					styleDTO.setStore(store);
					styleDTO.setStore_id(store_id);
					result=styleDAO.insert(styleDTO);

					if(result>0) {
						actionForward.setCheck(false);
						actionForward.setPath("../kind/kindView.kind?num="+num+"&style="+style);
					}else {
						request.setAttribute("message", "추가 실패");
						request.setAttribute("path", "../kind/kindView.kind?num="+num+"&style="+style);
						actionForward.setCheck(true);
						actionForward.setPath("../WEB-INF/view/common/result.jsp");
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else {
			request.setAttribute("num",num);
			request.setAttribute("style", style);
			request.setAttribute("price",price);
			request.setAttribute("store", store);
			request.setAttribute("store_id", store_id);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindStyleInsert.jsp");
		}

		return actionForward;
	}

}
