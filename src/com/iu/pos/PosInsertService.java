package com.iu.pos;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.kind.KindDAO;
import com.iu.kind.KindDTO;
import com.iu.member.MemberDTO;

public class PosInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		PosDAO posDAO=new PosDAO();
		if(method.equals("GET")) {
			KindDAO kindDAO=new KindDAO();
			String store="";
			ArrayList<KindDTO> ar=null;
			try {
			store=request.getParameter("store");
			ar=kindDAO.selectList(store);
			}catch(Exception e) {
				
			}
			request.setAttribute("kindlist", ar);
			request.setAttribute("store", store);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/pos/posInsert.jsp");
		}else {
			int result=0;
			PosDTO posDTO=null;
			try {
				posDTO=new PosDTO();
				String store[]=request.getParameterValues("store");
				String pos_import[]=request.getParameterValues("pos_import");
				String expend[]=request.getParameterValues("expend");
				String kind[]=request.getParameterValues("kind");
				
				
				
				for(int i=0;i<store.length;i++) {
				int num=posDAO.getNum();
				posDTO.setStore(store[i]);
				posDTO.setNum(num);
				posDTO.setPos_import(Integer.parseInt(pos_import[i]));
				posDTO.setKind(kind[i]);
				posDTO.setExpend(Integer.parseInt(expend[i]));
				try {
					result=posDAO.insert(posDTO);
				} catch (Exception e) {
					
				}
				
				}
			
			}catch (Exception e) {
			}
			if(result>0) {
				request.setAttribute("store", posDTO.getStore());
				actionForward.setCheck(true);
				actionForward.setPath("./posIndex.pos");
			}else {
				request.setAttribute("message", "insert Fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
			
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
