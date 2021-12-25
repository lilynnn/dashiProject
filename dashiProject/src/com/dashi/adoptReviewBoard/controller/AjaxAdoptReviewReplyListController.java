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
 * Servlet implementation class AjaxAdoptReviewReplyListController
 */
@WebServlet("/rlist.ar")
public class AjaxAdoptReviewReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdoptReviewReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String arlistNo = request.getParameter("arno");

		ArrayList<AdoptReviewReply> list = new AdoptReviewBoardService().selectReplyList(arlistNo);
		System.out.println(list);		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
