package com.dashi.faqBoard.model.service;

import static com.dashi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.faqBoard.model.dao.FAQDao;
import com.dashi.faqBoard.model.vo.FAQ;

public class FAQService {
	
	public ArrayList<FAQ> selectFAQList(){
		
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn);
		close(conn);
		return list;	
		
	} // faq전체조회
	
	public int insertFAQ(FAQ f) {
		
		Connection conn = getConnection();
		int result = new FAQDao().insertFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // faq등록
	
	public int deleteFAQ(String faqNo) {
		
		Connection conn = getConnection();
		int result = new FAQDao().deleteFAQ(conn, faqNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // faq 삭제
	
	public FAQ selectFAQ(String fNo){
		
		Connection conn = getConnection();
		FAQ f = new FAQDao().selectFAQ(conn, fNo);
		close(conn);
		return f;	
		
	} // faq 하나 조회
	
	public int updateFAQ(FAQ f) {
		
		Connection conn = getConnection();
		int result = new FAQDao().updateFAQ(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	} // faq 수정
	
	public ArrayList<FAQ> keywordFAQ(String keyword){
		
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().keywordFAQ(conn, keyword);
		close(conn);
		return list;	
		
	} // faq 제목 keyword조회
	
	public ArrayList<FAQ> keywordCategory(int keyword){
		
		Connection conn = getConnection();
		ArrayList<FAQ> list = new FAQDao().keywordCategory(conn, keyword);
		close(conn);
		return list;	
		
	} // faq 카테고리 keyword조회
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
