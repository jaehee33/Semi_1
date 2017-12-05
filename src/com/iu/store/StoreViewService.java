package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;

public class StoreViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		StoreDAO storeDAO=new StoreDAO();
		MemberDTO memberDTO=((MemberDTO)request.getSession().getAttribute("member"));
		StoreDTO storeDTO=null;
		try {
			storeDTO=storeDAO.selectOne(memberDTO.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(storeDTO==null) {
			request.setAttribute("message", "정보가 없습니다.");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}else {
			request.setAttribute("store", storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeView.jsp");
		}
		
		
		return actionForward;
	}

}
