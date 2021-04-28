/*210426 00:34 김예원 (최종수정자) */
package mvc.community.qna.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {

	private int qna_no;
	
	private int nick_sequence;
	
	private String qna_nickname;
	
	private String qna_sort;
	
	private int qna_notice_code;
	
	private String qna_name;
	
	private String qna_content;
	
	private Date write_date;
	
	private String status;
	
	private int qna_views;
	
	private int rowNum;

}
