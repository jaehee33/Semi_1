package com.iu.store;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.member.MemberDAO;
import com.sun.swing.internal.plaf.metal.resources.metal;

public class StoreJoinService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		StoreDTO memberDTO = new StoreDTO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setBirth(Date.valueOf(request.getParameter("birth")));
		memberDTO.setPhone(request.getParameter("phone"));
		memberDTO.setJob(request.getParameter("job"));
		memberDTO.setStore(request.getParameter("store"));
		memberDTO.setArea(request.getParameter("area"));
		memberDTO.setStoretel(request.getParameter("storetel"));
		memberDTO.setHoliday(request.getParameter("holiday"));
		MemberDAO memberDAO = new MemberDAO();
		StoreDAO storeDAO = new StoreDAO();
		int result=0;
		try {
			result=memberDAO.join(memberDTO);
			result=storeDAO.join(memberDTO);
		} catch (Exception e) {
			actionForward.setCheck(false);
			actionForward.setPath("../index.jsp");
		}
		return actionForward;
	}

}
