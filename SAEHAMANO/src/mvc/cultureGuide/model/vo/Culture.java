//2021-04-27 11:44 이재용

package mvc.cultureGuide.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Culture {
	private String cul_no;
	
	private int cul_like;
	
	private int rowNum;
	
	private String cul_name;
	
	private String cul_region;
	
	private String cul_location;
	
	private String cul_invalid;
	
	private String deg_date;
	
	private String cul_era;
	
	private String cul_category;
	
	private String cul_field;
	
	private String cul_description;
	
	private int img_no;
	
	private String img1;
	
	private String img2;
	
	private String img3;

}
