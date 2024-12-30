package kr.co.mbc.dto;

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
public class MemberResponse {

	private String username; // 유저네임
	
	private String name; // 이름
	
	private String profileImg; // 프로필이미지
	
	private String createDate; // 생성일

	private String psaaword;
}
