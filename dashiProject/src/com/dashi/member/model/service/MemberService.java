package com.dashi.member.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.common.model.vo.PageInfo;
import com.dashi.member.model.dao.MemberDao;
import com.dashi.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 페이징 처리
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	


}