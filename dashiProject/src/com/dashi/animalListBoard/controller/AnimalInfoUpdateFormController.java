package com.dashi.animalListBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.animalListBoard.model.service.AnimalListService;
import com.dashi.animalListBoard.model.vo.Animal;
import com.dashi.common.model.vo.Attachment;

/**
 * Servlet implementation class AnimalInfoUpdateFormController
 */
@WebServlet("/anupdateForm.ad")
public class AnimalInfoUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnimalInfoUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String animalNo = request.getParameter("ano");
		
		Animal a = new AnimalListService().selectAnimalInfo(animalNo);
		//Attachment at = new AnimalListService().selectAttachment(animalNo);
		
		request.setAttribute("aInfo", a);
		request.getRequestDispatcher("views/animalListBoard/animalInfoUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
