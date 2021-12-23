package com.dashi.entranceBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.entranceBoard.model.service.EntranceService;

/**
 * Servlet implementation class EntranceDeleteController
 */
@WebServlet("/delete.ent")
public class EntranceDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EntranceDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String eno = request.getParameter("eno");
		
		int result = new EntranceService().deleteEntrance(eno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "입소신청글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/entList.ent");						
		}else {
			request.getSession().setAttribute("alertMsg", "입소신청글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/entList.ent");
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
