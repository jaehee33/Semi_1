package com.iu.favor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class FavorInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String id=((MemberDTO)request.getSession().getAttribute("member")).getId();
		String method=request.getMethod();
		String store_id=request.getParameter("store_id");

		if(method.equals("POST")) {
			FavorDAO favorDAO=new FavorDAO();
			int count=0;
			int result=0;
			try {
				count=favorDAO.TotalCount();

				if(count>4) {
					request.setAttribute("message", "즐겨찾기는 최대 5개까지 가능합니다");
					request.setAttribute("path", "../store/storeView.store?id="+store_id);
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}else {
					FavorDTO favorDTO=new FavorDTO();
					favorDTO.setId(id);
					favorDTO.setStore(request.getParameter("store"));
					favorDTO.setStore_id(store_id);
					result=favorDAO.insert(favorDTO);

					if(result>0) {
						actionForward.setCheck(false);
						actionForward.setPath("../store/storeView.store?id="+store_id);
					}else {
						request.setAttribute("message", "추가 실패");
						request.setAttribute("path", "../store/storeView.store?id="+store_id);
						actionForward.setCheck(true);
						actionForward.setPath("../WEB-INF/view/common/result.jsp");
					}					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else {
			request.setAttribute("store_id", store_id);
			request.setAttribute("store", request.getParameter("store"));
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeFavorInsert.jsp");
		}

		return actionForward;
	}

}
