package com.dashi.notice.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.PageInfo;
import com.dashi.notice.model.dao.NoticeDao;
import com.dashi.notice.model.vo.Notice;

public class NoticeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;		
	} // 공지사항 총 게시글 갯수 조회
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	} // 게시글 수 만큼(10개)조회

}
