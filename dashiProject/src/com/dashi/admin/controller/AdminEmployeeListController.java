package com.dashi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.admin.model.service.AdminService;
import com.dashi.admin.model.vo.Manager;
import com.dashi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdminInfoList
 */
@WebServlet("/empList.ad")
public class AdminEmployeeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEmployeeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//int mnNo = Integer.parseInt(request.getParameter("ano"));
		
		ArrayList<Manager> list = new AdminService().selectAdminList();
		//Manager a = new AdminService().selectAdmin();
						
		request.setAttribute("list", list);
		//request.setAttribute("a", a);
		
		//System.out.println(a);
		
		request.getRequestDispatcher("views/admin/adminEmployeeList.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
