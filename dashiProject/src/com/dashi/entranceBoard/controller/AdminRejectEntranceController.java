package com.dashi.entranceBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.entranceBoard.model.service.EntranceService;

/**
 * Servlet implementation class AdminRejectEntranceController
 */
@WebServlet("/rejectEnt.ad")
public class AdminRejectEntranceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRejectEntranceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String eno = request.getParameter("eno");
		
		int result = new EntranceService().rejectEntrance(eno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "입소신청이 반려되었습니다.");
			response.sendRedirect(request.getContextPath() + "/entListView.ad?cpage=1");						
		}else {
			request.getSession().setAttribute("alertMsg", "입소신청 반려 실패!");
			response.sendRedirect(request.getContextPath() + "/entListView.ad?cpage=1");
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
