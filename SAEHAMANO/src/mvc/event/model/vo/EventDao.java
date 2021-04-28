// 210426 11:07 이재용
package mvc.event.model.vo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.common.util.PageInfo;

import static mvc.common.jdbc.JDBCTemplate.*;

public class EventDao {

	public int updateStatus(Connection connection, int event_no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		
		try {
			query = "UPDATE EVENT SET STATUS=? WHERE EVENT_NO=? ";
			pstmt =connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, event_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertEvent(Connection connection, Event event) {
		int result = 0;
		PreparedStatement pstmt =null;
		String query = null;
		
		try {
			query = "INSERT INTO EVENT VALUES(SEQ_EVENT_CODE.NEXTVAL,?,?,?,?,"
					+ "?,?,NULL,NULL,?,?,DEFAULT)";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, event.getEvent_name());
			pstmt.setString(2, event.getEvent_start_date());
			pstmt.setString(3, event.getEvent_last_date());
			pstmt.setString(4, event.getEvent_content());
			pstmt.setString(5, event.getEvent_insta());
			pstmt.setString(6, event.getEvent_home());
			pstmt.setString(7, event.getOriginal_FileName());
			pstmt.setString(8, event.getRenamed_FileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getEventCount(Connection connection) {
		int count =0;
		PreparedStatement pstmt=null;	
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT COUNT(*) FROM EVENT WHERE STATUS='Y'";
			pstmt = connection.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	public List<Event> findAll(Connection connection, PageInfo pageInfo) {
		List<Event> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "    SELECT RNUM, EVENT_NO, EVENT_NAME , EVENT_START_DATE, EVENT_LAST_DATE ,STATUS, EVENT_IMG "
					+ "					FROM ( "
					+ "						    SELECT ROWNUM AS RNUM, EVENT_NO, EVENT_NAME, EVENT_START_DATE, EVENT_LAST_DATE, STATUS, EVENT_IMG "
					+ "						    FROM ( "
					+ "						        SELECT  E.EVENT_NO, E.EVENT_NAME, E.EVENT_START_DATE, E.EVENT_LAST_DATE, E.STATUS, E.EVENT_IMG "
					+ "						        FROM EVENT E "
					+ "						        WHERE E.STATUS = 'Y'  ORDER BY E.EVENT_NO DESC "
					+ "						    ) "
					+ "						) "
					+ "						WHERE RNUM BETWEEN ? and ? ";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Event event = new Event();
				
				event.setEvent_no(rs.getInt("EVENT_NO"));
				event.setRowNum(rs.getInt("RNUM"));
				event.setEvent_name(rs.getString("EVENT_NAME"));
				event.setEvent_start_date(rs.getString("EVENT_START_DATE"));
				event.setEvent_last_date(rs.getString("EVENT_LAST_DATE"));
				event.setStatus(rs.getString("STATUS"));
				event.setEvent_img(rs.getString("EVENT_IMG"));
				
				list.add(event);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Event findEventByNo(Connection connection, int event_no) {

		Event event = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = "SELECT  event_no, event_name, event_start_date, event_last_date, event_content, event_insta, event_home, event_place, event_hosting,"
					+"original_FileName, renamed_FileName, event_img"
					+ "	FROM event e "
					+ "	WHERE e.STATUS = 'Y' AND event_no=?";
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, event_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				event = new Event();
				event.setEvent_no(rs.getInt("EVENT_NO"));
				event.setEvent_name(rs.getString("EVENT_NAME"));
				event.setEvent_start_date(rs.getString("EVENT_START_DATE"));
				event.setEvent_last_date(rs.getString("EVENT_LAST_DATE"));
				event.setEvent_content(rs.getString("EVENT_CONTENT"));
				event.setEvent_insta(rs.getString("EVENT_INSTA"));
				event.setEvent_home(rs.getString("EVENT_HOME"));
				event.setEvent_place(rs.getString("EVENT_PLACE"));
				event.setEvent_hosting(rs.getString("EVENT_HOSTING"));
				event.setOriginal_FileName(rs.getString("ORIGINAL_FILENAME"));
				event.setRenamed_FileName(rs.getString("RENAMED_FILENAME"));
				event.setEvent_img(rs.getString("EVENT_IMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return event;
	}

}