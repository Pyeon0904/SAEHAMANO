/*210426 10:07 김예원 (최종수정자) */
package mvc.Intro.model.vo;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int notice_code;
	
	private int rowNum;
	
	private String notice_sort;
	
	private String notice_name;
	
	private String notice_content;
	
	private String notice_writer;
	
	private int notice_views;
	
	private int notice_writer_no;
	
	private Date write_date;
	
	private String status;
	
	private String original_filename;
	
	private String renamed_filename;
}
