/*210426 00:34 김예원 (최종수정자) */
package mvc.community.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;
import mvc.community.review.model.service.ReviewService;
import mvc.community.review.model.vo.Review;



@WebServlet("/community/review")
public class communityReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReviewService service = new ReviewService();
	
    public communityReviewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = 0;
		int listCount=0;
		PageInfo pageInfo = null;
		List<Review> review = null;
		
		try{
			page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = service.getReviewCount();
		
		
		pageInfo = new PageInfo(page,10,listCount,10);
		review = service.getReviewList(pageInfo);
				
		request.setAttribute("review",review);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/views/community/communityReview.jsp").forward(request, response);

	}

	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = 0;
		int listCount=0;
		PageInfo pageInfo = null;
		List<Review> list = null;
		
		try{
			page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = service.getReviewCount();
		
		
		pageInfo = new PageInfo(page,10,listCount,10);
		list = service.getReviewList(pageInfo);
				
		request.setAttribute("list",list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/views/community/communityReview.jsp").forward(request, response);
	}
	 */
}
