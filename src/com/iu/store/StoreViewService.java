package com.iu.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.member.MemberDTO;

public class StoreViewService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		StoreDAO storeDAO=new StoreDAO();
		ArrayList<FilesDTO> ar=null;
		FilesDAO filesDAO=new FilesDAO();
		String id="";
		StoreDTO storeDTO=null;
		try {
			id=request.getParameter("id");
			storeDTO=storeDAO.selectOne(id);
			ar=filesDAO.selectList();
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
			request.setAttribute("filelist", ar);
			request.setAttribute("store", storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeView.jsp");
		}
		
		
		return actionForward;
	}

}
