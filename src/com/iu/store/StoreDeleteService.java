package com.iu.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.member.MemberDTO;

public class StoreDeleteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		StoreDAO storeDAO=new StoreDAO();
		FilesDAO filesDAO=new FilesDAO();
		String id=request.getParameter("id");
		StoreDTO storeDTO=null;
		int result=0;
		int result2=0;
		try {
			storeDTO=storeDAO.selectOne(id);
			result=storeDAO.delete(id);
			result2=filesDAO.storedelete(storeDTO.getStore());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			actionForward.setCheck(false);
			actionForward.setPath("../member/memberMyPage.member");
		}else {
			request.setAttribute("message", "delete fail");
			request.setAttribute("path", "../index.jsp");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		}else {
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			request.setAttribute("path", "../member/memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		
		return actionForward;
	}

}
