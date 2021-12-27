package com.dashi.adoptBoard.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdminAdoptApplySearchController
 */
@WebServlet("/adpsearch.ad")
public class AdminAdoptApplySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptApplySearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String searchCtg = request.getParameter("search-category");
		String searchKey = request.getParameter("searchKey");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new AdoptBoardService().selectAdminSearchAdoptApplyListCount(searchCtg, searchKey);
		
		currentPage = Integer.parseInt(request.getParameter("spage"));
		
		pageLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	
		ArrayList<AdoptApply> list = new AdoptBoardService().searchAdoptApply(pi, searchCtg, searchCtg , searchKey);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("searchCtg", searchCtg);
		request.setAttribute("searchKey", searchKey);
		System.out.println(pi);
		System.out.println(list);
		System.out.println(searchCtg);
		System.out.println(searchKey);
		
		request.getRequestDispatcher("views/adoptBoard/adminAdoptApplySearchListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
