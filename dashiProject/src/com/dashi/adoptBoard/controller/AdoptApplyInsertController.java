package com.dashi.adoptBoard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.dashi.adoptBoard.model.service.AdoptBoardService;
import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.common.MyFileRenamePolicy;
import com.dashi.common.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdoptApplyInsertController
 */
@WebServlet("/adpinsert.adt")
public class AdoptApplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptApplyInsertController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/adoptApply/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",  new MyFileRenamePolicy());		
			
			AdoptApply adp = new AdoptApply(multiRequest.getParameter("anNo"),
											Integer.parseInt(multiRequest.getParameter("memNo")),
											multiRequest.getParameter("memName"),
											multiRequest.getParameter("adpTitle"),
											multiRequest.getParameter("adpName"),
											Integer.parseInt(multiRequest.getParameter("adpAge")),
											multiRequest.getParameter("adpGender"),
											multiRequest.getParameter("phone"),
											multiRequest.getParameter("email"),
											multiRequest.getParameter("address"),
											multiRequest.getParameter("marriage"),
											multiRequest.getParameter("job"),
											multiRequest.getParameter("adReason"),
											multiRequest.getParameter("adExp"),
											multiRequest.getParameter("havePet"),
											multiRequest.getParameter("petType"),
											multiRequest.getParameter("petAge"),
											multiRequest.getParameter("petGender"),
											multiRequest.getParameter("petNeutral"),
											Integer.parseInt(multiRequest.getParameter("aMate")),
											Integer.parseInt(multiRequest.getParameter("cMate")),
											Integer.parseInt(multiRequest.getParameter("childAge")),
											multiRequest.getParameter("agreeYPN"),
											multiRequest.getParameter("eventAni"),
											multiRequest.getParameter("emptyHouse"),
											multiRequest.getParameter("houseType"),
											multiRequest.getParameter("hself"),
											multiRequest.getParameter("neiYN"),
											Integer.parseInt(multiRequest.getParameter("expCost"))
											);

			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 넘어온 첨부파일이 있을경우
				 at = new Attachment();
				 at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				 at.setChangeName(multiRequest.getFilesystemName("upfile"));
				 at.setPath("resources/upfiles/adoptApply/");
			}
			
			
			int result = new AdoptBoardService().insertAdoptApply(adp, at);
			
			if(result == 1) {
				// 입양신청서 업로드 성공 => alertMsg, 입양공고목록으로 돌아가기(adlist.ad?cpage=1)
				request.getSession().setAttribute("alertMsg", "입양신청이 성공적으로 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/home");
			} else {
				// 입양신청서 업로드 실패 => 현재 공고페이지로 돌아가기/입양공고목록으로 돌아기기
				
				if(at !=null) {
					new File(savePath + at.getChangeName()).delete();
				}
				
				request.getSession().setAttribute("alertMsg", "입양신청에 실패했습니다.");
				//response.sendRedirect(request.getContextPath()+"/adlist.ad?cpage=1");
				request.getRequestDispatcher("/adlist.adt?cpage=1").forward(request, response);
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
