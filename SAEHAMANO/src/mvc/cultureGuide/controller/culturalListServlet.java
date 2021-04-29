/*210427 22:04 이재용 (최종수정자) */
package mvc.cultureGuide.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.common.util.PageInfo;
import mvc.cultureGuide.model.service.CultureService;
import mvc.cultureGuide.model.vo.Culture;

@WebServlet("/cultural/list")
public class culturalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CultureService service = new CultureService();

    public culturalListServlet() {
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
    	
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	int page =0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Culture> list = null;
    	
    	try {
    	page = Integer.parseInt(request.getParameter("page"));
    	}catch(NumberFormatException e ) {
    		page =1;
    	}
    		
    	String regionList = request.getParameter("regionList");
    	String categoryList = request.getParameter("categoryList");
    	
    	if(regionList != null && categoryList.equals("")) {
    		
    		listCount = service.getRLCount(regionList);
        	
        	pageInfo = new PageInfo(page,10,listCount,10);
        	
        	list = service.getRLList(regionList,pageInfo);
        	
        	
    	}else if(categoryList != null && regionList.equals("")){
    		listCount = service.getCLCount(categoryList);
        	
        	pageInfo = new PageInfo(page,10,listCount,10);
        	
        	list = service.getCLList(categoryList,pageInfo);
    		
    		
    	}else if(regionList != null && categoryList != null){
    		listCount = service.getSearchCount(regionList, categoryList);
        	
        	pageInfo = new PageInfo(page,10,listCount,10);
        	
        	list = service.getSearchList(regionList, categoryList,pageInfo);
    	//	
    	}else {

    	listCount = service.getCultureCount();
    	pageInfo = new PageInfo(page,10,listCount,10);
    	list = service.getCultureList(pageInfo);
    	
    	}
    	System.out.println(regionList);
    	System.out.println(categoryList);
    	request.setAttribute("list", list);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	
    	request.getRequestDispatcher("/views/cultureGuide/culturalList.jsp").forward(request, response);
    	
	}


}