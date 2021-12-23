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
	
	/*
	public int deleteReport(int reportNo) {
		Connection conn = getConnection();
		int result = new ReportDao().deleteReport(conn, reportNo);
		close(conn);
		return result;
	} // 신고글 삭제하기
	*/
	
	
	public ArrayList<Report> searchReport(Report r, String date){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().searchReport(conn, r, date);
		close(conn);
		return list;	
	} // 검색
	
	public Report selectReviewReport(int reportNo) {
		Connection conn = getConnection();
		Report r = new ReportDao().selectReviewReport(conn, reportNo);
		close(conn);
		return r;		
	} // 리뷰 신고글 조회
	
	public Report selectDSPReport(int reportNo) {
		Connection conn = getConnection();
		Report r = new ReportDao().selectDSPReport(conn, reportNo);
		close(conn);
		return r;		
	} // 실종보호 신고글 조회
	
	public Report selectReplyReport(int reportNo) {
		Connection conn = getConnection();
		Report r = new ReportDao().selectReplyReport(conn, reportNo);
		close(conn);
		return r;		
	} // 댓글 신고글 조회

	public ArrayList<Report> selectUserReportList(){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectUserReportList(conn);
		close(conn);
		return list;		
		
	} // 모든 신고된 회원들
	
	public int deleteReview(int bno) {
		Connection conn = getConnection();
		int result = new ReportDao().deleteReview(conn, bno);
		close(conn);
		return result;
	} // 후기 신고글 삭제하기
	
	public int cancleDeleteReview(String bno) {
		Connection conn = getConnection();
		int result = new ReportDao().cancleDeleteReview(conn, bno);
		close(conn);
		return result;
	} // 후기 신고글 복구하기

	public int cancleDeleteReply(String bno) {
		Connection conn = getConnection();
		int result = new ReportDao().cancleDeleteReply(conn, bno);
		close(conn);
		return result;
	} // 댓글 신고글 복구하기
	
	public int cancleDeleteDsp(String bno) {
		Connection conn = getConnection();
		int result = new ReportDao().cancleDeleteDsp(conn, bno);
		close(conn);
		return result;
	} // 실종보호 신고글 복구하기
	
	public int blacklistMem(int rno) {
		Connection conn = getConnection();
		int result = new ReportDao().blacklistMem(conn, rno);
		close(conn);
		return result;
	} // 신고횟수2회 블랙리스트 등록
	
	
	// 게시글에서 신고하기 버튼 눌렀을 때 
	public int insertReportBr(Report rt) {
		
		Connection conn = getConnection();
		int result = new ReportDao().insertReportBr(conn, rt);
		close(conn);
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
