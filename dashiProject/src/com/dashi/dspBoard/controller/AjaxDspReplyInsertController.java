package com.dashi.dspBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashi.dspBoard.model.service.DspService;
import com.dashi.dspBoard.model.vo.DspReply;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class AjaxDspReplyInsertController
 */
@WebServlet("/rinsert.dsp")
public class AjaxDspReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDspReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("content");
		String dspNo = request.getParameter("dspno");
		
		String nickname = ((Member)request.getSession().getAttribute("loginUser")).getNickname();
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
	
		DspReply dr = new DspReply();
		dr.setReplyContent(replyContent);
		dr.setClistNo(dspNo);
		dr.setMemNo(userNo);
		dr.setNickname(nickname);
		
		int result = new DspService().insertReply(dr);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
