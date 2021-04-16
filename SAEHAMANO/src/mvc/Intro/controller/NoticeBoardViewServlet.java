/*210415 22:48 김예원 (최종수정자) */
package mvc.Intro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.Intro.model.service.NoticeService;
import mvc.Intro.model.vo.Notice;


@WebServlet("/Intro/NoticeView")
public class NoticeBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private NoticeService service = new NoticeService();

    public NoticeBoardViewServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice notice = new Notice();
    	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		
		
    	notice = service.findBoardByNo(noticeNo);
    	request.setAttribute("notice", notice);
		request.getRequestDispatcher("/views/Intro/NoticeView.jsp").forward(request, response);
	}


	
}
