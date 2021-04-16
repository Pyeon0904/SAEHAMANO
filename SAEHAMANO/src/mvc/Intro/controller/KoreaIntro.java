// 210411 12:10 김예원 (최종수정자) 
package mvc.Intro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Intro/KoreaIntro")
public class KoreaIntro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public KoreaIntro() {

    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String sPath=request.getContextPath();
    	response.sendRedirect(sPath+"/views/Intro/KoreaIntro.jsp");

		/*
		 * 
		 * request.getRequestDispatcher("/views/Intro/KoreaIntro.jsp").forward(request,response);
		 */
    	

	}
}
