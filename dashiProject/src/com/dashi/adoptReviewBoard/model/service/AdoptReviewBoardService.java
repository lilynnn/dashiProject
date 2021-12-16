package com.dashi.adoptReviewBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dashi.adoptReviewBoard.model.dao.AdoptReviewBoardDao;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.model.vo.Attachment;

public class AdoptReviewBoardService {
	
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

	
	public ArrayList<AdoptReview> selectReviewList(){
		Connection conn = getConnection();
		ArrayList<AdoptReview> list = new AdoptReviewBoardDao().selectReviewList(conn);
		
		close(conn);
		return list;
	}
	

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
	
	
	
	
	
	
	
	
	
	
	
}