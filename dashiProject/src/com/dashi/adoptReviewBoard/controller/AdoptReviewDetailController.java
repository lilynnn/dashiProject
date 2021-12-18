package com.dashi.adoptReviewBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptReviewBoard.model.service.AdoptReviewBoardService;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AdoptReviewDetailController
 */
@WebServlet("/detail.ar")
public class AdoptReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String arlistNo = request.getParameter("arno");
		
		AdoptReviewBoardService arService = new AdoptReviewBoardService();
		int result = arService.increaseCount(arlistNo);
		
		if(result > 0) { // 성공 => 상세페이지
			
			AdoptReview ar = arService.selectReview(arlistNo);
			ArrayList<Attachment> list = arService.selectAttachmentList(arlistNo);
			
			request.setAttribute("ar", ar);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/adoptReviewBoard/adoptReviewDetailView.jsp").forward(request, response);
			
		}else { // 실패 => alrert창
			
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
