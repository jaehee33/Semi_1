package com.iu.kind;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.iu.member.MemberDTO;
import com.iu.store.StoreDAO;
import com.iu.store.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class KindInsertService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String method=request.getMethod();
		MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
		if(memberDTO!=null) {
		if(method.equals("POST")) {
			StoreDAO storeDAO=new StoreDAO();
			StoreDTO storeDTO=null;

			try {
				storeDTO = storeDAO.selectOne(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String filePath=request.getServletContext().getRealPath("upload");
			File file=new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			KindDAO kindDAO=new KindDAO();
			FilesDAO filesDAO=new FilesDAO();
			
			int maxSize=1024*1024*10;
			int result=0;
			int result2=0;
			try {
				MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				String[] style=multi.getParameterValues("style");
				String[] price=multi.getParameterValues("price");
				String[] kind=multi.getParameterValues("kind");
				String[] gender=multi.getParameterValues("gender");
				
				for(int i=0;i<style.length;i++) {
					KindDTO kindDTO=new KindDTO();
					int num=0;
					try {
						num=kindDAO.getNum();
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					kindDTO.setNum(num);
					kindDTO.setStyle(style[i]);
					kindDTO.setPrice(Integer.parseInt(price[i]));
					kindDTO.setStore(storeDTO.getStore());
					kindDTO.setKind(kind[i]);
					kindDTO.setGender(gender[i]);
					FilesDTO filesDTO=new FilesDTO();
					filesDTO.setFname(multi.getFilesystemName("f"+i));
					filesDTO.setOname(multi.getOriginalFileName("f"+i));
					filesDTO.setNum(num);
					result=0;
					result2=0;
					try {
						result=kindDAO.insert(kindDTO);
						result2=filesDAO.insert(filesDTO);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(result<0) {
						break;
					}
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if(result>0 && result2>0) {
				actionForward.setCheck(true);
				actionForward.setPath("./kindIndex.kind?id="+storeDTO.getId());
			}else {
				request.setAttribute("message", "kind fail");
				request.setAttribute("path", "../index.jsp");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/common/result.jsp");
			}
		}else {

			StoreDAO storeDAO=new StoreDAO();
			StoreDTO storeDTO=null;
			try {
				storeDTO = storeDAO.selectOne(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("store",storeDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/kind/kindInsertForm.jsp");
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
