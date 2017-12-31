package com.iu.store;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.member.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoreWriteService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		String method=request.getMethod();

		if(method.equals("GET")) {
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeWrite.jsp");
		}else {
			String id=((MemberDTO)request.getSession().getAttribute("member")).getId();
			StoreDTO storeDTO=null;
			FilesDTO filesDTO=null;

			String filePath=request.getServletContext().getRealPath("upload");
			File file=new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			FilesDAO filesDAO=new FilesDAO();

			int maxSize=1024*1024*10;
			int result=0;
			int result2=0;

			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				storeDTO=new StoreDTO();
				storeDTO.setArea(multi.getParameter("area"));
				storeDTO.setHoliday(multi.getParameter("holiday"));
				storeDTO.setStoretel(multi.getParameter("storetel"));
				storeDTO.setStore(multi.getParameter("store"));
				storeDTO.setId(id);
				filesDTO=new FilesDTO();
				filesDTO.setFname(multi.getFilesystemName("file"));
				filesDTO.setStore(storeDTO.getStore());
				filesDTO.setOname(multi.getOriginalFileName("file"));
			}catch(Exception e) {

			}
			StoreDAO storeDAO=new StoreDAO();
			try {
				result=storeDAO.insert(storeDTO);
				result2=filesDAO.insert(filesDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0) {
				actionForward.setCheck(false);
				actionForward.setPath("../index.jsp");
			}else {
				request.setAttribute("message", "store Fail");
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
