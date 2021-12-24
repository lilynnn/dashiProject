package com.dashi.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.entranceBoard.model.service.EntranceService;
import com.dashi.notice.model.service.NoticeService;
import com.dashi.report.model.service.ReportService;

/**
 * Servlet implementation class AdminMainPage
 */
@WebServlet("/main.ad")
public class AdminMainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 메인화면 공지사항 조회용 시작-->
		int noCount = new NoticeService().selectCount();
		String noDate = new NoticeService().selectDate();
		
		request.setAttribute("noCount", noCount);
		request.setAttribute("noDate", noDate);
		// 여기까지 공지사항!

		// 입양공고 -->
		int adtCount = new AdoptBoardService().selectListCount();

		request.setAttribute("adtCount", adtCount);
		// 여기까지 입양공고!
		
		// 입소신청-->
		int entCount = new EntranceService().selectListCount();
		String entDate = new EntranceService().selectDate();
		
		request.setAttribute("entCount", entCount);
		request.setAttribute("entDate", entDate);
		// 입소신청 끝
		
		// 신고내역-->
		String reDate = new ReportService().selectDate();
		request.setAttribute("reDate", reDate);
		// 신고내역 끝
		
		
		
		
		
		
		
		
		
		request.getRequestDispatcher("views/admin/adminMainPage.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
