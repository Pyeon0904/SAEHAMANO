//2021-05-01 22:36 이재용
package mvc.cultureGuide.model.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.common.util.PageInfo;

import static mvc.common.jdbc.JDBCTemplate.*;

public class CultureDAO {

   public int getCultureCount(Connection connection) {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT COUNT(*) FROM CULTURE WHERE STATUS='Y'";
         pstmt = connection.prepareStatement(query);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            count = rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      
      return count;
   }

   public List<Culture> findAll(Connection connection, PageInfo pageInfo) {
      List<Culture> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query = "SELECT RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "    FROM ( "
               + "        SELECT ROWNUM AS RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "        FROM ( "
               + "            SELECT CUL_NO, C.CUL_NAME, C.CUL_FIELD, I.IMG1 "
               + "            FROM CULTURE C JOIN CUL_IMAGE I USING (CUL_NO) "
               + "          WHERE C.STATUS = 'Y' "
               + "         ) "
               + "    ) "
               + "WHERE RNUM BETWEEN ? and ?";
         
         pstmt = connection.prepareStatement(query);
         
         pstmt.setInt(1, pageInfo.getStartList());
         pstmt.setInt(2, pageInfo.getEndList());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Culture culture = new Culture();
            
            culture.setCul_no(rs.getString("CUL_NO"));
            culture.setRowNum(rs.getInt("RNUM"));
            culture.setCul_name(rs.getString("CUL_NAME"));
            culture.setCul_field(rs.getString("CUL_FIELD"));
            //culture.setStatus(rs.getString("STATUS"));
            culture.setImg1(rs.getString("IMG1"));
            
            list.add(culture);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }

   public Culture findCultureByNo(Connection connection, String cul_no) {
      Culture culture = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT  CUL_NO, C.CUL_LIKE, C.CUL_NAME, C.CUL_REGION, C.CUL_LOCATION, C.CUL_INVALID,"
               + "    C.DEG_DATE, C.CUL_ERA, C.CUL_CATEGORY, C.CUL_DESCRIPTION, I.IMG1, I.IMG2, I.IMG3 "
               + "    FROM CULTURE C JOIN CUL_IMAGE I USING(CUL_NO) "
               + "    WHERE STATUS = 'Y' AND CUL_NO= ?";
         pstmt= connection.prepareStatement(query);
         
         pstmt.setString(1, cul_no);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            culture = new Culture();
            
            culture.setCul_no(rs.getString("CUL_NO"));
            culture.setCul_like(rs.getInt("CUL_LIKE"));
            culture.setCul_name(rs.getString("CUL_NAME"));
            culture.setCul_region(rs.getString("CUL_REGION"));
            culture.setCul_location(rs.getString("CUL_LOCATION"));
            culture.setCul_invalid(rs.getString("CUL_INVALID"));
            culture.setDeg_date(rs.getString("DEG_DATE"));
            culture.setCul_era(rs.getString("CUL_ERA"));
            culture.setCul_category(rs.getString("CUL_CATEGORY"));
            culture.setCul_description(rs.getString("CUL_DESCRIPTION"));
            culture.setImg1(rs.getString("IMG1"));
            culture.setImg2(rs.getString("IMG2"));
            culture.setImg3(rs.getString("IMG3"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      finally {
         close(rs);
         close(pstmt);
      }
      return culture;
   }

   public List<Culture> findRLSearch(Connection connection, String regionList, PageInfo pageInfo) {
      List<Culture> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query = "SELECT RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                   FROM ( "
               + "                       SELECT ROWNUM AS RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                       FROM ( "
               + "                           SELECT CUL_NO, C.CUL_NAME, C.CUL_FIELD, I.IMG1 "
               + "                           FROM CULTURE C JOIN CUL_IMAGE I USING (CUL_NO) WHERE C.CUL_REGION = ? "
               + "                        ) "
               + "                   ) "
               + "               WHERE RNUM BETWEEN ? and ?";
         
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, regionList);
         pstmt.setInt(2, pageInfo.getStartList());
         pstmt.setInt(3, pageInfo.getEndList());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Culture culture = new Culture();
            
            culture.setCul_no(rs.getString("CUL_NO"));
            culture.setRowNum(rs.getInt("RNUM"));
            culture.setCul_name(rs.getString("CUL_NAME"));
            culture.setCul_field(rs.getString("CUL_FIELD"));
            culture.setImg1(rs.getString("IMG1"));
            
            list.add(culture);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }

   public int getRLCount(Connection connection,String regionList) {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT COUNT(*) FROM CULTURE where cul_region=?";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, regionList);
         
         rs = pstmt.executeQuery();
         if(rs.next()) {
            count = rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      
      return count;
   }
//
   public int getCLCount(Connection connection, String categoryList) {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT COUNT(*) FROM CULTURE where CUL_CATEGORY=?";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, categoryList);
         
         rs = pstmt.executeQuery();
         if(rs.next()) {
            count = rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      
      return count;
   }

   public List<Culture> findCLSearch(Connection connection, String categoryList, PageInfo pageInfo) {
      List<Culture> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query = "SELECT RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                   FROM ( "
               + "                       SELECT ROWNUM AS RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                       FROM ( "
               + "                           SELECT CUL_NO, C.CUL_NAME, C.CUL_FIELD, I.IMG1 "
               + "                           FROM CULTURE C JOIN CUL_IMAGE I USING (CUL_NO) WHERE C.CUL_CATEGORY = ? "
               + "                        ) "
               + "                   ) "
               + "               WHERE RNUM BETWEEN ? and ?";
         
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, categoryList);
         pstmt.setInt(2, pageInfo.getStartList());
         pstmt.setInt(3, pageInfo.getEndList());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Culture culture = new Culture();
            
            culture.setCul_no(rs.getString("CUL_NO"));
            culture.setRowNum(rs.getInt("RNUM"));
            culture.setCul_name(rs.getString("CUL_NAME"));
            culture.setCul_field(rs.getString("CUL_FIELD"));
            culture.setImg1(rs.getString("IMG1"));
            
            list.add(culture);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }

   public int getSeachCount(Connection connection, String regionList, String categoryList) {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      try {
         query = "SELECT COUNT(*) FROM CULTURE WHERE CUL_REGION=? AND CUL_CATEGORY=? ";
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, regionList);
         pstmt.setString(2, categoryList);
         
         rs = pstmt.executeQuery();
         if(rs.next()) {
            count = rs.getInt(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      
      return count;
   }

   public List<Culture> findSearch(Connection connection, String regionList, String categoryList, PageInfo pageInfo) {
      List<Culture> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String query = null;
      
      
      try {
         query = "SELECT RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                   FROM ( "
               + "                       SELECT ROWNUM AS RNUM, CUL_NO, CUL_NAME, CUL_FIELD, IMG1 "
               + "                       FROM ( "
               + "                           SELECT CUL_NO, C.CUL_NAME, C.CUL_FIELD, I.IMG1 "
               + "                           FROM CULTURE C JOIN CUL_IMAGE I USING (CUL_NO) WHERE C.CUL_REGION = ? AND C.CUL_CATEGORY = ? "
               + "                        ) "
               + "                   ) "
               + "               WHERE RNUM BETWEEN ? and ?";
         
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, regionList);
         pstmt.setString(2, categoryList);
         pstmt.setInt(3, pageInfo.getStartList());
         pstmt.setInt(4, pageInfo.getEndList());
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Culture culture = new Culture();
            
            culture.setCul_no(rs.getString("CUL_NO"));
            culture.setRowNum(rs.getInt("RNUM"));
            culture.setCul_name(rs.getString("CUL_NAME"));
            culture.setCul_field(rs.getString("CUL_FIELD"));
            culture.setImg1(rs.getString("IMG1"));
            
            list.add(culture);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return list;
   }


}