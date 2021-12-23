package com.dashi.entranceBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.common.model.vo.PageInfo;
import com.dashi.entranceBoard.model.service.EntranceService;
import com.dashi.entranceBoard.model.vo.Entrance;
import com.dashi.notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminEntranceListViewController
 */
@WebServlet("/entListView.ad")
public class AdminEntranceListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEntranceListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징처리
		int listCount; // 총게시글수
		int currentPage; // 현재페이지
		int pageLimit; // 몇 개 단위
		int boardLimit; // 한 페이지 내에 보여질 게시글 최대갯수
		
		int maxPage; // 가장 마지막페이지
		int startPage; // 페이징바 시작수
		int endPage; // 페이징바 끝 수
		
		listCount = new EntranceService().selectListCount(); // 총 게시글 갯수
		
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
		ArrayList<Entrance> list = new EntranceService().selectList(pi); 
				
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/entranceBoard/adminEntranceListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
