package com.dashi.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.member.model.vo.Member;
import com.dashi.report.model.service.ReportService;
import com.dashi.report.model.vo.Report;

/**
 * Servlet implementation class ReplyReportEnrollController
 */
@WebServlet("/report.cmt")
public class ReplyReportEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyReportEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String reportCmtNo = request.getParameter("replyNo");
		String reportedMemNo = request.getParameter("memNo");	//신고당한회원번호
		String reportingMemNo =  Integer.toString(((Member)session.getAttribute("loginUser")).getMemNo());
		String reportContent = request.getParameter("replyContent");//신고게시글내용
		
		System.out.println(reportCmtNo);
		System.out.println(reportedMemNo );
		System.out.println(reportingMemNo);
		System.out.println(reportContent);
		
		Report rt = new Report();
		rt.setContentNo(reportCmtNo);
		rt.setReportingMem(reportingMemNo);
		rt.setReportedMem(reportedMemNo);
		rt.setReportContent(reportContent);
		rt.setReportCategory(Integer.parseInt(request.getParameter("radio")));
		rt.setTypeBR(3);
		System.out.println(rt);
		
		int result = new ReportService().insertReportCmt(rt);
		System.out.println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
