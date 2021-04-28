/*210427 22:27 김예원 (최종수정자) */
/*findCulture() 으로 문화재 이름 출력*/
package mvc.community.review.model.dao;

import static mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.common.util.PageInfo;
import mvc.community.review.model.vo.Nickname;
import mvc.community.review.model.vo.Review;

public class ReviewDAO {

	public int getReviewCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		try {
			query = "SELECT COUNT(*) FROM COMMUNITY_REVIEW WHERE STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public List<Review> findAll(Connection connection, PageInfo pageInfo) {
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String query;
		ResultSet rs = null;

		try {
			query = "SELECT RNUM, RE_NO, RE_NAME, NICKNAME,  RE_CONTENT, RE_VIEWS,WRITE_DATE, RE_LIKE, ORIGINAL_FILENAME, CUL_NAME  " 
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, RE_NO, RE_NAME, NICKNAME,  RE_CONTENT, RE_VIEWS,WRITE_DATE, RE_LIKE, ORIGINAL_FILENAME, CUL_NAME  "
					+ "    FROM ( "
					+ "        SELECT C.RE_NO, C.RE_NAME, N.NICKNAME, C.RE_CONTENT, C.RE_VIEWS, C.WRITE_DATE, C.RE_LIKE, C.ORIGINAL_FILENAME, C.CUL_NAME  "
					+ "        FROM COMMUNITY_REVIEW C JOIN NICKNAME_PASSWORD N ON(N.NICK_SEQUENCE = C.NICK_SEQUENCE) "
					+ "        WHERE C.STATUS = 'Y'  ORDER BY C.RE_NO DESC " + "    ) " + ") "
					+ "WHERE RNUM BETWEEN ? AND ?";
			pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();

				review.setRe_no(rs.getInt("RE_NO"));
				review.setRowNum(rs.getInt("RNUM"));
				review.setRe_name(rs.getString("RE_NAME"));
				review.setRe_content(rs.getString("RE_CONTENT"));
				review.setReview_nickname(rs.getString("NICKNAME"));
				review.setRe_views(rs.getInt("RE_VIEWS"));
				review.setWrite_date(rs.getDate("WRITE_DATE"));
				review.setRe_like(rs.getInt("RE_LIKE"));
				review.setOriginal_filename(rs.getString("ORIGINAL_FILENAME"));
				review.setCul_name(rs.getString("CUL_NAME"));


				list.add(review);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	public Review findReviewByNo(Connection connection, int reviewNo) {
		Review review = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		try {

			query = "SELECT RNUM, RE_NO, RE_NAME, NICKNAME,  RE_CONTENT, RE_VIEWS,WRITE_DATE, RE_LIKE, NICK_SEQUENCE, ORIGINAL_FILENAME, RENAMED_FILENAME, CUL_NAME "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, RE_NO, RE_NAME, NICKNAME,  RE_CONTENT, RE_VIEWS,WRITE_DATE, RE_LIKE, NICK_SEQUENCE, ORIGINAL_FILENAME, RENAMED_FILENAME, CUL_NAME "
					+ "    FROM ( "
					+ "        SELECT C.RE_NO, C.RE_NAME, N.NICKNAME, C.RE_CONTENT, C.RE_VIEWS, C.WRITE_DATE, C.RE_LIKE, N.NICK_SEQUENCE, C.ORIGINAL_FILENAME, C.RENAMED_FILENAME, C.CUL_NAME "
					+ "        FROM COMMUNITY_REVIEW C JOIN NICKNAME_PASSWORD N ON(N.NICK_SEQUENCE = C.NICK_SEQUENCE) "
					+ "        WHERE C.STATUS = 'Y' ORDER BY C.RE_NO DESC "
					+ "    ) "
					+ ") WHERE RE_NO=?";

			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, reviewNo);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				review = new Review();

				review.setRe_no(rs.getInt("RE_NO"));
				review.setRowNum(rs.getInt("RNUM"));
				review.setRe_name(rs.getString("RE_NAME"));
				review.setReview_nickname(rs.getString("NICKNAME"));
				review.setRe_content(rs.getString("RE_CONTENT"));
				review.setWrite_date(rs.getDate("WRITE_DATE"));
				review.setRe_views(rs.getInt("RE_VIEWS"));
				review.setRe_like(rs.getInt("RE_LIKE"));
				review.setNick_sequence(rs.getInt("NICK_SEQUENCE"));
				review.setOriginal_filename(rs.getString("ORIGINAL_FILENAME"));
				review.setRenamed_filename(rs.getString("RENAMED_FILENAME"));
				review.setCul_name(rs.getString("CUL_NAME"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return review;
	}

	public int updateReadCount(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query="UPDATE COMMUNITY_REVIEW SET RE_VIEWS=? WHERE RE_NO=?";
			pstmt = connection.prepareStatement(query);
			
			review.setRe_views(review.getRe_views()+1);
			
			pstmt.setInt(1,review.getRe_views());
			pstmt.setInt(2, review.getRe_no());
			
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Nickname findConfirmedReview(Connection connection, int reviewNo) {
		Nickname nickname = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		
		try {
			query="SELECT * "
					+ "FROM NICKNAME_PASSWORD "
					+ "WHERE NICK_SEQUENCE = (SELECT NICK_SEQUENCE FROM COMMUNITY_REVIEW WHERE RE_NO=?)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1,reviewNo);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nickname = new Nickname();
				
				nickname.setNick_sequence(rs.getInt("NICK_SEQUENCE"));
				nickname.setNickname(rs.getString("NICKNAME"));
				nickname.setPassword(rs.getString("NICKNAME_PASSWORD"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
		
		
		return nickname;
	}

	/*
	public int updateReview(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		
		try {
			query="UPDATE COMMUNITY_REVIEW SET RE_NAME=?,RE_CONTENT=?,WRITE_DATE=SYSDATE WHERE RE_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getRe_name());
			pstmt.setString(2, review.getRe_content());
			pstmt.setInt(3, review.getRe_no());

			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	 */
	public int insertNickname(Connection connection, Nickname nickname) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "INSERT INTO NICKNAME_PASSWORD VALUES(SEQ_NICK_SEQUENCE.NEXTVAL,?,?)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, nickname.getNickname());
			pstmt.setString(2, nickname.getPassword());
			
			result = pstmt.executeUpdate();				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int findnick(Connection connection, Nickname nickname) {
		int seq = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT NICK_SEQUENCE "
					+ "FROM( "
					+ "    SELECT "
					+ "        NICK_SEQUENCE "
					+ "    FROM NICKNAME_PASSWORD "
					+ "    ORDER BY ROWNUM DESC) "
					+ "WHERE ROWNUM = 1";
					
			
			pstmt = connection.prepareStatement(query);

			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				seq = rs.getInt("NICK_SEQUENCE");
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);			
		}		
		
		return seq;
	}

	public int insertBoard(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		
		try {
			query ="INSERT INTO COMMUNITY_REVIEW VALUES(SEQ_RE_SEQUENCE.NEXTVAL, DEFAULT,?, ?, ?, ?,DEFAULT, DEFAULT,?,?,DEFAULT) ";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getCul_name());
			pstmt.setInt(2, review.getNick_sequence());
			pstmt.setString(3, review.getRe_name());
			pstmt.setString(4, review.getRe_content());
			pstmt.setString(5, review.getOriginal_filename());
			pstmt.setString(6, review.getRenamed_filename());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateStatus(Connection connection, int reviewNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE COMMUNITY_REVIEW SET STATUS=? WHERE RE_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE COMMUNITY_REVIEW SET CUL_NAME=?, RE_NAME=?,RE_CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,WRITE_DATE=SYSDATE WHERE RE_NO=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getCul_name());
			pstmt.setString(2, review.getRe_name());
			pstmt.setString(3, review.getRe_content());
			pstmt.setString(4, review.getOriginal_filename());
			pstmt.setString(5, review.getRenamed_filename());
			pstmt.setInt(6, review.getRe_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<String> findCulture(Connection connection) {
		List<String> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		String query;
		ResultSet rs = null;
		

		try {
			query = "SELECT '\"' || CUL_NAME ||'\"' FROM CULTURE";
			pstmt = connection.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String culture = rs.getString(1);

				
				list.add(culture);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		
		return list;
	}

}
