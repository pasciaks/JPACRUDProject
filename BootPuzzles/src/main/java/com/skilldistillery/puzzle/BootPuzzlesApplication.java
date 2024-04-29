package com.skilldistillery.puzzle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("com.skilldistillery.puzzle.entities")
public class BootPuzzlesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootPuzzlesApplication.class, args);
	}

}
