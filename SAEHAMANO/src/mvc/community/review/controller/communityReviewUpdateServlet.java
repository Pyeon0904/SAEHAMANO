/*210427 22:35 김예원 (최종수정자) */
/*수정 시 문화재명 입력 추가*/
package mvc.community.review.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import mvc.common.util.FileRename;
import mvc.community.review.model.service.ReviewService;
import mvc.community.review.model.vo.Review;

@WebServlet("/community/review/update")
public class communityReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService service = new ReviewService();

	public communityReviewUpdateServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/views/community/reviewUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		Review review = new Review();
		
		String path = getServletContext().getRealPath("/resources/upload/review");
    	int maxSize = 10485760;    	
    	String encoding = "UTF-8"; 
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
    	String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String cul_name = mr.getParameter("cul_name");
		int re_no = Integer.parseInt(mr.getParameter("re_no"));

		review.setRe_no(re_no);
		review.setRe_name(title);
		review.setRe_content(content);
		/* 0427 22:35 by.예원 선택한 문화재명 입력받아 DB에 저장 */
		review.setCul_name(cul_name);
		review.setOriginal_filename(mr.getParameter("originalFileName"));
		review.setRenamed_filename(mr.getParameter("renameFileName"));
		
		
		String originalFileName = mr.getOriginalFileName("reloadFile");
		String renamedFileName = mr.getFilesystemName("reloadFile");
		
		if(originalFileName != null && !originalFileName.equals("")) {
			String deleteFilePath = path + "/" + review.getRenamed_filename();
			
			deleteFile(deleteFilePath);
			
			review.setOriginal_filename(originalFileName);
			review.setRenamed_filename(renamedFileName);
		}
		
		result = service.save(review);

		if (result > 0) {
			request.setAttribute("msg", "수정되었습니다.");
		} else {
			request.setAttribute("msg", "수정에 실패하였습니다.");

		}
		request.setAttribute("location", "/community/review/view?reviewNo=" + review.getRe_no());
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}
	private void deleteFile(String path) {
		File file = new File(path);
		
		if(file.exists()) {
			file.delete();
		}
	}

	
}
