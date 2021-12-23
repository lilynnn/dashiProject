package com.dashi.dspBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.common.model.vo.PageInfo;
import com.dashi.dspBoard.model.service.DspService;
import com.dashi.dspBoard.model.vo.Dsp;

/**
 * Servlet implementation class dspListController
 */
@WebServlet("/list.dsp")
public class dspListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dspListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;		
		int currentPage; 	
		int pageLimit; 		
		int boardLimit; 	
		int maxPage;    	
		int startPage; 		
		int endPage;  		
			
		// * listCount : 총 게시글 갯수
		listCount = new DspService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		System.out.println(listCount);
		pageLimit = 5;
		
		boardLimit = 16;

		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1)/ pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		
		// 요청처리(응답페이지에 필요한 데이터 요청)
		ArrayList<Dsp> list = new DspService().selectDspList(pi);
	
		// 응답뷰
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/dspBoard/dspListView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
