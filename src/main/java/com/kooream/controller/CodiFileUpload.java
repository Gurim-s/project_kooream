package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CodiFileUpload {
	
	@GetMapping("/codiuploadForm")
	public void uploadForm() {
		log.info("upload form");
		
		
	}
	
}
