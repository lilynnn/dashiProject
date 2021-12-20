package com.dashi.adoptBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminAdoptNoticeUpdateController
 */
@WebServlet("/adtupdate.ad")
public class AdminAdoptNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptNoticeUpdateController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/adoptNotice/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String boardNo = multiRequest.getParameter("boardNo");

			// notice 값 뽑아서 저장
			AdoptNotice notice = new AdoptNotice();
			notice.setAnlistNo(multiRequest.getParameter("boardNo"));
			notice.setAnTitle(multiRequest.getParameter("title"));
			notice.setAnContent(multiRequest.getParameter("content"));
			notice.setAnlistNo(multiRequest.getParameter("boardNo"));
			notice.setEntNo(multiRequest.getParameter("entNo"));

			// attach 뽑아서 저장
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i=1; i<4; i++) {
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이있다. => at생성
					Attachment at = new Attachment();
					
					// 기존에 존재하던 originFile값이 넘어올경우
					if(multiRequest.getParameter("originFileNo"+i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo"+i));
					} 
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("/resources/upfiles/adoptNotice/");
					at.setRefNo(boardNo);
					if(i == 1) {
						at.setAttachLevel(1);
					} else {
						at.setAttachLevel(2);
					}
					
					list.add(at);
				}
			}
			System.out.println("----------AdoptNoticeUpdateController----------");
			System.out.println("원래 담겨있던 첨부파일번호" + request.getParameter("originFileNo"));
			System.out.println("boardNo : " + boardNo);
			System.out.println("adoptNotice : " + notice);
			System.out.println("첨부파일 : " + list);
			System.out.println("--------------------------------");
			
			int result = new AdoptBoardService().updateAdoptNotice(notice, list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "입양공고 수정이 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/adlist.ad?cpage=1");
			} else {
				request.getSession().setAttribute("alertMsg", "입양공고 수정에 실패했습니다.");
				response.sendRedirect(request.getContextPath()+"/adtdetail.ad?adno="+boardNo);
			}
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
