package kr.co.mbc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import kr.co.mbc.dto.MemberForm;
import kr.co.mbc.dto.MemberResponse;
import kr.co.mbc.entity.MemberEntity;
import kr.co.mbc.repository.MemberRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberRepository memberRepository;

	@Transactional
	public void deleteByUsername(String username) {
		memberRepository.deleteByUsername(username);
	}
	
	public void update(MemberEntity memberEntity) {
		memberRepository.save(memberEntity);
	}
	

	public MemberEntity findByUsername(String string) {
		MemberEntity memberEntity = memberRepository.findByUsername(string);
		return memberEntity;
	}
	
	public List<MemberEntity> findAll() {
		List<MemberEntity> memberList = memberRepository.findAll();
		return memberList;
	}
	
	public void save(MemberEntity memberEntity) {
		memberRepository.save(memberEntity);
	}

	public MemberEntity findByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return memberRepository.findByUsernameAndPassword(username,password);
	}




//	//로그인체크
//	public boolean checkUsernameLogin(String username, String password) {
//		memberRepository.checkUsernameLogin(username,password);
//		return false;
//	}
	
}