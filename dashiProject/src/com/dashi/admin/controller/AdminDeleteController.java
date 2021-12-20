package com.dashi.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminDeleteController
 */
@WebServlet("/delete.ad")
public class AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int anum = Integer.parseInt(request.getParameter("ano"));
		
		int result = new AdminService().deleteAdmin(anum);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "퇴사처리가 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/empList.ad?cpage=1");
			
		} else {
			request.getSession().setAttribute("alertMsg", "퇴사 처리 실패!");
			request.getRequestDispatcher("views/admin/adminEmplyoeeList.ad").forward(request, response);
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
