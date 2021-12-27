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
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxMainAdoptNoticeController
 */
@WebServlet("/home.adt")
public class AjaxMainAdoptNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMainAdoptNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int startIndex = Integer.parseInt(request.getParameter("startIndex"));
		int endIndex = Integer.parseInt(request.getParameter("endIndex"));
		
		System.out.println(startIndex);
		System.out.println(endIndex);
		
		ArrayList<AdoptNotice> anList = new AdoptBoardService().selectAjaxMainAdoptNotice(startIndex, endIndex);
		
		System.out.println(anList);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(anList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
