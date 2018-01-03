package com.iu.favor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.style.StyleDAO;
import com.iu.style.StyleDTO;

public class FavorListService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		FavorDAO favorDAO = new FavorDAO();
		FilesDAO filesDAO = new FilesDAO();

		ArrayList<FavorDTO> list = null;
		ArrayList<FilesDTO> ar = null;
		try {
			list=(ArrayList<FavorDTO>) favorDAO.selectList();
			ar=filesDAO.selectList();
		} catch (Exception e) {
			// TODO: handle exception
		}

		if(list != null && ar != null) {
			request.setAttribute("files", ar);
			request.setAttribute("list", list);
			actionForward.setPath("../WEB-INF/view/favor/favorStore.jsp");
		}else {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../member/memberMyPage.member");
			actionForward.setPath("../WEB-INF/view/common/result.jsp");
		}
		actionForward.setCheck(true);

		return actionForward;
	}
}
