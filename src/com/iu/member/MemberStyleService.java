package com.iu.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.Action;
import com.iu.action.ActionForward;
import com.iu.files.FilesDAO;
import com.iu.files.FilesDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberStyleService implements Action {

	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
			
			String method = request.getMethod(); //get, post 구분
			if(method.equals("POST")) {
				MemberDTO memberDTO = new MemberDTO();
				MemberDAO memberDAO = new MemberDAO();
				String filePath=request.getServletContext().getRealPath("upload");
				
				File file = new File(filePath);
				if(!file.exists()) {
					file.mkdirs();
				}
				int maxSize=1024*1024*10;  //10MB
				String fileName = null;
				String oriName = null;
				try {
					MultipartRequest multi=new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
					
					Enumeration<Object> names=multi.getFileNames(); //몇개인지 모르는 parameter names 가져오는거
					while(names.hasMoreElements()) {
						String name=(String)names.nextElement();
					
					fileName=multi.getFilesystemName(name);   //파일의 실제이름
					oriName =multi.getOriginalFileName(name); //올릴때 이름
					System.out.println("저장된 경로: "+filePath);
					System.out.println("파일실제이름: "+fileName);
					System.out.println("내가올릴때이름: "+oriName);
					}
				} catch (IOException e2) {
				}
				String id="";
				try {
					id=request.getParameter("id");
					memberDTO=memberDAO.selectOne(id);
					System.out.println(id);
				} catch (Exception e1) {
				}
				memberDTO.setId(id);
				
				int result=0;
				try {
					result=memberDAO.join(memberDTO);
					System.out.println(result);
				} catch (Exception e) {
				}
				
				if(result>0) {
					request.setAttribute("fileName", fileName);
					request.setAttribute("oriName", oriName);
					actionForward.setCheck(true); //true가 forward방식
					actionForward.setPath("./memberMyPage.member");
				}else {
					request.setAttribute("message", "style fail");
					request.setAttribute("path", "./memberMyPage.member");
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
				}
				//insert
			}else {
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/view/member/memberStyle.jsp");
			}
			return actionForward;
		}

	}
