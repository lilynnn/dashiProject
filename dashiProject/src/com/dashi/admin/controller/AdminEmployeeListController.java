package com.dashi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.admin.model.service.AdminService;
import com.dashi.admin.model.vo.Manager;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminInfoList
 */
@WebServlet("/empList.ad")
public class AdminEmployeeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEmployeeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; // 총게시글수
		int currentPage; // 현재페이지
		int pageLimit; // 몇 개 단위
		int boardLimit; // 한 페이지 내에 보여질 게시글 최대갯수
		
		int maxPage; // 가장 마지막페이지
		int startPage; // 페이징바 시작수
		int endPage; // 페이징바 끝 수
		
		listCount = new AdminService().selectListCount(); // 총 게시글 갯수
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
				
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);	
				
		ArrayList<Manager> list = new AdminService().selectAdminList(pi);
						
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		System.out.println(pi);
		
		request.getRequestDispatcher("views/admin/adminEmployeeList.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
