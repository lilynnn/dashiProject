package com.dashi.adoptReviewBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.adoptReviewBoard.model.service.AdoptReviewBoardService;
import com.dashi.adoptReviewBoard.model.vo.AdoptReviewReply;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxAdoptReviewReplyUpdateController
 */
@WebServlet("/rupdate.ar")
public class AjaxAdoptReviewReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdoptReviewReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String replyNo = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");
		
		AdoptReviewReply arp = new AdoptReviewReply();
		arp.setReplyNo(replyNo);
		arp.setReplyContent(replyContent);
		
		int result = new AdoptReviewBoardService().updateReply(arp);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
