package vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor		// vo 클래스의 모든 프로퍼티를 SELECT하지 않는 경우에 필요함!
public class BookMember {
	
//	private int mem_idx;
	private String name;
	private String email;
	private String tel;
	private String password;
	
}
