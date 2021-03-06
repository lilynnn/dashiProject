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
public class EntranceInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntranceInsertController() {
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
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/entrance/");
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		Entrance e = new Entrance();
		e.setMemNo(multiRequest.getParameter("userNo"));
		e.setMemName(multiRequest.getParameter("userName"));
		e.setEntTitle(multiRequest.getParameter("title"));
		e.setAnimalName(multiRequest.getParameter("petName"));
		e.setAnimalType(multiRequest.getParameter("petType"));
		e.setAnimalVariety(multiRequest.getParameter("petVariety"));
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
				at.setPath("resources/upfiles/entrance/");
				
				if(i == 1) { //???????????????
					at.setAttachLevel(1);
				}else { // ???????????????
					at.setAttachLevel(2);
				}
				list.add(at);
			
			}
			
		}
		
		int result = new EntranceService().insertEntrance(e, list);
		
		if(result > 0) {
			// ?????? => /jsp/list.th    url?????? => ???????????????
			request.getSession().setAttribute("alertMsg", "??????????????? ?????????????????????!");
			response.sendRedirect(request.getContextPath() + "/home");				
		}else {
			request.getSession().setAttribute("alertMsg", "???????????? ??????");
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
