package com.dashi.adoptReviewBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.adoptReviewBoard.model.service.AdoptReviewBoardService;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdoptReviewUpdateController
 */
@WebServlet("/update.ar")
public class AdoptReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/adoptReview/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			AdoptReview ar = new AdoptReview();
			String arlistNo = multiRequest.getParameter("arno");
			ar.setArlistNo(multiRequest.getParameter("arno"));
			ar.setMemNo(Integer.parseInt(multiRequest.getParameter("userNo")));
			ar.setMemId(multiRequest.getParameter("userId"));
			ar.setNickname(multiRequest.getParameter("nickname"));
			ar.setAnType(multiRequest.getParameter("animal"));
			ar.setArTitle(multiRequest.getParameter("title"));
			ar.setArContent(multiRequest.getParameter("content"));
			
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			Attachment at = null;
			
			for(int i=1; i<=5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// ???????????????????????????
					at = new Attachment();
					
					//???????????? ?????? ??????
					if(multiRequest.getParameter("originFileNo"+i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo"+i));
					}
					
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptReview/");	
					at.setRefNo(arlistNo);
					
					if(i == 1) { // ?????????????????? ??????
						at.setAttachLevel(1);
					}else { // ?????????????????? ??????
						at.setAttachLevel(2);
					}
					list.add(at);
				}
			}
			
			System.out.println("----------AdoptReviewUpdateController----------");
			System.out.println("?????? ???????????? ??????????????????" + request.getParameter("originFileNo"));
			System.out.println("boardNo : " + arlistNo);
			System.out.println("adoptNotice : " + ar);
			System.out.println("???????????? : " + list);
			System.out.println("--------------------------------");
			
			int result = new AdoptReviewBoardService().updateReview(ar, list);
			
			if(result > 0) { // ?????? => /loveagain/list.ar 	url?????? => ???????????????
				
				request.getSession().setAttribute("alertMsg", "??????????????? ?????????????????????.");
				response.sendRedirect(request.getContextPath() + "/list.ar?cpage=1");
				
			}else { // ?????? => ?????? ??? ???????????????
				request.getSession().setAttribute("alertMsg", "???????????? ?????? ??????");
				response.sendRedirect(request.getContextPath() + "/detail.ar?arno="+arlistNo);
			}
			System.out.println("controller: " + result);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
