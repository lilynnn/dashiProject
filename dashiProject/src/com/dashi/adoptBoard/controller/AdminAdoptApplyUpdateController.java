package com.dashi.adoptBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;

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
		String adpNo = request.getParameter("adpNo");
		String adtNo = request.getParameter("adtNo");
		
		int adpStatus = Integer.parseInt(request.getParameter("status"));
		int adoptYN = 1;
	//	if(adpStatus == 4) {
		//	adoptYN = new AdoptBoardService().AdoptStatusUpdate()
		//}
		int result = new AdoptBoardService().AdoptApplyStatusUpdate(adpStatus, memNo, adpNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
