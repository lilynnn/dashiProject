package com.dashi.member.model.service;

import static com.dashi.common.JDBCTemplate.close;
import static com.dashi.common.JDBCTemplate.commit;
import static com.dashi.common.JDBCTemplate.getConnection;
import static com.dashi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.dashi.adoptBoard.model.vo.AdoptApply;
import com.dashi.answerBoard.model.dao.AnswerDao;
import com.dashi.answerBoard.model.vo.Answer;
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
	
	// 회원정보 조회
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	//중복아이디 체크
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	//닉네임 체크
	public int checkNickName(String checkNickName) {
		Connection conn = getConnection();
		int count = new MemberDao().checkNickName(conn, checkNickName);
		close(conn);
		return count;
	}
	
	
//아이디찾기
	public String findId (String memName, String email) {
		Connection conn = getConnection();
		
		 String memId = new MemberDao().findId(conn, memName, email);
		
		if(memId != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return memId;
		
	}
	
	//비밀번호찾기
	public Member findPwd(String memId) {
	
		Connection conn = getConnection();
		Member m = new MemberDao().findPwd(conn, memId);

		return m;
	}
	
	// 블랙리스트 조회
		public ArrayList<Member> selectBlackList(){
			Connection conn = getConnection();
			ArrayList<Member> list = new MemberDao().selectBlackList(conn);
			close(conn);
			return list;
		}
	
	
	
	/**
	 * @author 누리
	 * @param m : 수정된 멤버객체
	 * @return : updateMem
	 */
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		}else{
			rollback(conn);
		}		
		close(conn);
		
		return updateMem;
		
	} // 회원정보수정
	
	/**
	 * @author 누리
	 * @param m
	 * @return : result 
	 */
	public int deleteMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	} // 회원 탈퇴

	//비밀번호 재설정 
	public Member updatePwdMember(String memId, String userpwd, String pw) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, memId, userpwd, pw);
	
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		
		close(conn);
	
		return updateMem;
	}
	
	// 작성한 입양신청서 조회
	public ArrayList<AdoptApply> selectWriteAdoptApplyList(int userNo){
		Connection conn = getConnection();
		ArrayList<AdoptApply> adplist = new MemberDao().selectWriteAdoptApplyList(conn, userNo);
		close(conn);
		return adplist;
	}
	
	// 작성한 입양신청서 상세조회
	public AdoptApply selectAdoptApply(String adpNo) {
		Connection conn = getConnection();
		AdoptApply adp = new MemberDao().selectAdoptApply(conn, adpNo);
		close(conn);
		return adp;
	}
	
	// ---------관리자 회원 검색 영역
	
	// 검색 후 총 회원 수
	public int searchMemberCount(String keyword) {
		Connection conn = getConnection();
		int listCount = new MemberDao().searchMemberCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	// 관리자 회원 키워드검색
	public ArrayList<Member> searchMember(String keyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().searchMember(conn, keyword, pi);
		System.out.println("sevice: " + list);
		close(conn);
		return list;
	}
	
	
	public int deleteBlackGrade(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteBlackGrade(conn, m);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	} //수정
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}