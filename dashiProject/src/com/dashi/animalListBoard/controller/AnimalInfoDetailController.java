package com.dashi.animalListBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.animalListBoard.model.service.AnimalListService;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AnimalInfoDetailController
 */
@WebServlet("/andetail.ad")
public class AnimalInfoDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalInfoDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String animalNo = request.getParameter("ano");
		System.out.println(animalNo);
		Animal a = new AnimalListService().selectAnimalInfo(animalNo);
		//ArrayList<Attachment> list = new AnimalListService().selectAttachmentList(animalNo);
		Attachment at = new AnimalListService().selectAttachment(animalNo);
		//System.out.println(list);
		request.setAttribute("aInfo", a);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/animalListBoard/animalInfoDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
