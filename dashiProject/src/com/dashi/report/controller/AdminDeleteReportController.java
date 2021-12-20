package com.dashi.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.report.model.service.ReportService;

/**
 * Servlet implementation class AdminDeleteReportController
 */
@WebServlet("/deleteReport.ad")
public class AdminDeleteReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int reportNo = Integer.parseInt(request.getParameter("rno"));
		
		int result = new ReportService().deleteReport(reportNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "신고글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/reportList.ad?cpage=1");
			
			
		}else {
			request.getSession().setAttribute("alertMsg", "신고글 삭제 실패!");
			request.getRequestDispatcher("views/report/adminReportList.jsp").forward(request, response);
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
