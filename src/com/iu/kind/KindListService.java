package com.iu.kind;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDTO;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;


public class KindListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		StoreDAO storeDAO=new StoreDAO();
		StoreDTO storeDTO=null;
		try {
			storeDTO = storeDAO.selectOne(memberDTO.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		KindDAO kindDAO=new KindDAO();
		ArrayList<KindDTO> ar= new ArrayList<>();
		try {
			ar=kindDAO.selectList(storeDTO.getStore());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ar!=null) {
			request.setAttribute("kindlist", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindListajax.jsp");
		}else {
			request.setAttribute("message", "kind Fail");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
