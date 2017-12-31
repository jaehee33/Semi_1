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

public class StroeUpdateService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		MemberDTO memberDTO=(MemberDTO)(request.getSession().getAttribute("member"));
		if(memberDTO!=null) {
		String method=request.getMethod();
		StoreDAO storeDAO=new StoreDAO();
		String id="";
		try {
		id=request.getParameter("id");
		}catch (Exception e){
			
		}
		if(method.equals("GET")) {
			StoreDTO storeDTO=null;
			try {
				storeDTO = storeDAO.selectOne(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("store", storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/store/storeUpdate.jsp");
		}else {
			FilesDTO filesDTO=null;
			FilesDAO filesDAO=new FilesDAO();
			String storeid="";
			String filePath=request.getServletContext().getRealPath("upload");
			File file=new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			int maxSize=1024*1024*10;
			int result=0;
			int result2=0;
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				StoreDTO storeDTO=new StoreDTO();
				storeid=multi.getParameter("id");
				storeDTO.setArea(multi.getParameter("area"));
				storeDTO.setHoliday(multi.getParameter("holiday"));
				storeDTO.setStore(multi.getParameter("store"));
				storeDTO.setStoretel(multi.getParameter("storetel"));
				storeDTO.setId(storeid);
				result2=filesDAO.storedelete(storeDTO.getStore());
				
				filesDTO=new FilesDTO();
				filesDTO.setFname(multi.getFilesystemName("file"));
				filesDTO.setStore(storeDTO.getStore());
				filesDTO.setOname(multi.getOriginalFileName("file"));
				result2=filesDAO.insert(filesDTO);
				result=storeDAO.update(storeDTO);
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			if(result>0 && result2>0) {
				actionForward.setCheck(false);
				actionForward.setPath("./storeView.store?id="+storeid);
			}else {
				request.setAttribute("message", "update Fail");
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
