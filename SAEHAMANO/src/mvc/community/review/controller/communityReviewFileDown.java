/*210427 12:07 김예원 (최종수정자) */
/*첨부파일 다운로드를 위한 Servlet*/
package mvc.community.review.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/community/fileDown")
public class communityReviewFileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public communityReviewFileDown() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oriname = request.getParameter("oriname");
    	String rename = request.getParameter("rename");
    	
    	System.out.println("oriname : " + oriname + ", rename : " + rename);
    	
    	/*String path = getServletContext().getRealPath("/resources/upload/review"); */
    	// 절대경로 추가 (reviewWrite / FileDown / reviewUpdate)
    	String path = "C:\\upload\\review";
    	String file = path + "/" + rename;
    	
    	File downFile = new File(file);
    	
    	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
    	
    	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
    	

    	String downName = null;
    	String header = request.getHeader("user-agent");
    	boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;
    	
    	System.out.println(header);
    	
    	if (isMSIE) {
    		downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
    	} else {    		
    		downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1");
    	}
    	

    	response.setContentType("application/octec-stream");
    	response.setHeader("Content-Disposition", "attachment;filename=" + downName);
    	
    	int read = -1;
    	
    	while ((read = bis.read()) != -1) {
    		bos.write(read);
    	}
    	
    	bos.close();
    	bis.close();
	}

}
