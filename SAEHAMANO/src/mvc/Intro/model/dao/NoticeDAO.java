/*210426 10:07 김예원 (최종수정자) */

package mvc.Intro.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;

import static mvc.common.jdbc.JDBCTemplate.*;

public class NoticeDAO {

	public int getNoticeCount(Connection connection) {
		int count=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		
		try {
			query="SELECT COUNT(*) FROM NOTICE WHERE STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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

	public List<Notice> findAll(Connection connection, PageInfo pageInfo) {
		List<Notice> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS, WRITE_DATE, STATUS "
					+ "FROM ("
					+ "    SELECT ROWNUM AS RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS, WRITE_DATE, STATUS  "
					+ "    FROM ("
					+ "        SELECT  N.NOTICE_CODE, N.NOTICE_NAME, A.ID, N.NOTICE_CONTENT, N.NOTICE_VIEWS, N.WRITE_DATE, N.STATUS  "
					+ "        FROM NOTICE N JOIN ADMIN A ON(N.NOTICE_WRITER_NO = A.NO) "
					+ "        WHERE N.STATUS = 'Y'  ORDER BY N.NOTICE_CODE DESC "
					+ "    ) "
					+ ") "
					+ "WHERE RNUM BETWEEN ? and ?";
					
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				
				notice.setNotice_code(rs.getInt("NOTICE_CODE"));
				notice.setRowNum(rs.getInt("RNUM"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_writer(rs.getString("ID"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_views(rs.getInt("NOTICE_VIEWS"));
				notice.setWrite_date(rs.getDate("WRITE_DATE"));
				notice.setStatus(rs.getString("STATUS"));
				
				list.add(notice);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);			
		}		
		
		return list;
	}

	public int insertBoard(Connection connection, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL, ?,  ?, ?, DEFAULT, 'Y', DEFAULT,NULL,NULL)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, notice.getNotice_name());
			pstmt.setString(2, notice.getNotice_content());
			pstmt.setInt(3, notice.getNotice_writer_no());
			
			result = pstmt.executeUpdate();				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice findBoardByNo(Connection connection, int noticeNo) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		try {
			query = "SELECT RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS,WRITE_DATE, STATUS "
					+ "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS,WRITE_DATE, STATUS "
					+ "    FROM ( "
					+ "        SELECT  N.NOTICE_CODE, N.NOTICE_NAME, A.ID, N.NOTICE_CONTENT, N.NOTICE_VIEWS, N.WRITE_DATE, N.STATUS "
					+ "        FROM NOTICE N JOIN ADMIN A ON(N.NOTICE_WRITER_NO = A.NO) "
					+ "        WHERE N.STATUS = 'Y'  ORDER BY N.NOTICE_CODE DESC "
					+ "    ) "
					+ ") "
					+ "WHERE NOTICE_CODE = ?";
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, noticeNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new Notice();
				
				notice.setNotice_code(rs.getInt("NOTICE_CODE"));
				notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
				notice.setNotice_name(rs.getString("NOTICE_NAME"));
				notice.setNotice_views(rs.getInt("NOTICE_VIEWS"));
				notice.setNotice_writer(rs.getString("ID"));
				notice.setWrite_date(rs.getDate("WRITE_DATE"));
				notice.setRowNum(rs.getInt("RNUM"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return notice;
	}
	public int updateReadCount(Connection connection, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE NOTICE SET NOTICE_VIEWS=? WHERE NOTICE_CODE=?";
			pstmt = connection.prepareStatement(query);
			
			notice.setNotice_views(notice.getNotice_views() + 1);
			
			
			pstmt.setInt(1, notice.getNotice_views());
			pstmt.setInt(2, notice.getNotice_code());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	

}
