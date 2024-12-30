package kr.co.mbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/apiTest")
public class ChargingStationController {
	
	@GetMapping("/getData")
	public String getData() {
		String apiKey = "po6or3j0tjcr3jpr6t6tpjj_2c32e0b3";
		
		String url = UriComponentsBuilder.fromHttpUrl("https://open.jejudatahub.net/api/proxy/atDab6t8218btaa122b26DDtbatD86t1/"+apiKey)
                .queryParam("number", 1) // 페이지 번호
                .queryParam("limit", 10) // 페이지별 컨텐츠 수
                .toUriString(); // 완성된 URL 반환
		
		RestTemplate restTemplate = new RestTemplate();
		String chargingStationData = restTemplate.getForObject(url,String.class);
		
		System.out.println("::::::::::::::::::::::::::::::::::");
		System.out.println(chargingStationData);
		System.out.println("::::::::::::::::::::::::::::::::::");
		return ""; 
	}

}
