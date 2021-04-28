/*210427 22:27 김예원 (최종수정자) */
/*findCulture() 으로 문화재 이름 출력*/
package mvc.community.review.model.service;

import java.sql.Connection;
import java.util.List;


import static mvc.common.jdbc.JDBCTemplate.*;

import mvc.common.util.PageInfo;
import mvc.community.review.model.vo.Nickname;
import mvc.community.review.model.dao.ReviewDAO;
import mvc.community.review.model.vo.Review;



public class ReviewService {
	
	private ReviewDAO dao = new ReviewDAO();

	public int getReviewCount() {
		Connection connection = getConnection();
		int count = dao.getReviewCount(connection);

		System.out.println("Review : "+ count);
		
		return count;
	}

	public List<Review> getReviewList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Review> list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public Review findReviewByNo(int reviewNo, boolean hasRead) {
		Review review = null;
		Connection connection = getConnection();
		
		review = dao.findReviewByNo(connection,reviewNo);
		
		if(review != null && !hasRead) {
			int result = dao.updateReadCount(connection,review);
			
			
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		return review;
	}
	
	
	public Review confirmedReview(int reviewNo, String password) {
		Review review = null;
		Connection connection = getConnection();
		
		Nickname nickname = dao.findConfirmedReview(connection, reviewNo);
		
		 
		if(nickname != null && nickname.getPassword().equals(password)) {
			System.out.println("비밀번호 동일");
			review = dao.findReviewByNo(connection, reviewNo);
			return review;
		}else {
			System.out.println("비밀번호 동일하지 않음");

			return null;
		}
		
	}
/*
	public int update(Review review) {
		int result =0;
		Connection connection = getConnection();
		
		if(review.getRe_no() != 0) {
			result = dao.updateReview(connection, review);
		} 
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
*/
	public int saveNickname(mvc.community.review.model.vo.Nickname nickname) {		
		int result = 0;
		Connection connection = getConnection();

		result = dao.insertNickname(connection, nickname);
		
		if(result > 0 ) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int findnick(Nickname nickname) {
		Connection connection = getConnection();
		int seq = dao.findnick(connection, nickname);
		
		close(connection);
		
		return seq;
	}

	public int save(Review review) {
		int result = 0;
		Connection connection = getConnection();

		if(review.getRe_no() != 0) {
			result = dao.updateBoard(connection, review);
		} else {
			result = dao.insertBoard(connection, review);
		}
		
		
		if(result > 0 ) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int delete(int reviewNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateStatus(connection, reviewNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	/* 0427/22:28 by.예원 문화재명을 전부 가져오기 위한 getCulture() 함수 추가 */ 
	public List<String> getCulture() {
		Connection connection = getConnection();
		List<String> list = dao.findCulture(connection);
		
		close(connection);
		
		return list;
	}

}
