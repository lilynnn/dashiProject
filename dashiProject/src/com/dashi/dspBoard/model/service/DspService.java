package com.dashi.dspBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.Attachment;
import com.dashi.dspBoard.model.dao.DspDao;
import com.dashi.dspBoard.model.vo.Dsp;

public class DspService {

	//실종보호목격 글 입력 메소드
	
	public int insertDsp(Dsp d, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new DspDao().insertDsp(conn, d);
		
		int result2 = new DspDao().insertDspAttachment(conn, list);	
	
		if(
			result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			
		close(conn);
			
		return result1 * result2;
	
	}
	
	// 글 조회 메소드
	public ArrayList<Dsp> selectDspList() {
		Connection conn = getConnection();
		ArrayList<Dsp> list = new DspDao().selectDspList(conn);
		
		close(conn);
		return list;
		
		
		
	}

}
