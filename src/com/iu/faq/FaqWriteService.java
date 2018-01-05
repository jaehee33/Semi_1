package com.iu.faq;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FaqWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();//GET, POST
		if(method.equals("POST")) {
			FaqDAO faqDAO = new FaqDAO();
			FaqDTO faqDTO = new FaqDTO();
			
			try {
		
				faqDTO.setId(request.getParameter("id"));
				faqDTO.setContents(request.getParameter("contents"));
				faqDTO.setTitle(request.getParameter("title"));
				
				
				
			} catch (Exception e2) { 
			}
			
			int num=0;
			try {
				num = faqDAO.getNum();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			faqDTO.setNum(num);
			int result=0;
			try {
				result=faqDAO.insert(faqDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./faqList.faq");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./faqList.faq");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
				
			}
		}else {
			request.setAttribute("board", "faq");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}
		
		return actionForward;
	}

}
