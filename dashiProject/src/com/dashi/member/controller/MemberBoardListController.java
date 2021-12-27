package com.dashi.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.member.model.service.MemberService;
import com.dashi.member.model.vo.Member;

/**
 * Servlet implementation class MemberBoardListController
 */
@WebServlet("/boardList.me")
public class MemberBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		// 작성한 입양신청서 조회
		ArrayList<AdoptApply> adplist = new MemberService().selectWriteAdoptApplyList(userNo);

		request.setAttribute("adplist", adplist);
		
		// 작성한 입양후기 조회
		ArrayList<AdoptReview> arlist = new MemberService().selectWriteAdoptReviewList(userNo);
		request.setAttribute("arlist", arlist);
		
		request.getRequestDispatcher("views/member/memberBoardListView.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
