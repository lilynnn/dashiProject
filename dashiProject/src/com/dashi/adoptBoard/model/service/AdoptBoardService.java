package com.dashi.adoptBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptBoard.model.dao.AdoptBoardDao;
import com.dashi.adoptBoard.model.vo.AdoptNotice;
import com.dashi.common.model.vo.PageInfo;

public class AdoptBoardService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptBoardDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<AdoptNotice> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<AdoptNotice> list = new AdoptBoardDao().selectList(conn, pi);
		close(conn);
		return list;
		
	}
	
	public int increaseCount(String boardNo) {
		
		Connection conn = getConnection();
		int result = new AdoptBoardDao().increaseCount(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public AdoptNotice selectAdoptNotice(String boardNo) {
		Connection conn = getConnection();
		AdoptNotice an = new AdoptBoardDao().selectAdoptNotice(conn, boardNo);
		
		close(conn);
		return an;
	}
}
