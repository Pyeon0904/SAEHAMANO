/*210422 09:30 김예원 (최종수정자) */
package mvc.community.qna.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Nickname {
	private int nick_sequence;
	
	private String nickname;
	
	private String password;
}
