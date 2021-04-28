/*210427 13:49 김예원 (최종수정자) */
/*정상 작동하는 최신버전*/
package mvc.community.qna.model.service;

import static mvc.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;
import mvc.community.qna.model.dao.QnaDAO;
import mvc.community.qna.model.vo.Nickname;
import mvc.community.qna.model.vo.Qna;
import mvc.community.review.model.vo.Review;


public class QnaService {

	private QnaDAO dao = new QnaDAO();
	
	public int getQnaCount() {
		Connection connection = getConnection();
		int count = dao.getQnaCount(connection);

		System.out.println("Q&A : " + count);
		
		return count;
	}

	public List<Qna> getQnaList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Qna> list = dao.findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int save(Qna qna) {
		int result = 0;
		Connection connection = getConnection();

		result = dao.insertBoard(connection, qna);
		
		if(result > 0 ) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int saveNickname(Nickname nickname) {
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

	public Qna findBoardByNo(int qnaNo, boolean hasRead) {
		Qna qna = null;
		Connection connection = getConnection();
		
		qna = dao.findQnaByNo(connection,qnaNo);
		
		if(qna != null && !hasRead) {
			int result = dao.updateReadCount(connection, qna);
			
			
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);
		
		return qna;
	}

	public int delete(int qnaNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateStatus(connection, qnaNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public Qna confirmedQna(int qnaNo, String password) {

		Qna qna = null;
		Connection connection = getConnection();
		
		Nickname nickname = dao.findConfirmedQna(connection, qnaNo);
		
		
		 
		if(nickname != null && nickname.getPassword().equals(password)) {
			System.out.println("비밀번호 발견");
			qna = dao.findQnaByNo(connection, qnaNo);
			return qna;
		}else {
			System.out.println("비밀번호 동일하지 않음");

			return null;
		}
	}

	public int update(Qna qna) {
		int result =0;
		Connection connection = getConnection();
		
		if(qna.getQna_no() != 0) {
			result = dao.updateQna(connection, qna);
		} 
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	

}
