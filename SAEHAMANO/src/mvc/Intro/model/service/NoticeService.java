/*210426 10:07 김예원 (최종수정자) */
package mvc.Intro.model.service;

import static mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;


import mvc.Intro.model.dao.NoticeDAO;
import mvc.Intro.model.vo.Notice;
import mvc.common.util.PageInfo;

public class NoticeService {
   
   private NoticeDAO dao = new NoticeDAO();

   public int getNoticeCount() {
      Connection connection = getConnection();
      int count = dao.getNoticeCount(connection);
      
      return count;

   }

   public List<Notice> getNoticeList(PageInfo pageInfo) {
      Connection connection = getConnection();
      List<Notice> list = dao.findAll(connection, pageInfo);
      
      close(connection);
      
      return list;
   }

   public int save(Notice notice) {
      int result = 0;
      Connection connection = getConnection();

      if(notice.getNotice_code() != 0) {
         result = dao.updateBoard(connection, notice);
      } else {
         result = dao.insertBoard(connection, notice);
      }
      

      if(result > 0) {
         commit(connection);
      } else {
         rollback(connection);
      }
      
      close(connection);
      
      return result;
   }

   public Notice findBoardByNo(int noticeNo,boolean hasRead) {
      Notice notice = null;
      Connection connection = getConnection();
      
      notice = dao.findBoardByNo(connection,noticeNo);
      
      if(notice != null && !hasRead) {
         int result = dao.updateReadCount(connection, notice);
         
         
         if(result > 0) {
            commit(connection);
         } else {
            rollback(connection);
         }
      }
      
      close(connection);
      
      return notice;
   }

   public int delete(int noticeNo) {
      int result = 0;
      Connection connection = getConnection();
      
      result = dao.updateStatus(connection, noticeNo, "N");
      
      if(result > 0) {
         commit(connection);
      } else {
         rollback(connection);
      }
      
      close(connection);
      
      return result;
   }
   
}