package com.dashi.adoptBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdoptNoticeSearchListController
 */
@WebServlet("/adsearch.adt")
public class AdoptNoticeSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptNoticeSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String animalCtg = request.getParameter("animal-category");
		String keyword = request.getParameter("keyword");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdoptBoardService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		// 나중에 boardLimit 갯수 맞춰서 수정하기!!
		boardLimit = 4;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<AdoptNotice> list = new AdoptBoardService().searchAdoptNoticeList(pi, animalCtg, keyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("adtList", list);
		
		request.getRequestDispatcher("views/adoptBoard/adoptListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
