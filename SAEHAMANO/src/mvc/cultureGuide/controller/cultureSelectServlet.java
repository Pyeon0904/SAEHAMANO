/*210420 12:29 김예원 (최종수정자) */
package mvc.cultureGuide.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cultural/select")
public class cultureSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public cultureSelectServlet() {

    }
//
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String sPath=request.getContextPath();
    	response.sendRedirect(sPath+"/views/cultureGuide/cultureSelect.jsp");
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}