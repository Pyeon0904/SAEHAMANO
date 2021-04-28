
package mvc.event.model.service;

import java.sql.Connection;
import java.util.List;

import mvc.common.util.PageInfo;
import mvc.event.model.vo.Event;
import mvc.event.model.vo.EventDao;

import static mvc.common.jdbc.JDBCTemplate.*;

public class EventService {
	
	private EventDao dao = new EventDao();

	public int delete(int eventCode) {
		int result = 0;
		
		Connection connection = getConnection();
		result = dao.updateStatus(connection, eventCode,"N");
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		close(connection);
		return result;
	}

	public int save(Event event) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(event.getEvent_no() != 0 ) {
//			result = dao.updateEvent(connection,event);
		}else {
			result = dao.insertEvent(connection,event);
		}
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}

	public int getEventCount() {
		Connection connection = getConnection();
		
		int count = dao.getEventCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Event> getEventList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Event> list = dao.findAll(connection,pageInfo);
		
		close(connection);
		return list;
	}

	public Event findEventByNo(int event_no) {
		Event event = null;
		Connection connection = getConnection();
		
		event = dao.findEventByNo(connection,event_no);
		
//		event.setReplies(dao.getRepliesByNo)(connection,event_no));
		
//		if(event != null && !hasRead) {
//			int result = dao.updateReadCount(connection,event);
//			
//			if(result >0) {
//				commit(connection);
//			}else {
//				rollback(connection);
//			}
//		}
		close(connection);
		return event;
	}
}