package kr.co.mbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class TourController {

    @GetMapping("/tourist")
    public String tourist() {
        return "tourist";
    }
}
