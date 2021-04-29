//2021-04-27 22:00 이재용

package mvc.cultureGuide.model.service;

import java.sql.Connection;
import java.util.List;

import mvc.common.util.PageInfo;
import mvc.cultureGuide.model.vo.Culture;
import mvc.cultureGuide.model.vo.CultureDAO;

import static mvc.common.jdbc.JDBCTemplate.*;

public class CultureService {
	
	private CultureDAO dao = new CultureDAO();

	public int getCultureCount() {
		Connection connection = getConnection();
		
		int count = dao.getCultureCount(connection);
		
		close(connection);
		return count;
	}

	public List<Culture> getCultureList(PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Culture> list = dao.findAll(connection,pageInfo);
		
		close(connection);
		
		return list;
	}

	public Culture findCultureByNo(String cul_no) {
		Culture culture = null;
		Connection connection = getConnection();
		
		culture = dao.findCultureByNo(connection,cul_no);
		
		close(connection);
		return culture;
	}

	public List<Culture> getRLList(String regionList,PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Culture> list = dao.findRLSearch(connection,regionList,pageInfo);
		
		close(connection);
		
		return list;
	}
//
	public int getRLCount(String regionList) {
		Connection connection = getConnection();
		
		int count = dao.getRLCount(connection,regionList);
		
		close(connection);
		return count;
	}

	public int getCLCount(String categoryList) {
		Connection connection = getConnection();
		
		int count = dao.getCLCount(connection,categoryList);
		
		close(connection);
		return count;
	}

	public List<Culture> getCLList(String categoryList, PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Culture> list = dao.findCLSearch(connection,categoryList,pageInfo);
		
		close(connection);
		
		return list;
	}

	public int getSearchCount(String regionList, String categoryList) {
		Connection connection = getConnection();
		
		int count = dao.getSeachCount(connection, regionList, categoryList);
		
		close(connection);
		return count;
	}

	public List<Culture> getSearchList(String regionList, String categoryList, PageInfo pageInfo) {
		Connection connection = getConnection();
		List<Culture> list = dao.findSearch(connection,regionList, categoryList,pageInfo);
		
		close(connection);
		
		return list;
	}

}
