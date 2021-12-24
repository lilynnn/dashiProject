package com.dashi.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.admin.model.vo.Manager;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.dashi.notice.model.service.NoticeService;
import com.dashi.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminNoticeInsertController
 */
@WebServlet("/noInsert.ad")
public class AdminNoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/notice/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String noSelect = multiRequest.getParameter("noSelect");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			// 로그인한 회원 정보 얻어내는방법 기술해야됨
			HttpSession session = request.getSession();
			int mnNo = ((Manager)session.getAttribute("loginAdmin")).getMnNo();
			
			Notice n = new Notice();
			n.setNoticeYN(noSelect);
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			n.setMnNo(String.valueOf(mnNo));
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setPath("resources/upfiles/notice/");
				
			}
			
			int result = new NoticeService().insertNotice(n, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항이 등록 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/noList.ad?cpage=1");
			}else {
				
				if(at != null) {
					
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.getSession().setAttribute("alertMsg", "공지사항 글 등록에 실패했습니다.");
				// 에러페이지로 로딩
			}

			
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
