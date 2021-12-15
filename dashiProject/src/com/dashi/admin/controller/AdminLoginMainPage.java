package com.dashi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.admin.model.service.AdminService;
import com.dashi.admin.model.vo.Manager;

/**
 * Servlet implementation class AdminMainPage
 */
@WebServlet("/loginMain.ad")
public class AdminLoginMainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginMainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mnId = request.getParameter("mnId");
		String mnPwd = request.getParameter("mnPwd");
		
		Manager loginAdmin = new AdminService().loginAdmin(mnId, mnPwd);
		
		if(loginAdmin == null) {
			request.getSession().setAttribute("alertMsg", "관리자 로그인 실패");
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginAdmin", loginAdmin);
			
			request.getSession().setAttribute("alertMsg", "관리자님 어서오세요!");					
			response.sendRedirect(request.getContextPath() + "/main.ad");
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
