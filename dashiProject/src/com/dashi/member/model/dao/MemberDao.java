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
import com.dashi.adoptReviewBoard.model.vo.AdoptReview;
import com.dashi.common.model.vo.Attachment;
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
			pstmt = conn.prepareStatement(sql);// ???????????? sql???
		
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
	
	
	// ????????? ??????
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
	

	// ???????????? ??????
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
	
	//??????????????? ??????
	public ArrayList<Member> selectBlackList(Connection conn){
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlackList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"),
									rset.getString("MEM_ID"),
								   rset.getString("MEM_NAME"),
								   rset.getInt("GRADE"),
								   rset.getString("BLACKLIST_YN")));
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
	 * @author ??????
	 * @return result : ???????????? ??????
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
		
	} // ???????????? ????????????
	
	/**
	 * @author ??????
	 * @return m : ????????? ????????????
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
		
	} // ????????? ???????????? ??????
	
	/**
	 * @author ??????
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
	} // ?????? ??????

	
	//????????? ??????
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
	//?????????????????????
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

	
	//???????????? ????????? 
	public int updatePwdMember(Connection conn, String memId, String pw) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//???????????? ?????? 
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
	
	//??????????????? 
	public String findId(Connection conn, String memName, String email ,String phone) {
		
		String memId = null; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			 
			
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
	
	
	// ????????? ????????????????????? ????????????
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
	
	// ????????? ??????????????? ????????????
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
	
	// ????????? ???????????? ????????? ??????
	public ArrayList<AdoptReview> selectWriteAdoptReviewList(Connection conn, int userNo){
		
		ArrayList<AdoptReview> arlist = new ArrayList<AdoptReview>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWriteAdoptReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				arlist.add(new AdoptReview(rset.getString("ARLIST_NO")
						                , rset.getInt("MEM_NO")
						                , rset.getString("AN_TYPE")
						                , rset.getString("AR_TITLE")
						                , rset.getString("AR_CONTENT")
						                , rset.getString("NICKNAME")
						                , rset.getString("WRITE_DATE")
						                , rset.getString("MEM_ID")
						                , rset.getInt("view_count")));
			}
			System.out.println(arlist);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return arlist;
		
	}
	
	// ???????????? ????????????
	public AdoptReview selectReview(Connection conn, String arlistNo) {
		// select??? => ResultSet (??????) => Board
		AdoptReview ar = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arlistNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ar = new AdoptReview(rset.getString("arlist_no"),
							  rset.getInt("mem_no"),
							  rset.getString("an_type"),
							  rset.getString("ar_title"),
							  rset.getString("ar_content"),
							  rset.getString("nickname"),
							  rset.getString("write_date"),
							  rset.getString("mem_Id"),
							  rset.getString("TITLE_IMG"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ar;
	}
	
	public ArrayList<Attachment> selectReviewAttachmentList(Connection conn, String arlistNo){
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arlistNo);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setPath(rset.getString("PATH"));
				at.setAttachNo(rset.getString("ATTACH_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setAttachLevel(rset.getInt("ATTACH_LEVEL"));
				at.setAttachStatus(rset.getString("ATTACH_STATUS"));
				at.setRefNo(rset.getString("REF_NO"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	
	// ---------------????????? ?????? ????????? ?????? ??????
	
	// ???????????? ??? ?????? ???
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
	
	
	//grade ?????? (bl->??????)
			public int deleteBlack(Connection conn, int memNo) {
				// update => ????????????
				int result = 0;
				PreparedStatement pstmt = null;
				
				String sql = prop.getProperty("deleteBlackGrade");
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, memNo);
					
					
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				
				return result;		
			} //user ??????

			
		// ????????? ???????????? ?????????
		public int pay(Connection conn, String memno) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("pay");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memno);
				
				result = pstmt.executeUpdate();	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		return result;
		}

		public ArrayList<Member> selectPayList(Connection conn) {
			ArrayList<Member> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectPayList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Member(rset.getInt("MEM_NO"),
										rset.getString("MEM_ID"),
									   rset.getString("MEM_NAME"),
									   rset.getString("NICKNAME")));
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
