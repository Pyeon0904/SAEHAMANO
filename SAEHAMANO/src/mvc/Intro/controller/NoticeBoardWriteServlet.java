/*210416 22:07 김예원 (최종수정자) */
package mvc.Intro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.Intro.model.service.NoticeService;
import mvc.Intro.model.vo.Notice;

@WebServlet("/Intro/NoticeWrite")
public class NoticeBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private NoticeService service = new NoticeService();

	public NoticeBoardWriteServlet() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String sPath=request.getContextPath();
		 * response.sendRedirect(sPath+"/views/Intro/NoticeWrite.jsp");
		 */
		request.getRequestDispatcher("/views/Intro/NoticeWrite.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		 String title = request.getParameter("title"); 
		 String content = request.getParameter("content");
		 
		 //System.out.println("title : " + title +"/content : " + content);
		 
		 Notice notice = new Notice();
		 
		 notice.setNotice_name(title); 
		 notice.setNotice_sort("1");
		 notice.setNotice_writer_no(21); 
		 notice.setNotice_content(content);
		 
		 service.save(notice);
		 
			
		 String sPath=request.getContextPath();
		 response.sendRedirect(sPath+"/");
			 
		 
		 //request.getRequestDispatcher("/").forward(request, response);


	}

}
