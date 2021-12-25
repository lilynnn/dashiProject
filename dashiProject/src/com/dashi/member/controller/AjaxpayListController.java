package com.dashi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxpayListController
 */
@WebServlet("/pay.do")
public class AjaxpayListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxpayListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String amount = request.getParameter("amount");
		String bmemno = request.getParameter("buyer_memno");
		String bemail = request.getParameter("buyer_email");
		String bname = request.getParameter("buyer_name");
		String bphone = request.getParameter("buyer_phone");
		String baddr = request.getParameter("buyer_addr");
		String merchant_uid = request.getParameter("merchant_uid");
		String pay_method = request.getParameter("pay_method");

		System.out.println(amount);
		System.out.println(bmemno);
		System.out.println(bemail);
		System.out.println(bname);
		System.out.println(amount);
		System.out.println(bphone);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
