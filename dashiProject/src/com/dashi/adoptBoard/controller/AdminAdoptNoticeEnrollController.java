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
 * Servlet implementation class AdminAdoptNoticeEnrollController
 */
@WebServlet("/adtenroll.ad")
public class AdminAdoptNoticeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptNoticeEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/upfiles/adoptNotice/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			AdoptNotice adt = new AdoptNotice(multiRequest.getParameter("title"),
											  multiRequest.getParameter("content"),
											  multiRequest.getParameter("entNo"));
			
			ArrayList<Attachment> list = new ArrayList<>();

			for(int i=1; i<4; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptNotice/");
					
					if(multiRequest.getParameter("originFileNo") != null){
						at.setAttachNo(multiRequest.getParameter("originFileNo"));
					} 
					
					if(i==1) {
						at.setAttachLevel(1);
					} else {
						at.setAttachLevel(2);
					}
					
					list.add(at);
				}
			}
			System.out.println("controller adtlist : "+list);

			int result = new AdoptBoardService().insertAdoptNotice(adt, list);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "입양공고등록에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/adtdetail.ad");
			} else {
				request.getSession().setAttribute("alertMsg", "입양공고등록에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/anlist.ad?cpage=1");
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
