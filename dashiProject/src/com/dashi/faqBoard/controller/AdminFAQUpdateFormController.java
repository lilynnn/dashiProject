package com.dashi.faqBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.faqBoard.model.service.FAQService;
import com.dashi.faqBoard.model.vo.FAQ;

/**
 * Servlet implementation class AdminFAQUpdateFormController
 */
@WebServlet("/faqUpdateForm.ad")
public class AdminFAQUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String faqNo = request.getParameter("fno");
	
		FAQ f = new FAQService().selectFAQ(faqNo);
		
		request.setAttribute("f", f);
		
		request.getRequestDispatcher("views/faqBoard/adminFaqUpdateForm.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
