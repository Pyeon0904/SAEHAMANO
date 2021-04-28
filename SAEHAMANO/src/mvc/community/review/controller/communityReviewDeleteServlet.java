/*210426 00:34 김예원 (최종수정자) */
package mvc.community.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.community.review.model.service.ReviewService;


@WebServlet("/community/review/delete")
public class communityReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReviewService service = new ReviewService();
    public communityReviewDeleteServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int result = service.delete(reviewNo);
		

		if(result > 0) {
     		request.setAttribute("msg", "게시글 삭제 성공");
     		request.setAttribute("location", "/community/review");
		} else {
     		request.setAttribute("msg", "게시글 삭제 실패");
     		request.setAttribute("location", "/community/review");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}


}
