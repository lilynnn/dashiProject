package com.dashi.entranceBoard.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.dashi.entranceBoard.model.service.EntranceService;
import com.dashi.entranceBoard.model.vo.Entrance;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EntranceUpdateffController
 */
@WebServlet("/update.ent")
public class EntranceUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntranceUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int maxSize = 10 * 1024 * 1024;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/entrance/");
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		// 공통적으로 입소테이블에 update
		String eno = multiRequest.getParameter("eno");
		String title = multiRequest.getParameter("title");
		String userName = multiRequest.getParameter("userName");
		String petName = multiRequest.getParameter("petName");
		String petType = multiRequest.getParameter("category");
		String petVariety = multiRequest.getParameter("petVariety");
		int petAge = Integer.parseInt(multiRequest.getParameter("petAge"));
		String petGender = multiRequest.getParameter("petGender");
		String petVaccin = multiRequest.getParameter("petVaccin");
		String neutral = multiRequest.getParameter("neutral");
		String disease = multiRequest.getParameter("disease");
		String petIssue = multiRequest.getParameter("petIssue");
		Date wantDate = Date.valueOf(multiRequest.getParameter("wantDate"));
		String wantTime = multiRequest.getParameter("wantTime");
		String phone = multiRequest.getParameter("phone");
				
		Entrance e = new Entrance();
		e.setEntNo(eno);
		e.setMemName(userName);
		e.setEntTitle(title);
		e.setAnimalName(petName);
		e.setAnimalType(petType);
		e.setAnimalVariety(petVariety);
		e.setAnimalAge(petAge);
		e.setAnimalGender(petGender);
		e.setAnimalVaccinated(petVaccin);
		e.setAnimalNeturalization(neutral);
		e.setAnimalDisease(disease);
		e.setAnimalIssue(petIssue);
		e.setEntWantDate(wantDate);
		e.setEntWantTime(wantTime);
		e.setReqPhone(phone);
		
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=1; i<=3; i++) {
			
			String key = "file" + i;
			
			if(multiRequest.getOriginalFileName(key) != null) {

				Attachment at = new Attachment();

				if(multiRequest.getParameter("origin" + i) != null) {
					// 기존의 첨부파일 있을경우
					at.setAttachNo(multiRequest.getParameter("origin" + i));
				}

				
				// 새로 넘어올 첨부파일 있으면 
				at.setOriginName(multiRequest.getOriginalFileName(key));
				at.setChangeName(multiRequest.getFilesystemName(key));
				at.setPath("resources/upfiles/entrance/");
				
				if(i == 1) { //대표이미지
					at.setAttachLevel(1);
				}else { // 상세이미지
					at.setAttachLevel(2);
				}
				list.add(at);
			}
			
		}
		
		int result = new EntranceService().updateEntrance(e, list);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "입소신청 양식이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/entList.ent?cpage=1");
		}else {
			request.setAttribute("alertMsg", "게시글 수정에 실패했습니다.");
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
