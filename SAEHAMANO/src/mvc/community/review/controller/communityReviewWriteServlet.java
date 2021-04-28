/*210427 22:32 김예원 (최종수정자) */
/*문화재 이름 출력*/
package mvc.community.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.buf.StringUtils;

import com.oreilly.servlet.MultipartRequest;

import mvc.common.util.EncryptUtil;
import mvc.common.util.FileRename;
import mvc.community.review.model.service.ReviewService;
import mvc.community.review.model.vo.Nickname;
import mvc.community.review.model.vo.Review;

@WebServlet(name="writeReview", urlPatterns="/community/review/write")
public class communityReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReviewService service = new ReviewService();
	
    public communityReviewWriteServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		/* 0427 22:32 by.예원 문화재명들을 "","" 형태로 표현하기 위한 변환식들 */
		List<String> culture = null;
		culture = service.getCulture();
		
		String[] cultureArr = culture.toArray(new String[culture.size()]);
		
		String cultureString = StringUtils.join(culture,',');
		
		
		request.setAttribute("cultureString", cultureString);
		request.getRequestDispatcher("/views/community/reviewWrite.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review review = new Review();
		Nickname nickname = new Nickname();
		

		
		String path = getServletContext().getRealPath("/resources/upload/review");
		int maxSize = 10485760;
    	String encoding = "UTF-8"; 
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		

    	
		/* 닉네임, 비밀번호 */
		String writer = mr.getParameter("writer");
		/* MultipartRequest를 사용하기 때문에 암호화 필터를 타지 못해 여기서 암호화 해줌 */
		String password = EncryptUtil.oneWayEnc(mr.getParameter("password"), "SHA-256");
		
		System.out.println(password);
		
		nickname.setNickname(writer);
		nickname.setPassword(password);

		int result1 = service.saveNickname(nickname);
		int nickseq = service.findnick(nickname);
    	
		
		/* 제목, 본문, 첨부파일 */
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String cul_name= mr.getParameter("cul_name");
		String originalFileName = mr.getOriginalFileName("upfile");
		String renamedFileName = mr.getFilesystemName("upfile");
		
		review.setRe_name(title);
		review.setNick_sequence(nickseq);
		review.setCul_name(cul_name);
		review.setRe_content(content);
		review.setOriginal_filename(originalFileName);
		review.setRenamed_filename(renamedFileName);
		
		
		
		int result2 = service.save(review);
		
		if(result2 > 0) {
     		request.setAttribute("msg", "review 등록 성공");
     		request.setAttribute("location", "/community/review");
		} else {
     		request.setAttribute("msg", "review 등록 실패");
     		request.setAttribute("location", "/community/review");
		}
    		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
