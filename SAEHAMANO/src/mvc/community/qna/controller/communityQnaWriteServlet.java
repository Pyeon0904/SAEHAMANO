/*210426 13:34 김예원 (최종수정자) */
package mvc.community.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mvc.common.util.FileRename;
import mvc.community.qna.model.service.QnaService;
import mvc.community.qna.model.vo.Nickname;
import mvc.community.qna.model.vo.Qna;

import com.oreilly.servlet.MultipartRequest;



@WebServlet(name="writeQna" ,urlPatterns = "/community/qna/write")
public class communityQnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QnaService service = new QnaService();
	
    public communityQnaWriteServlet() {
    	
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/community/qnaWrite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		Qna qna = new Qna();
		Nickname nickname = new Nickname();
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		System.out.println(writer);
		
		nickname.setNickname(writer);
		nickname.setPassword(password);
		
		int result1 = service.saveNickname(nickname);
		int nickseq = service.findnick(nickname);
		
		qna.setQna_name(title);
		qna.setQna_content(content);
		qna.setNick_sequence(nickseq);
		qna.setQna_sort("question");
		 

		int result2 = service.save(qna);
		
		if(result2 > 0) {
     		request.setAttribute("msg", "Q&A 등록 성공");
     		request.setAttribute("location", "/community/qna");
		} else {
     		request.setAttribute("msg", "Q&A 등록 실패");
     		request.setAttribute("location", "/community/qna");
		}
    		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
