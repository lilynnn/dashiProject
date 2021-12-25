package com.dashi.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.admin.model.service.AdminService;
import com.dashi.admin.model.vo.Manager;

/**
 * Servlet implementation class AdminUpdateAndDeleteController
 */
@WebServlet("/update.ad")
public class AjaxAdminUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int ano = Integer.parseInt(request.getParameter("adminNo"));
		String adminPwd = request.getParameter("adminPwd");
		String adminName = request.getParameter("adminName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		
		Manager a = new Manager();
		a.setMnNo(ano);
		a.setMnPwd(adminPwd);
		a.setMnName(adminName);
		a.setMnEmail(email);
		a.setMnPhone(phone);
		
		int result = new AdminService().updateAdmin(a);
		
		response.getWriter().print(result);
		
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
