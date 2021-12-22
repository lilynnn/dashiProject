package com.dashi.entranceBoard.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.dashi.entranceBoard.model.service.EntranceService;
import com.dashi.entranceBoard.model.vo.Entrance;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EntranceInserController
 */
@WebServlet("/entinsert.ent")
public class EntranceInserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntranceInserController() {
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
		String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/entrance/");
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		Entrance e = new Entrance();
		e.setMemNo(multiRequest.getParameter("userNo"));
		e.setMemName(multiRequest.getParameter("userName"));
		e.setAnimalName(multiRequest.getParameter("petName"));
		e.setAnimalVariety(multiRequest.getParameter("petType"));
		e.setAnimalGender(multiRequest.getParameter("petGender"));
		e.setAnimalAge(Integer.parseInt(multiRequest.getParameter("petAge")));
		e.setAnimalVaccinated(multiRequest.getParameter("petVaccin"));
		e.setAnimalNeturalization(multiRequest.getParameter("neutral"));
		e.setAnimalDisease(multiRequest.getParameter("disease"));
		e.setAnimalIssue(multiRequest.getParameter("petIssue"));
		e.setEntWantDate(Date.valueOf(multiRequest.getParameter("wantDate")));
		e.setEntWantTime(multiRequest.getParameter("wantTime"));
		e.setReqPhone(multiRequest.getParameter("phone"));
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=1; i<=3; i++) {
			
			String key = "file" + i;
			
			if(multiRequest.getOriginalFileName(key) != null) {
				Attachment at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName(key));
				at.setChangeName(multiRequest.getFilesystemName(key));
				at.setPath("resources/thumbnail_upfiles/entrance");
				
				if(i == 1) { //대표이미지
					at.setAttachLevel(1);
				}else { // 상세이미지
					at.setAttachLevel(2);
				}
				list.add(at);
			
			}
			
		}
	
		
		int result = new EntranceService().insertEntrance(e, list);
		
		if(result > 0) {
			// 성공 => /jsp/list.th    url요청 => 목록페이지
			request.getSession().setAttribute("alertMsg", "입소신청이 완료되었습니다!");
			response.sendRedirect(request.getContextPath());				
		}else {
			request.getSession().setAttribute("alertMsg", "입소신청 실패");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
			
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
