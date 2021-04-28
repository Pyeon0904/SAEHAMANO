// 210422 09:19 이재용
package mvc.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.common.util.PageInfo;
import mvc.event.model.service.EventService;
import mvc.event.model.vo.Event;


@WebServlet("/event/eventschedule")
public class EventScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private EventService service = new EventService();
 
    public EventScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Event> list = null;
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		}catch(NumberFormatException e) {
			page =1;
		}
		listCount =service.getEventCount();
		pageInfo = new PageInfo(page,6,listCount,6);
		list =service.getEventList(pageInfo);
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		
		request.getRequestDispatcher("/views/event/scheduleEvent.jsp").forward(request, response);
	}

}