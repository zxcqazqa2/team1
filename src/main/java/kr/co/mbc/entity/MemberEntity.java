package kr.co.mbc.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import kr.co.mbc.dto.MemberForm;
import kr.co.mbc.dto.MemberResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "member")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class MemberEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false, unique = true)
	private String username; // 유저네임
	
	@Column(nullable = false)
	private String password; // 비밀번호
	
	@Column(nullable = false)
	private String name; // 이름
	
	private String createDate; // 생성일
	
	private String profileImg; // 프로필이미지
	

	
	public static MemberResponse toMemberResponse(MemberEntity memberEntity) {
		MemberResponse memberResponse = MemberResponse.builder()
				.username(memberEntity.getUsername())
				.name(memberEntity.getName())
				.profileImg(memberEntity.getProfileImg())
				.createDate(memberEntity.getCreateDate())
				.build();
		return memberResponse;
	}

	public static MemberEntity toMemberEntity(MemberForm memberForm) {
		MemberEntity memberEntity = MemberEntity.builder()
				.id(null)
				.username(memberForm.getUsername())
				.password(memberForm.getPassword())
				.name(memberForm.getName())
				.build();
		return memberEntity;
	}
}
