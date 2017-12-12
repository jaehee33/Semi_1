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
			String filePath = request.getServletContext().getRealPath("upload");
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			int maxSize=1024*1024*10;
			
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				faqDTO.setId(multi.getParameter("id"));
				faqDTO.setContents(multi.getParameter("contents"));
				faqDTO.setTitle(multi.getParameter("title"));
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
