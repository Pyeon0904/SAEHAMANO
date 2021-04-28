/*210420 12:29 김예원 (최종수정자) */
package mvc.community.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/community/main")
public class communityMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public communityMain() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("/views/community/communityMain.jsp").forward(request, response);
		
		String sPath=request.getContextPath();
    	response.sendRedirect(sPath+"/views/community/communityMain.jsp");
	}


}
