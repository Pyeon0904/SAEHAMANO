/*210426 00:34 김예원 (최종수정자) */
package mvc.community.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.community.review.model.service.ReviewService;
import mvc.community.review.model.vo.Review;


@WebServlet(name = "confirmReviewPwd", urlPatterns="/community/review/confirmPwd")
public class communityReviewConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService service = new ReviewService();
	
    public communityReviewConfirmServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		request.getRequestDispatcher("/views/community/confirmPwd.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("No"));
		String password = request.getParameter("password");
		
		
		Review confirmedReview = service.confirmedReview(reviewNo,password);
		
		if(confirmedReview != null) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("confirmedReview", confirmedReview);
			
			response.sendRedirect(request.getContextPath() + "/community/review/update");
			
		}else {

			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

		

	}

}
