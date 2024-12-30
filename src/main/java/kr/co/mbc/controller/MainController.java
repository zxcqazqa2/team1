package kr.co.mbc.controller;

import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping
	public void main() {
		
	}
=======
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import kr.co.mbc.entity.MemberEntity;
import kr.co.mbc.service.MemberService;
import kr.co.mbc.utils.DateUtils;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final MemberService memberService;
	
	
	
	//---------------로그인 start------------------
	@GetMapping("login")
	public String login() {
		return "login";
	}   
	
    // 로그인 처리
    @PostMapping("/check/login")
    @ResponseBody
    public void checkLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session) {
      
    }
	
	
	
//    // 로그아웃
//    @GetMapping("check/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/check/login";
//    }
	
	
	
	
	
	
	//---------------로그인 end------------------    
	
    @GetMapping("/")
    public String main(Model model) {

       model.addAttribute("name", "홍길동");
       
       MemberEntity dbEntity = memberService.findByUsername("m001");
       if(dbEntity == null) {
          MemberEntity memberEntity = MemberEntity.builder().username("m001").password("1").name("홍길동").createDate("2024-12-24").build();
          memberService.save(memberEntity);
       }

       return "main";
    }
	
	@GetMapping("/test")
	public void test() {
	}

	@GetMapping("/chargingStation")
	public String chargingStation() {

		return "chargingStation";
	}

    
>>>>>>> f4ec477 (css_member_main_tourist_ok)
}
