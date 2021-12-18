package com.dashi.member.model.dao;

import static com.dashi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.dashi.common.model.vo.PageInfo;
import com.dashi.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
							   rset.getString("mem_Id"),
							   rset.getString("mem_pwd"),
							   rset.getString("mem_Name"),
							   rset.getString("nickname"),
							   rset.getString("dob"),
							   rset.getString("gender"),
							   rset.getString("email"),
							   rset.getString("post_no"),
							   rset.getString("address"),
							   rset.getString("address_d"),
							   rset.getString("phone"),
							   rset.getDate("enroll_date"),
							   rset.getString("adopt_YN"),
							   rset.getString("enter_YN"),
							   rset.getString("pay_YN"),
							   rset.getString("delete_YN"),
							   rset.getString("del_reason"),
							   rset.getDate("del_date"),
							   rset.getString("blackList_YN"),
							   rset.getString("black_reason"),
							   rset.getDate("black_date"),
							   rset.getInt("grade"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);// 미완성된 sql문
		
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getBirth());
			pstmt.setString(6, m.getMemGender());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getPostNo());
			pstmt.setString(9, m.getAddress());
			pstmt.setString(10, m.getAddressDetail());
			pstmt.setString(11, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 페이징 처리
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	

	// 회원정보 조회
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("mem_no"),
								   rset.getString("MEM_NAME"),
								   rset.getString("MEM_ID"),
								   rset.getString("DOB"),
								   rset.getString("ADDRESS"),
								   rset.getString("ADDRESS_D"),
								   rset.getString("PHONE"),
								   rset.getString("ADOPT_YN"),
								   rset.getString("PAY_YN"),
								   rset.getInt("GRADE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * @author 누리
	 * @return result : 업데이트 결과
	 */
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemPwd());
			pstmt.setString(2, m.getMemName());
			pstmt.setString(3, m.getNickname());
			pstmt.setString(4, m.getBirth());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setInt(7, Integer.parseInt(m.getPostNo()));
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, m.getAddressDetail());
			pstmt.setString(10, m.getMemId());
			
			result = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	} // 회원정보 업데이트
	
	/**
	 * @author 누리
	 * @return m : 수정된 멤버객체
	 */
	public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("mem_id")
						     , rset.getString("mem_name")
						     , rset.getString("mem_pwd")
						     , rset.getString("nickname")
						     , rset.getString("dob")
						     , rset.getString("phone")
						     , rset.getString("email")
						     , rset.getString("post_no")
						     , rset.getString("address")
						     , rset.getString("address_d"));						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	} // 수정된 회원정보 조회
	
	/**
	 * @author 누리
	 * @return result
	 */
	public int deleteMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getDelReason());
			pstmt.setString(2, m.getMemId());
			pstmt.setString(3, m.getMemPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	} // 회원 탈퇴
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
