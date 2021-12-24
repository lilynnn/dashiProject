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
			
			String arlistNo = multiRequest.getParameter("arno");
			
			AdoptReview ar = new AdoptReview();
			ar.setArlistNo(multiRequest.getParameter("arlistNo"));
			ar.setMemNo(Integer.parseInt(multiRequest.getParameter("userNo")));
			ar.setMemId(multiRequest.getParameter("userId"));
			ar.setNickname(multiRequest.getParameter("nickname"));
			ar.setAnType(multiRequest.getParameter("animal"));
			ar.setArTitle(multiRequest.getParameter("title"));
			ar.setArContent(multiRequest.getParameter("content"));
			
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i=1; i<=5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 넘어온파일있을경우
					Attachment at = new Attachment();
					
					//첨부파일 있을 경우
					if(multiRequest.getParameter("originFileNo"+i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo"+i));
					}
					
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptReview/");	
					at.setRefNo(arlistNo);
					
					if(i == 1) { // 대표이미지일 경우
						at.setAttachLevel(1);
					}else { // 상세이미지일 경우
						at.setAttachLevel(2);
					}
					list.add(at);
				}
			}
			
			System.out.println("----------AdoptNoticeUpdateController----------");
			System.out.println("원래 담겨있던 첨부파일번호" + request.getParameter("originFileNo"));
			System.out.println("boardNo : " + arlistNo);
			System.out.println("adoptNotice : " + ar);
			System.out.println("첨부파일 : " + list);
			System.out.println("--------------------------------");
			
			int result = new AdoptReviewBoardService().updateReview(ar, list);
			
			if(result > 0) { // 성공 => /loveagain/list.ar 	url요청 => 목록페이지
				
				request.getSession().setAttribute("alertMsg", "성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.ar?cpage=1");
				
			}else { // 실패 => 해당 글 상세페이지
				request.getSession().setAttribute("alertMsg", "입양후기 수정 실패");
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
