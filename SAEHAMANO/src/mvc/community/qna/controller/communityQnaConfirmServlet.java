/*210426 00:24 김예원 (최종수정자) */
package mvc.community.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.community.qna.model.service.QnaService;
import mvc.community.qna.model.vo.Qna;


@WebServlet(name = "confirmQnaPwd", urlPatterns="/community/qna/confirmPwd")
public class communityQnaConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private QnaService service = new QnaService();

    public communityQnaConfirmServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/community/confirmPwd.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QnaNo = Integer.parseInt(request.getParameter("No"));
		String password = request.getParameter("password");
		
		Qna confirmedQna = service.confirmedQna(QnaNo, password);
		
		if(confirmedQna != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("confirmedQna", confirmedQna);
			
			response.sendRedirect(request.getContextPath() + "/community/qna/update");
		}else {

			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			
			//수정 요망
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}

}
