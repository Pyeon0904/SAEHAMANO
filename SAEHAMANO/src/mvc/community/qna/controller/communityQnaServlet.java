/*210426 13:37 김예원 (최종수정자) */
package mvc.community.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.Intro.model.service.NoticeService;
import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;
import mvc.community.qna.model.service.QnaService;
import mvc.community.qna.model.vo.Qna;



@WebServlet("/community/qna")
public class communityQnaServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   private QnaService service = new QnaService();

   
    public communityQnaServlet() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int page = 0;
      int listCount=0;
      PageInfo pageInfo = null;
      List<Qna> qna = null;
      
      List<Notice> list = null;
      
      try{
         page = Integer.parseInt(request.getParameter("page"));
      } catch(NumberFormatException e) {
         page = 1;
      }
      
      listCount = service.getQnaCount();
      
      
      pageInfo = new PageInfo(page,10,listCount,10);
      qna = service.getQnaList(pageInfo);
      list = service.getNoticeList();
            
      request.setAttribute("qna",qna);
      request.setAttribute("pageInfo", pageInfo);
      request.setAttribute("list", list);
      request.getRequestDispatcher("/views/community/communityQna.jsp").forward(request, response);
   }

}