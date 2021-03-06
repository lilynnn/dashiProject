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
import com.dashi.animalListBoard.model.vo.Animal;
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
			
			// animal info
			Animal an = new Animal();
			an.setAnimalType(multiRequest.getParameter("animalType"));
			an.setAnimalName(multiRequest.getParameter("animalName"));
			an.setAnimalAge(Integer.parseInt(multiRequest.getParameter("animalAge")));
			an.setAnimalGender(multiRequest.getParameter("animalGender"));
			an.setAnimalVaccin(multiRequest.getParameter("animalVaccin"));
			an.setAnimalNeutral(multiRequest.getParameter("animalNeutral"));
			an.setAnimalDisease(multiRequest.getParameter("animalDisease"));
			an.setAnimalIssue(multiRequest.getParameter("animalIssue"));
			an.setEntNo(multiRequest.getParameter("entNo"));
			
			// adopt notice
			AdoptNotice notice = new AdoptNotice();
			notice.setAnlistNo(multiRequest.getParameter("boardNo"));
			notice.setAnTitle(multiRequest.getParameter("title"));
			notice.setAnContent(multiRequest.getParameter("content"));
			notice.setEntNo(multiRequest.getParameter("entNo"));

			// attach 
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			Attachment at = null;
			for(int i=1; i<4; i++) {
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					at = new Attachment();
					
					// ????????? ???????????? originFile???
					if(multiRequest.getParameter("originFileNo"+i) != null) {
						at.setAttachNo(multiRequest.getParameter("originFileNo"+i));
					} 
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setPath("resources/upfiles/adoptNotice/");
					at.setRefNo(boardNo);
					if(i == 1) {
						at.setAttachLevel(1);
					} else {
						at.setAttachLevel(2);
					}					
					list.add(at);
				}
			}
			int result1 = new AdoptBoardService().updateAnimalInfo(an);
			int result2 = new AdoptBoardService().updateAdoptNotice(notice, list);
			
			if(result1 * result2 >0) {
				request.getSession().setAttribute("alertMsg", "???????????? ????????? ?????????????????????.");
				response.sendRedirect(request.getContextPath()+"/adlist.ad?cpage=1");
			} else {
				request.getSession().setAttribute("alertMsg", "???????????? ????????? ??????????????????.");
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
