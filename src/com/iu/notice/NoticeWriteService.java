package com.iu.notice;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method=request.getMethod();
		if(method.equals("POST")) {
			NoticeDAO noticeDAO = new NoticeDAO();
			NoticeDTO noticeDTO = new NoticeDTO();
			String filePath = request.getServletContext().getRealPath("upload");
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			int maxSize=1024*1024*10;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				noticeDTO.setId(multi.getParameter("id"));
				noticeDTO.setTitle(multi.getParameter("title"));
				noticeDTO.setContents(multi.getParameter("contents"));
				System.out.println("저장된 경로 : "+filePath);
				Enumeration<Object> names=multi.getFileNames();
				while(names.hasMoreElements()) {
					String name=(String)names.nextElement();
					String fileName = multi.getFilesystemName(name);
					String oriName = multi.getOriginalFileName(name);
					System.out.println("fileName :"+fileName);
					System.out.println("oriName : "+oriName);
				}
				
			} catch (IOException e2) {
				e2.printStackTrace();
			}
			
			int num=0;
			try {
				num = noticeDAO.getNum();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			noticeDTO.setNum(num);
			
			int result=0;
			try {
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
