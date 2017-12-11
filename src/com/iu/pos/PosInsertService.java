package com.iu.pos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Store;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.store.StoreDAO;

public class PosInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		PosDAO posDAO=new PosDAO();
		if(method.equals("GET")) {
			String store="";
			try {
			store=request.getParameter("store");
			}catch(Exception e) {
				
			}
			request.setAttribute("sname", store);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/pos/posInsert.jsp");
		}else {
			PosDTO posDTO=null;
			try {
				posDTO=new PosDTO();
				int pos_import=Integer.parseInt(request.getParameter("pos_import"));
				int totalMoney=posDAO.getTotalMoney();
				posDTO.setStore(request.getParameter("store"));
				posDTO.setPos_import(pos_import);
				posDTO.setKind(request.getParameter("kind"));
				posDTO.setTotal(totalMoney+pos_import);
			
			}catch (Exception e) {
				// TODO: handle exception
			}
			int result=0;
			try {
				result=posDAO.insert(posDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		
		return actionForward;
	}

}
