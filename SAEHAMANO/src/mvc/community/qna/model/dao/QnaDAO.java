/*210427 13:49 김예원 (최종수정자) */
/*정상 작동하는 최신버전*/
package mvc.community.qna.model.dao;

import static mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;
import mvc.community.qna.model.vo.Nickname;
import mvc.community.qna.model.vo.Qna;


public class QnaDAO {

   public int getQnaCount(Connection connection) {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT COUNT(*) FROM QNA WHERE STATUS='Y'";
         pstmt = connection.prepareStatement(query);
         rs= pstmt.executeQuery();
         
         if(rs.next()) {
            count = rs.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
            close(rs);
            close(pstmt);
         }
      return count;
   }

   public List<Qna> findAll(Connection connection, PageInfo pageInfo) {
      List<Qna> list= new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query="SELECT RNUM, QNA_NO, QNA_NAME, QNA_CONTENT, NICKNAME, QNA_VIEWS, WRITE_DATE, QNA_SORT "
               + "FROM ( "
               + "    SELECT ROWNUM AS RNUM, QNA_NO, QNA_NAME, QNA_CONTENT, NICKNAME, QNA_VIEWS, WRITE_DATE, QNA_SORT "
               + "    FROM ( "
               + "        SELECT Q.QNA_NO, Q.QNA_NAME, Q.QNA_CONTENT, N.NICKNAME, Q.QNA_VIEWS,Q.WRITE_DATE, Q.QNA_SORT "
               + "        FROM QNA Q JOIN NICKNAME_PASSWORD N ON(Q.NICK_SEQUENCE = N.NICK_SEQUENCE) "
               + "        WHERE Q.STATUS = 'Y' ORDER BY Q.QNA_NO DESC "
               + "    ) "
               + ") WHERE RNUM BETWEEN ? and ?";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setInt(1,pageInfo.getStartList());
         pstmt.setInt(2, pageInfo.getEndList());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Qna qna = new Qna();
            
            qna.setQna_no(rs.getInt("QNA_NO"));
            qna.setRowNum(rs.getInt("RNUM"));
            qna.setQna_name(rs.getString("QNA_NAME"));
            qna.setQna_nickname(rs.getString("NICKNAME"));
            qna.setWrite_date(rs.getDate("WRITE_DATE"));
            qna.setQna_views(rs.getInt("QNA_VIEWS"));
            qna.setQna_sort(rs.getString("QNA_SORT"));
            list.add(qna);
         }
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);         
      }   
      
      return list;
   }

   public int insertBoard(Connection connection, Qna qna) {
      int result = 0;
      PreparedStatement pstmt = null;
      String query = null;
      
      try {
         query = "INSERT INTO QNA VALUES(SEQ_QNA_NO.NEXTVAL,?,?,NULL,?,?,DEFAULT,DEFAULT,DEFAULT)";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setInt(1, qna.getNick_sequence());
         pstmt.setString(2, qna.getQna_sort());
         pstmt.setString(3, qna.getQna_name());
         pstmt.setString(4, qna.getQna_content());
         
         result = pstmt.executeUpdate();            
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   public int insertNickname(Connection connection, Nickname nickname) {
      int result = 0;
      PreparedStatement pstmt = null;
      String query = null;
      
      try {
         query = "INSERT INTO NICKNAME_PASSWORD VALUES(SEQ_NICK_SEQUENCE.NEXTVAL,?,?)";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, nickname.getNickname());
         pstmt.setString(2, nickname.getPassword());
         
         result = pstmt.executeUpdate();            
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public int findnick(Connection connection, Nickname nickname) {
      int seq = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT NICK_SEQUENCE "
               + "FROM( "
               + "    SELECT "
               + "        NICK_SEQUENCE "
               + "    FROM NICKNAME_PASSWORD "
               + "    ORDER BY ROWNUM DESC) "
               + "WHERE ROWNUM = 1";
               
         
         pstmt = connection.prepareStatement(query);

         
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            seq = rs.getInt("NICK_SEQUENCE");
         }         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);         
      }      
      
      return seq;
   }

   public Qna findQnaByNo(Connection connection, int qnaNo) {
      Qna qna = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query = 
               "SELECT RNUM, QNA_NO, QNA_NAME, QNA_CONTENT, NICKNAME, QNA_VIEWS, WRITE_DATE, QNA_SORT "
               + "FROM ( "
               + "    SELECT ROWNUM AS RNUM, QNA_NO, QNA_NAME, QNA_CONTENT, NICKNAME, QNA_VIEWS, WRITE_DATE, QNA_SORT "
               + "    FROM ( "
               + "        SELECT Q.QNA_NO, Q.QNA_NAME, Q.QNA_CONTENT, N.NICKNAME, Q.QNA_VIEWS,Q.WRITE_DATE, Q.QNA_SORT "
               + "        FROM QNA Q JOIN NICKNAME_PASSWORD N ON(Q.NICK_SEQUENCE = N.NICK_SEQUENCE) "
               + "        WHERE Q.STATUS = 'Y' ORDER BY Q.QNA_NO DESC "
               + "    ) "
               + ") WHERE QNA_NO=?";
         
         pstmt = connection.prepareStatement(query);
         
         pstmt.setInt(1, qnaNo);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            qna = new Qna();
            
            qna.setQna_no(rs.getInt("QNA_NO"));
            qna.setRowNum(rs.getInt("RNUM"));
            qna.setQna_name(rs.getString("QNA_NAME"));
            qna.setQna_content(rs.getString("QNA_CONTENT"));
            qna.setQna_nickname(rs.getString("NICKNAME"));
            qna.setQna_sort(rs.getString("QNA_SORT"));
            qna.setQna_views(rs.getInt("QNA_VIEWS"));
            qna.setWrite_date(rs.getDate("WRITE_DATE"));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return qna;
   }

   public int updateReadCount(Connection connection, Qna qna) {
      int result = 0;
      PreparedStatement pstmt = null;
      String query = null;
      
      
      try {
         query="UPDATE QNA SET QNA_VIEWS=? WHERE QNA_NO=?";
         pstmt = connection.prepareStatement(query);
         
         qna.setQna_views(qna.getQna_views() + 1);
         
         pstmt.setInt(1, qna.getQna_views());
         pstmt.setInt(2, qna.getQna_no());
         
         result = pstmt.executeUpdate();      
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }

   public int updateStatus(Connection connection, int qnaNo, String status) {
      int result = 0;
      PreparedStatement pstmt = null;
      String query = null;
      
      try {
         query = "UPDATE QNA SET STATUS=? WHERE QNA_NO=?";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, status);
         pstmt.setInt(2, qnaNo);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   public Nickname findConfirmedQna(Connection connection, int qnaNo) {
      Nickname nickname = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query="SELECT * "
               + "FROM NICKNAME_PASSWORD "
               + "WHERE NICK_SEQUENCE = (SELECT NICK_SEQUENCE FROM QNA WHERE QNA_NO=?)";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setInt(1,qnaNo);
      
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            nickname = new Nickname();
            
            nickname.setNick_sequence(rs.getInt("NICK_SEQUENCE"));
            nickname.setNickname(rs.getString("NICKNAME"));
            nickname.setPassword(rs.getString("NICKNAME_PASSWORD"));
            
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }   
      
      
      return nickname;
   }

   public int updateQna(Connection connection, Qna qna) {
      int result = 0;
      PreparedStatement pstmt = null;
      String query = null;
      
      
      try {
         query="UPDATE QNA SET QNA_NAME=?,QNA_CONTENT=?,WRITE_DATE=SYSDATE WHERE QNA_NO=?";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, qna.getQna_name());
         pstmt.setString(2, qna.getQna_content());
         pstmt.setInt(3, qna.getQna_no());

         result = pstmt.executeUpdate();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }

   public List<Notice> findAllNotice(Connection connection) {
      List<Notice> list= new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS, WRITE_DATE, STATUS, ORIGINAL_FILENAME "
               + "FROM ("
               + "    SELECT ROWNUM AS RNUM, NOTICE_CODE, NOTICE_NAME, ID,  NOTICE_CONTENT, NOTICE_VIEWS, WRITE_DATE, STATUS,ORIGINAL_FILENAME "
               + "    FROM ("
               + "        SELECT  N.NOTICE_CODE, N.NOTICE_NAME, A.ID, N.NOTICE_CONTENT, N.NOTICE_VIEWS, N.WRITE_DATE, N.STATUS, N.ORIGINAL_FILENAME "
               + "        FROM NOTICE N JOIN ADMIN A ON(N.NOTICE_WRITER_NO = A.NO) "
               + "        WHERE N.STATUS = 'Y'  ORDER BY N.NOTICE_CODE DESC "
               + "    ) "
               + ")";
               
         
         pstmt = connection.prepareStatement(query);
         

         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Notice notice = new Notice();
            
            notice.setNotice_code(rs.getInt("NOTICE_CODE"));
            notice.setRowNum(rs.getInt("RNUM"));
            notice.setNotice_name(rs.getString("NOTICE_NAME"));
            notice.setNotice_writer(rs.getString("ID"));
            notice.setNotice_content(rs.getString("NOTICE_CONTENT"));
            notice.setNotice_views(rs.getInt("NOTICE_VIEWS"));
            notice.setWrite_date(rs.getDate("WRITE_DATE"));
            notice.setStatus(rs.getString("STATUS"));
            notice.setOriginal_filename(rs.getString("ORIGINAL_FILENAME"));

            
            list.add(notice);
         }         
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);         
      }      
      
      return list;
   }
}
