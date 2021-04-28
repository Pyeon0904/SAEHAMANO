/*210426 10:46 이재용 (최종수정자) */
package mvc.event.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import mvc.Intro.model.vo.Notice;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	
	private int event_no;

	private int rowNum;

	private String event_name;
	
	private String event_start_date;
	
	private String event_last_date;
	
	private String event_content;
	
	private String event_insta;
	
	private String event_home;
	
	private String event_place;
	
	private String event_hosting;
	
	private String status;
	
	private String event_img;
	
	private String original_FileName;
	
	private String renamed_FileName;
	

}