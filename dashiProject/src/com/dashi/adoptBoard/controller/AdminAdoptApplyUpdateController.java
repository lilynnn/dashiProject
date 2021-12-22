package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AdminAdoptApplyUpdateController
 */
@WebServlet("/adpupdate.ad")
public class AdminAdoptApplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptApplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String adpNo = request.getParameter("adpNo");	// 입양신청서번호	
		String adtNo = request.getParameter("adtNo");	// 입양공고번호
		
		int adpStatus = Integer.parseInt(request.getParameter("status"));

		int result = new AdoptBoardService().adoptApplyStatusUpdate(adpStatus, memNo, adpNo, adtNo);
		
		AdoptApply apply = new AdoptBoardService().selectAdminAdoptApply(adpNo);
		Attachment at = new AdoptBoardService().selectAttachment(adpNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "신청상태 변경에 성공했습니다.");
			request.setAttribute("apply", apply);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/adoptBoard/adminAdoptApplyDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "신청상태 변경에 실패했습니다.");
			request.setAttribute("apply", apply);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/adoptBoard/adminAdoptApplyDetailView.jsp").forward(request, response);
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
