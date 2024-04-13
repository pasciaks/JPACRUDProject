package com.skilldistillery.puzzle.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.puzzle.data.WordsearchDAO;
import com.skilldistillery.puzzle.entities.Wordsearch;

@Controller
public class WordsearchController {

	private WordsearchDAO dao;

	public WordsearchController(WordsearchDAO dao) {
		super();
		this.dao = dao;
	}

	@GetMapping(path = { "/" })
	public String index(Model model) {
		Wordsearch wordsearch = dao.findById(1);
		model.addAttribute("wordsearch", wordsearch);
		return "home";
	}

	@GetMapping("getWordsearch.do")
	public ModelAndView getFilm(@RequestParam("id") int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		Wordsearch wordsearch = null;

		try {
			wordsearch = dao.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			mv.setViewName("redirect:error.do");
			return mv;
		}

		if (wordsearch == null) {
			redir.addFlashAttribute("message", "Film not found.");
			mv.setViewName("redirect:error.do");
			return mv;
		}

		mv.addObject("wordsearch", wordsearch);
		mv.setViewName("wordsearch/show");
		return mv;
	}

}
