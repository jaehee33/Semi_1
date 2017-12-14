package com.iu.member;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.kind.KindDAO;
import com.iu.kind.KindDTO;
import com.iu.kind.KindFListService;


public class MemberStyleService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ArrayList<KindDTO> kindDTO = new ArrayList<>();
		KindDAO kindDAO = new KindDAO();
		
		try {
			kindDTO = kindDAO.allselectList();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ArrayList<FilesDTO> ar2=new ArrayList<>();
		FilesDAO filesDAO = new FilesDAO();
		
		try {
			ar2 = filesDAO.selectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(kindDTO != null) {
			request.setAttribute("file", ar2);
			actionForward.setCheck(false);
			actionForward.setPath("./memberStyle.member");
		}else {
			request.setAttribute("message", "fail");
			request.setAttribute("path", "./memberLogin.member");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
	
		return actionForward;
	}

}
