/*210427 22:27 김예원 (최종수정자) */
/*문화재명을 저장할 수 있는 컬럼 추가*/
package mvc.community.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int re_no;
	
	private int re_like;
	
	/* 0427/22:30 by.예원 문화재명을 저장할 수 있는 컬럼 추가 */
	private String cul_name;
	
	private int  nick_sequence;
	
	private String review_nickname;
	
	private String re_name;
	
	private String re_content;
	
	private int re_views;
	
	private int rowNum;
	
	private Date write_date;
	
	private String status;
	
	private String original_filename;
	
	private String renamed_filename;
	
}
