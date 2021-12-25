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

import com.dashi.adoptBoard.model.vo.AdoptApply;
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
			
			System.out.println(userId);
			System.out.println(userPwd);

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

	
	//아이디 체크
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return count;
	}
	//닉네임중복체크
	public int checkNickName(Connection conn, String checkNickName) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkNickName");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, checkNickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return count;
	}

	
	//비밀번호 재설정 
	public int updatePwdMember(Connection conn, String memId, String userpwd, String pw) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, memId);
			pstmt.setString(3, userpwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//비밀번호 찾기 
	public Member findPwd (Connection conn, String memId) {

		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memId);

			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				 m = new Member(rset.getString("mem_Id")
						,rset.getString("mem_name")
						,rset.getString("dob")
						,rset.getString("phone")
						,rset.getString("email"));

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
	
	//아이디찾기 
	public String findId(Connection conn, String memName, String email) {
		
		String memId = null; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				memId = rset.getString("MEM_ID");
			} 
			
			System.out.println("member : " + memId);
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memId;
	}
	
	
	// 작성한 입양공고리스트 불러오기
	public ArrayList<AdoptApply> selectWriteAdoptApplyList(Connection conn, int userNo){
		
		ArrayList<AdoptApply> adplist = new ArrayList<AdoptApply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWriteAdoptApplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adplist.add(new AdoptApply(rset.getString("AALIST_NO"),
										   rset.getString("ANLIST_NO"),
										   rset.getInt("MEM_NO"),
										   rset.getString("AA_TITLE"),
										   rset.getInt("ADT_STATUS"),
										   rset.getString("MEM_ID"),
										   rset.getString("APPLY_DATE")));
			}
			System.out.println(adplist);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return adplist;
	}
	
	// 작성한 입양신청서 상세조히
	public AdoptApply selectAdoptApply(Connection conn, String adpNo) {
		AdoptApply adp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdoptApply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adpNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				adp = new AdoptApply(rset.getString("AALIST_NO"),
									rset.getString("ANLIST_NO"),
									rset.getInt("MEM_NO"),
									rset.getString("MEM_NAME"),
									rset.getString("AA_TITLE"),
									rset.getString("PAY_STATUS"),
									rset.getInt("ADT_STATUS"),
									rset.getString("POST_STATUS"),
									rset.getString("AA_NAME"),
									rset.getInt("AA_AGE"),
									rset.getString("AA_GENDER"),
									rset.getString("AA_PHONE"),
									rset.getString("AA_EMAIL"),
									rset.getString("AA_ADDRESS"),
									rset.getString("MARRIAGE_YN"),
									rset.getString("AA_JOB"),
									rset.getString("ADOPT_REASON"),
									rset.getString("PARENT_EXP"),
									rset.getString("HAVE_PET_YN"),
									rset.getString("PET_TYPE"),
									rset.getString("PET_AGE"),
									rset.getString("PET_GENDER"),
									rset.getString("PET_NEUTRAL"),
									rset.getInt("A_MATE"),
									rset.getInt("C_MATE"),
									rset.getInt("CHILD_AGE"),
									rset.getString("AGREE_YPN"),
									rset.getString("EVENT_MNG_ANI"),
									rset.getString("EMPTYHOUR"),
									rset.getString("HOUSETYPE"),
									rset.getString("HSELF_YN"),
									rset.getString("AGREE_NEI_YN"),
									rset.getInt("EXP_COST"),
									rset.getString("MEM_ID"),
									rset.getString("APPLY_DATE")
									);
			}
			System.out.println(adp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return adp;
	}
	
	// ---------------관리자 회원 키워드 검색 영역
	
	// 검색결과 총 회원 수
	public int searchMemberCount(Connection conn, String keyword) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Member> searchMember(Connection conn, String keyword, PageInfo pi){
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
	
	
	
	

}
