package com.dashi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.admin.model.service.AdminService;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdminFindPwdController
 */
@WebServlet("/findPwd.ad")
public class AjaxAdminFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adid = request.getParameter("adid");
		String adPwdphone = request.getParameter("adphone");
		
		String findPwd = new AdminService().findAdPwd(adid, adPwdphone);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(findPwd, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
