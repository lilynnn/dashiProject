package com.dashi.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.report.model.service.ReportService;

/**
 * Servlet implementation class AdminDeleteCancleReport
 */
@WebServlet("/cancleReport.ad")
public class AdminDeleteCancleReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteCancleReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bno = request.getParameter("bno");
		
		int result1 = new ReportService().cancleDeleteReview(bno);
		int result2 = new ReportService().cancleDeleteReply(bno);
		int result3 = new ReportService().cancleDeleteDsp(bno);
		
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		
		if(result1 > 0 || result2 > 0 || result3 > 0) {
			request.getSession().setAttribute("alertMsg", "게시글이 성공적으로 복구되었습니다!");
			response.sendRedirect(request.getContextPath() + "/reportList.ad?cpage=1");
			
		}else {
			
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
