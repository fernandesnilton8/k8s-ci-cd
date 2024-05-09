package dev.niltonf.githubactioncicd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class GithubactionCicdApplication {


	@GetMapping("/")
	public String hello(){

		return "Hello Word";
	}

	public static void main(String[] args) {
		SpringApplication.run(GithubactionCicdApplication.class, args);
	}

}
