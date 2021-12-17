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
	
	// 목록 조회 메소드
	public ArrayList<Dsp> selectDspList() {
		Connection conn = getConnection();
		ArrayList<Dsp> dsplist = new DspDao().selectDspList(conn);
		
		close(conn);
		return dsplist;
		
		
		
	}
	
	// 조회수 증가 메소드
	public int increasCount(String dspNo) {
		Connection conn = getConnection();
		int result = new  DspDao().increaseCount(conn, dspNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 상세조회 시 정보 가져오는 메소드
	public Dsp selectDsp(String dspNo) {
		Connection conn = getConnection();
		Dsp d = new DspDao().selectDsp(conn, dspNo);
		close(conn);
		return d;
	}

	// 상세조회 시 첨부파일 가져오는 메소드
	public ArrayList<Attachment> selectAttachmentList(String dspNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new DspDao().selectAttachmentList(conn, dspNo);
		close(conn);
		return list;
	}

}
