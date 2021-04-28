/*210426 00:24 김예원 (최종수정자) */
package mvc.community.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.community.qna.model.service.QnaService;


@WebServlet("/community/qna/delete")
public class communityQnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private QnaService service = new QnaService();
	
    public communityQnaDeleteServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int result = service.delete(qnaNo);
		
		if(result > 0) {
     		request.setAttribute("msg", "게시글 삭제 성공");
     		request.setAttribute("location", "/community/qna");
		} else {
     		request.setAttribute("msg", "게시글 삭제 실패");
     		request.setAttribute("location", "/community/qna");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
