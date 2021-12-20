package com.dashi.adoptBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
			
			String boardNo = request.getParameter("boardNo");
			
			System.out.println(boardNo);
			// notice 값 뽑아서 저장
			AdoptNotice notice = new AdoptNotice();
			notice.setAnTitle(request.getParameter("title"));
			notice.setAnContent(request.getParameter("content"));
			notice.setAnlistNo(request.getParameter("boardNo"));
			System.out.println(notice);
			// attach 뽑아서 저장
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i=1; i<4; i++) {
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이있다. => at생성
					Attachment at = new Attachment();
					if(multiRequest.getParameter("originFileNo"+i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo"+i));
					} else {
						at.setRefNo(boardNo);
					}
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("/resources/upfiles/adoptNotice/");
					
					if(i == 1) {
						at.setAttachLevel(1);
					} else {
						at.setAttachLevel(2);
					}
					
					list.add(at);
				}
			}
			
			System.out.println(list);
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
