package com.dashi.report.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.admin.model.dao.AdminDao;
import com.dashi.common.model.vo.PageInfo;
import com.dashi.report.model.dao.ReportDao;
import com.dashi.report.model.vo.Report;

public class ReportService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ReportDao().selectListCount(conn);
		close(conn);
		return listCount;
	} // 관리자 총 명수	

	public ArrayList<Report> selectReportList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectReportList(conn, pi);
		
		close(conn);
		return list;		
		
	} // 모든 사원 조회
	
	
	
	
	
	
	
	
	
	
	

}
