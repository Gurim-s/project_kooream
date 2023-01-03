package com.kooream.controller;

import java.security.Provider.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.BrandProductVO;
import com.kooream.service.BrandProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * @Controller
 * 
 * @Log4j
 * 
 * @RequestMapping
 * 
 * @AllArgsConstructor public interface BrandProductController {
 * 
 * private BrandProductService service;
 * 
 * @PostMapping("/register") public String register(BrandProductVO vo,
 * RedirectAttributes rttr) { service.register(vo);
 * 
 * return "redirect:/board/list;
 * 
 * }
 * 
 * }
 */
