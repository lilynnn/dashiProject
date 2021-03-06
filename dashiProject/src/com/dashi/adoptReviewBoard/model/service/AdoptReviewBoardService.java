package com.dashi.adoptReviewBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptReviewBoard.model.dao.AdoptReviewBoardDao;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.adoptReviewBoard.model.vo.AdoptReviewReply;
import com.dashi.common.model.vo.Attachment;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.dspBoard.model.dao.DspDao;
import com.dashi.dspBoard.model.vo.Dsp;

public class AdoptReviewBoardService {
	
	// 입양후기 작성
	public int insertThumbnailAdoptReview(AdoptReview ar, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new AdoptReviewBoardDao().insertThAdoptReviewBoard(conn, ar);
		int result2 = new AdoptReviewBoardDao().insertReviewAttachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

	// 입양후기 조회
	public ArrayList<AdoptReview> selectReviewList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<AdoptReview> list = new AdoptReviewBoardDao().selectReviewList(conn, pi);
		
		close(conn);
		return list;
	}
	
	// 입양후기 조회수
	public int increaseCount(String arlistNo) {
		Connection conn = getConnection();
		int result = new AdoptReviewBoardDao().increaseCount(conn, arlistNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// ------ 입양후기 상세보기
	public AdoptReview selectReview(String arlistNo) {
		Connection conn = getConnection();
		AdoptReview ar = new AdoptReviewBoardDao().selectReview(conn, arlistNo);
		close(conn);
		return ar;
	}
	
	public ArrayList<Attachment> selectAttachmentList(String arlistNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdoptReviewBoardDao().selectAttachmentList(conn, arlistNo);
		close(conn);
		return list;
	}
	
	
	// 페이징 처리
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptReviewBoardDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 입양후기 리스트 조회
	public ArrayList<AdoptReview> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<AdoptReview> list = new AdoptReviewBoardDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	// 댓글 조회
	public ArrayList<AdoptReviewReply> selectReplyList(String arlistNo){
		Connection conn = getConnection();
		ArrayList<AdoptReviewReply> list = new AdoptReviewBoardDao().selectReplyList(conn, arlistNo);
		close(conn);
		return list;
	}
	
	// 댓글 입력
	public int insertReply(AdoptReviewReply r) {
		Connection conn = getConnection();
		int result = new AdoptReviewBoardDao().insertReply(conn, r);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 댓글 삭제
	public int deleteReply(String replyNo) {
		Connection conn = getConnection();
		int result = new AdoptReviewBoardDao().deleteReply(conn, replyNo);
		close(conn);
		return result;
	}
	
	// 댓글 수정 폼
	public AdoptReviewReply updateReplyForm(String replyNo) {
		Connection conn = getConnection();
		AdoptReviewReply arp = new AdoptReviewBoardDao().updateReplyForm(conn, replyNo);
		close(conn);
		return arp;
	}
	
	// 댓글 수정
	public int updateReply(AdoptReviewReply arp){
		Connection conn = getConnection();
		int result = new AdoptReviewBoardDao().updateReply(conn, arp);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 입양후기 삭제
	public int deleteReview(String arlistNo) {
		Connection conn = getConnection();
		int result = new AdoptReviewBoardDao().deleteReview(conn, arlistNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	// 입양후기 수정 상세이미지
	public ArrayList<AdoptReview> contentImgPath(String arlistNo){
		Connection conn = getConnection();
		ArrayList<AdoptReview> contentImgPath = new AdoptReviewBoardDao().contentImgPath(conn, arlistNo);
		close(conn);
		
		return contentImgPath;
	}
	
	// 입양후기 수정
	public int updateReview(AdoptReview ar, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new AdoptReviewBoardDao().updateReview(conn, ar);
		System.out.println("service: "+ result1);
		
		int result2 = 1;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getAttachNo() != null) {
				result2 = new AdoptReviewBoardDao().updateReviewAttachmentList(conn,list.get(i));
			}else {
				result2 = new AdoptReviewBoardDao().insertNewAttachmentList(conn,list.get(i));

			}
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
	
	
	// 메인페이지에 입양후기 리스트 노출
	public ArrayList<AdoptReview> selectMainAdoptReview(){
		Connection conn = getConnection();
		ArrayList<AdoptReview> arlist = new AdoptReviewBoardDao().selectMainAdoptReview(conn);
		close(conn);
		return arlist;
		
	}
	
	

}
