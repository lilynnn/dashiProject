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
 * Servlet implementation class ReportEnrollController
 */
@WebServlet("/report")
public class ReportEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String reportBoardNo = request.getParameter("boardNo");
		String reportedMemNo = request.getParameter("writerNo");	//신고당한회원번호
		String reportingMemNo = request.getParameter("loginUser");	//신고한회원번호
		String reportContent = request.getParameter("boardContent");//신고게시글내용
		int typeBr = 0;

		if(reportBoardNo.substring(0, 3).equals("AR-")) {
			typeBr = 1;
		} else {
			typeBr = 2;
		}
		Report rt = new Report(reportBoardNo, reportingMemNo, reportedMemNo, reportContent, Integer.parseInt(request.getParameter("radio")), typeBr);
		
		int result = new ReportService().insertReportBr(rt);

		if(result>0) {
			if(reportBoardNo.substring(0, 3).equals("AR-")) {
				request.getSession().setAttribute("alertMsg","게시글 신고가 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/list.ar?cpage=1");
			
			} else if(reportBoardNo.substring(0, 3).equals("DSP")){
				request.getSession().setAttribute("alertMsg","게시글 신고가 완료되었습니다.");
				response.sendRedirect(request.getContextPath());
			}
		} else {
			request.getSession().setAttribute("alertMsg","게시글 신고에 실패했습니다.");
			response.sendRedirect(request.getContextPath());
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
