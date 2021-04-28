/*210426 00:24 김예원 (최종수정자) */
package mvc.community.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.community.qna.model.service.QnaService;
import mvc.community.qna.model.vo.Qna;


@WebServlet("/community/qna/view")
public class communityQnaViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private QnaService service = new QnaService();

    public communityQnaViewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Qna qna = new Qna();
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));

    	Cookie[] cookies = request.getCookies();
    	String qnaHistory = "";
    	boolean hasRead = false;
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		
    		for(Cookie cookie : cookies) {
    			name = cookie.getName();
    			value = cookie.getValue();

    			if("qnaHistory".equals(name)) {
    				qnaHistory = value;
    				
    				if(qnaHistory.contains("|" + qnaNo + "|")) {

    					hasRead = true;
    					
    					break;
    				}
    			}
    		}    		
    	}
    	
    	if(!hasRead) {
    		Cookie cookie = new Cookie("qnaHistory", qnaHistory + "|" + qnaNo + "|");
    		
    		cookie.setMaxAge(-1); 
    		response.addCookie(cookie);
    	}
		
    	
    	qna = service.findBoardByNo(qnaNo,hasRead);
    	
    	
    	request.setAttribute("qna", qna);
		request.getRequestDispatcher("/views/community/qnaView.jsp").forward(request, response);
	}



}
