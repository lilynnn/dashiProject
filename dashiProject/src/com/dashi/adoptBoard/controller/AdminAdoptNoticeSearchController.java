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
 * Servlet implementation class AdminAdoptNoticeSearchController
 */
@WebServlet("/adtsearch.ad")
public class AdminAdoptNoticeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdoptNoticeSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchCtg = request.getParameter("search-category");
		String searchKey = request.getParameter("searchKey");

		ArrayList<AdoptNotice> list = new AdoptBoardService().searchAdoptNotice(searchCtg, searchKey);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/adoptBoard/adminAdoptNoticeSearchListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
