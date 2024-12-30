package kr.co.mbc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class MemberForm {

	@NotBlank(message = "username은 필수 항목 입니다.")
	@Size(min = 4, message = "4자 이상 입력하세요.")
	private String username; // 유저네임
	
	@NotBlank(message = "pass는 필수 항목 입니다.")
	private String password; // 비밀번호
	
	private String password2; // 비밀번호 확인용
	
	@NotBlank(message = "name은 필수 항목 입니다.")
	private String name; // 이름
	
}
