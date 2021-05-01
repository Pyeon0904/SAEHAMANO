/*210416 22:07 김예원 (최종수정자) */
package mvc.Intro.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.common.util.PageInfo;
import mvc.Intro.model.service.NoticeService;
import mvc.Intro.model.vo.Notice;

@WebServlet("/Intro/NoticeBoard")
public class NoticeBoardListServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
   private NoticeService service = new NoticeService();

    public NoticeBoardListServlet() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int page = 0;
      int listCount=0;
      PageInfo pageInfo = null;
      List<Notice> list = null;
      
      try{
         page = Integer.parseInt(request.getParameter("page"));
      } catch(NumberFormatException e) {
         page = 1;
      }
      
      listCount = service.getNoticeCount();
      
      
      pageInfo = new PageInfo(page,10,listCount,10);
      list = service.getNoticeList(pageInfo);
            
      request.setAttribute("list",list);
      request.setAttribute("pageInfo", pageInfo);
      request.getRequestDispatcher("/views/Intro/NoticeBoard.jsp").forward(request, response);
   }
}