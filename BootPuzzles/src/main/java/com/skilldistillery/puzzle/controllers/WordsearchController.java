package com.skilldistillery.puzzle.controllers;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.puzzle.data.WordsearchDAO;
import com.skilldistillery.puzzle.entities.Wordsearch;
import com.skilldistillery.puzzle.util.Puzzle;

@Controller
public class WordsearchController {

	private WordsearchDAO dao;

	public WordsearchController(WordsearchDAO dao) {
		super();
		this.dao = dao;
	}

	@GetMapping(path = { "/" })
	public String index(Model model) {

		Random random = new Random();

		int rows = random.nextInt(10) + 6;
		int cols = random.nextInt(10) + 6;

		Puzzle myPuzzle = new Puzzle(cols, rows);

		myPuzzle.fillPuzzle(myPuzzle.getSquare());

		String sentence = "Code is like humor when you have to explain it it is bad Cory House";

		String[] words = sentence.toUpperCase().split(" ");

		int puzzleRows = myPuzzle.getRows();
		int puzzleCols = myPuzzle.getCols();

		for (String theWord : words) {

			int theLength = theWord.length();

			int sRow = (int) Math.floor(puzzleRows / 2);
			int sCol = (int) Math.floor(puzzleCols / 2);

			boolean wasHidden = false;

			int maxTries = 999;

			int currentTries = 0;

			do {
				currentTries++;
				sRow = (int) Math.floor(puzzleRows * Math.random());
				sCol = (int) Math.floor(puzzleCols * Math.random());
				wasHidden = myPuzzle.testGetAndShowWordPathsByLength(theLength, theWord, sRow, sCol);
			} while (wasHidden == false && currentTries < maxTries);
		}

		myPuzzle.fillPuzzleBlocks('■', " ");

		myPuzzle.printPuzzle();

		// myPuzzle.displayAllWordPieces();

		model.addAttribute("puzzle", myPuzzle.puzzleToString());
		model.addAttribute("cols", puzzleCols);
		model.addAttribute("rows", puzzleRows);

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
