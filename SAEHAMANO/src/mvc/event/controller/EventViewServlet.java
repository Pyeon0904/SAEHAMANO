// 210422 09:19 이재용
package mvc.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.common.util.PageInfo;
import mvc.event.model.service.EventService;
import mvc.event.model.vo.Event;

@WebServlet("/event/viewEvent")
public class EventViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private EventService service = new EventService();

    public EventViewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Event event = null;
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		
		
    	
    	
		
		event = service.findEventByNo(event_no);
		request.setAttribute("event", event);
		
		request.getRequestDispatcher("/views/event/viewEvent.jsp").forward(request, response);
		
		
		
	}

}