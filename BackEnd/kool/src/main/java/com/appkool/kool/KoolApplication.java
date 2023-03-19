package com.appkool.kool;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@CrossOrigin
public class KoolApplication {

	public static void main(String[] args) {
		SpringApplication.run(KoolApplication.class, args);
	}

}
