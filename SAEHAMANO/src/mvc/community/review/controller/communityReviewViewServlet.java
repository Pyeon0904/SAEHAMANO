/*210427 12:07 김예원 (최종수정자) */
/*(수정x) 정상 작동하는 최신버전*/
package mvc.community.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.community.review.model.service.ReviewService;
import mvc.community.review.model.vo.Review;

@WebServlet("/community/review/view")
public class communityReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService service = new ReviewService();

	public communityReviewViewServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Review review = new Review();
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

		Cookie[] cookies = request.getCookies();
		String reviewHistory = "";
		boolean hasRead = false;

		if (cookies != null) {
			String name = null;
			String value = null;

			for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();

				if ("reviewHistory".equals(name)) {
					reviewHistory = value;

					if (reviewHistory.contains("|" + reviewNo + "|")) {

						hasRead = true;

						break;
					}
				}
			}
		}

		if (!hasRead) {
			Cookie cookie = new Cookie("reviewHistory", reviewHistory + "|" + reviewNo + "|");

			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}

		review = service.findReviewByNo(reviewNo, hasRead);
		
		request.setAttribute("review", review);
		request.getRequestDispatcher("/views/community/reviewView.jsp").forward(request, response);
		
	}

}
