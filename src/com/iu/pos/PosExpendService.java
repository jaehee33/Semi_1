package com.iu.pos;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.iu.action.Action;
import com.iu.action.ActionForward;

public class PosExpendService implements Action {

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
			actionForward.setPath("../WEB-INF/view/pos/posExpend.jsp");
		}else {
			PosDTO posDTO=null;
			try {
				posDTO=new PosDTO();
				int expend=Integer.parseInt(request.getParameter("expend"));
				int totalMoney=posDAO.getTotalMoney();
				posDTO.setStore(request.getParameter("store"));
				posDTO.setExpend(expend);
				posDTO.setKind(request.getParameter("kind"));
				posDTO.setTotal(totalMoney-expend);
			
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
