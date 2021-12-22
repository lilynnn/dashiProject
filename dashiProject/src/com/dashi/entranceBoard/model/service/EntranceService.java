package com.dashi.entranceBoard.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.entranceBoard.model.dao.EntranceDao;
import com.dashi.entranceBoard.model.vo.Entrance;

public class EntranceService {

	public int insertEntrance(Entrance e, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new EntranceDao().insertEntrance(conn, e);
		int result2 = new EntranceDao().insertAttachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
		
	} // 입소게시글 등록
	
	
	
	
	
}
