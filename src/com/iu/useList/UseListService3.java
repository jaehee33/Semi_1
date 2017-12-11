package com.iu.useList;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class UseListService3 implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		UseListDAO useListDAO = new UseListDAO();
		
		ArrayList<UseListDTO>= useListDAO.selectList2(bookDTO);
		return actionForward;
	}

}
