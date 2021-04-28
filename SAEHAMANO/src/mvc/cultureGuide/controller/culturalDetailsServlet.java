/*210427 17:19 이재용 (최종수정자) */
package mvc.cultureGuide.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.cultureGuide.model.service.CultureService;
import mvc.cultureGuide.model.vo.Culture;


@WebServlet("/curtural/details")
public class culturalDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CultureService service = new CultureService();
	
    public culturalDetailsServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Culture culture = null;
    	String cul_no = request.getParameter("cul_no");
    	
    	culture = service.findCultureByNo(cul_no);
    	
    	request.setAttribute("culture", culture);
    	
    	request.getRequestDispatcher("/views/cultureGuide/culturalDetails.jsp").forward(request, response);
	
    	
    }

}