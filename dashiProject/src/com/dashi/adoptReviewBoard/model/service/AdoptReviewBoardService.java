package com.dashi.adoptReviewBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptReviewBoard.model.dao.AdoptReviewBoardDao;
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.model.vo.Attachment;
import static com.dashi.common.JDBCTemplate.*;

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

}
