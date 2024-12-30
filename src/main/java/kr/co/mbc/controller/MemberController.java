package kr.co.mbc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.validation.Valid;
import kr.co.mbc.dto.MemberForm;
import kr.co.mbc.dto.MemberResponse;
import kr.co.mbc.entity.MemberEntity;
import kr.co.mbc.service.MemberService;
import kr.co.mbc.utils.DateUtils;
import kr.co.mbc.utils.UploadFileUtils;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

	private static final String SERVICENAME ="member";
	
	private final UploadFileUtils uploadFileUtils;
	
	private final MemberService memberService;
	
	// 다운로드
	@GetMapping("/download")
	public ResponseEntity<byte[]> download(String fullFileName) {
		
		ResponseEntity<byte[]> entity = uploadFileUtils.download(fullFileName);
		
		return entity;
	}
	
	// 회원 프로필이미지 불러오기
	@GetMapping("/imgDisplay")
	public ResponseEntity<byte[]> imgDisplay(String fullFileName) {
		
		ResponseEntity<byte[]> entity = uploadFileUtils.imgDisplay(fullFileName);
		
		return entity;
	}
	
	// 회원삭제
	@PostMapping("/delete")
	public String delete(String username) {

		MemberEntity memberEntity = memberService.findByUsername(username); // username으로 조회
		
		String profileImg = memberEntity.getProfileImg();
		

		if(profileImg != null) {
			
			uploadFileUtils.deleteFile(profileImg);
			
		}
		

		memberService.deleteByUsername(username);

		return "redirect:/member/list";
	}

	// 회원정보 수정 처리
	@PostMapping("/update")
	public String eupdate(MemberForm memberForm, MultipartHttpServletRequest mRequest) {

		MemberEntity memberEntity = memberService.findByUsername(memberForm.getUsername()); // username으로 조회

		MultipartFile multipartFile = mRequest.getFile("profileImg");
		
		
		if (!multipartFile.isEmpty()) {
			
			String oldProfileImg = memberEntity.getProfileImg();
			
				if (oldProfileImg !=null) {
					uploadFileUtils.deleteFile(oldProfileImg);
				}
				
			String newProfileImg = uploadFileUtils.uploadFile(multipartFile, SERVICENAME, memberForm.getUsername());
			
			memberEntity.setProfileImg(newProfileImg);
			
		}
		
		

		memberEntity.setName(memberForm.getName());

		memberService.update(memberEntity);

		return "redirect:/member/read/" + memberForm.getUsername();
	}

	// 회원정보 수정 페이지
	@GetMapping("/update/{username}")
	public String update(@PathVariable("username") String username, Model model) {

		MemberEntity memberEntity = memberService.findByUsername(username); // username으로 조회

		MemberResponse memberResponse = MemberEntity.toMemberResponse(memberEntity); // memberEntity를 memberResponse로 변환
		
		model.addAttribute("memberResponse", memberResponse); // model에 바인딩

		return "/member/update";
	}

	// 회원정보 상세보기
	@GetMapping("/read/{username}")
	public String read(@PathVariable("username") String username, Model model) {

		MemberEntity memberEntity = memberService.findByUsername(username); // username으로 조회

		MemberResponse memberResponse = MemberEntity.toMemberResponse(memberEntity); // memberEntity를 memberResponse로 변환
		
		model.addAttribute("memberResponse", memberResponse); // model에 바인딩

		return "/member/read";
	}

	// 회원 목록
	@GetMapping("/list")
	public String list(Model model) {
		List<MemberResponse> MemberResponseList = new ArrayList<MemberResponse>();
		
		List<MemberEntity> memberEntityList = memberService.findAll(); // 회원 목록 전체 조회
		
		for (MemberEntity memberEntity : memberEntityList) {
			
			MemberResponse memberResponse = MemberEntity.toMemberResponse(memberEntity); // memberEntity를 memberResponse로 변환
			
			MemberResponseList.add(memberResponse); // MemberResponseList에 추가
		}

		model.addAttribute("memberList", MemberResponseList); // model에 바인딩

		return "/member/list";
	}

	// 회원가입 처리
	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("memberForm") MemberForm memberForm, MultipartHttpServletRequest mRequest, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			
			return "member/join";
		}
		
		MemberEntity memberEntity = MemberEntity.toMemberEntity(memberForm); // memberForm을 memberEntity로 변환

		MultipartFile multipartFile = mRequest.getFile("profileImg");
		
		System.out.println("::::::::::::::::::::::::::::::::::::::::");
		System.out.println(multipartFile);
		System.out.println("::::::::::::::::::::::::::::::::::::::::");
		
		if (!multipartFile.isEmpty()) {
			String profileImg = uploadFileUtils.uploadFile(multipartFile, SERVICENAME, memberForm.getUsername()); // 파일 업로드
			memberEntity.setProfileImg(profileImg);
		}

		String formattedDate = DateUtils.getFormattedDate(); // 포맷된 날짜 불러오기
		memberEntity.setCreateDate(formattedDate);

		memberService.save(memberEntity);

		return "redirect:/member/read/" + memberForm.getUsername();
	}

	// 회원가입 페이지
	@GetMapping("/join")
	public String join(MemberForm memberForm) {
		
		return "member/join";
	}

	// 아이디 중복 체크
	@PostMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam Map<String, String> map) {
		
		String username = map.get("username");
		
		MemberEntity dbEntity = memberService.findByUsername(username); // username으로 조회
		
		if (dbEntity != null) {
			return "no";
		}
		
		return "ok";
	}
	
}
