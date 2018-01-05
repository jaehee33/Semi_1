package com.iu.notice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;

public class NoticeWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticeDTO = new NoticeDTO();
			
			int num=0;
			try {
				num = noticeDAO.getNum();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			noticeDTO.setNum(num);
			
			int result=0;
			try {
				noticeDTO.setId(request.getParameter("id"));
				noticeDTO.setContents(request.getParameter("contents"));
				noticeDTO.setTitle(request.getParameter("title"));
				result=noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./noticeList.notice");
			}else {
				request.setAttribute("message", "Fail");
				request.setAttribute("path", "./noticeList.notice");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
			
		}else {
			request.setAttribute("board", "notice");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardWrite.jsp");
		}
		
		return actionForward;
	}

}
