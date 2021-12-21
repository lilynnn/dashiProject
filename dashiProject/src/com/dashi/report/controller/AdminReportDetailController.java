package com.dashi.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.report.model.service.ReportService;
import com.dashi.report.model.vo.Report;

/**
 * Servlet implementation class AdminReportDetailController
 */
@WebServlet("/reportDetail.ad")
public class AdminReportDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int reportNo = Integer.parseInt(request.getParameter("rno"));
		
		Report r = new ReportService().selectReviewReport(reportNo);
		Report dspR = new ReportService().selectDSPReport(reportNo);
		Report cr = new ReportService().selectReplyReport(reportNo);
		
		request.setAttribute("r", r);
		request.setAttribute("dspR", dspR);
		request.setAttribute("cr", cr);
				
		request.getRequestDispatcher("views/report/adminReportDetailView.jsp").forward(request, response);
		
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
