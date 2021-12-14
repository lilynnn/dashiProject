package com.dashi.member.model.service;

import java.sql.Connection;

import com.dashi.member.model.dao.MemberDao;
import com.dashi.member.model.vo.Member;
import static com.dashi.common.JDBCTemplate.*;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}

}