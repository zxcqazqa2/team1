package kr.co.mbc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BaseApplication {

	public static void main(String[] args) {
		System.out.println("::::::::::::::::::::");
		SpringApplication.run(BaseApplication.class, args);
	}

}
