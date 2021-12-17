package com.dashi.faqBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.faqBoard.model.service.FAQService;
import com.dashi.faqBoard.model.vo.FAQ;

/**
 * Servlet implementation class AdminFAQSearchController
 */
@WebServlet("/faqSearch.ad")
public class AdminFAQSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("fkeyword");
		
		ArrayList<FAQ> list = new FAQService().keywordFAQ(keyword);
	
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/faqBoard/adminFaqListView.jsp").forward(request, response);	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
