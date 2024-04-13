package com.skilldistillery.puzzle.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.puzzle.data.WordsearchDAO;
import com.skilldistillery.puzzle.entities.Wordsearch;
import com.skilldistillery.puzzle.util.Puzzle;

import jakarta.servlet.ServletContext;

@Controller
public class WordsearchController {

	private WordsearchDAO dao;

	@Autowired
	ServletContext context;

	public WordsearchController(WordsearchDAO dao) {
		super();
		this.dao = dao;
	}

	@GetMapping("success.do")
	public String success() {
		return "success";
	}

	@GetMapping("error.do")
	public String error() {
		return "error";
	}

	@GetMapping(path = { "/" })
	public String index(Model model) {

		Random random = new Random();
		int rows = random.nextInt(9) + 10;
		int cols = random.nextInt(9) + 10;

		Puzzle myPuzzle = new Puzzle(cols, rows);

		myPuzzle.fillPuzzle(myPuzzle.getSquare());

		String sentence = "Code is like humor when you have to explain it it is bad Cory House";

		sentence = "SHELDON PASCIAK";

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

		myPuzzle.fillPuzzleBlocks('■', ".");

		model.addAttribute("solution", myPuzzle.puzzleToString());

		myPuzzle.fillPuzzleBlocks('.', "ABCDEFGHIJKLMNOPQRSTUVWXYZ");

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

//	@PostMapping("postWordsearchImage.do")
//	public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {
//
//		String fileName = file.getOriginalFilename();
//		System.out.println(fileName);
//		try {
//			file.transferTo(new File("_" + fileName));
//			System.out.println(file);
//		} catch (Exception e) {
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//		}
//		return ResponseEntity.ok("File uploaded successfully.");
//	}

	@PostMapping("postWordsearch.do")
	public String fileUpload(@RequestParam("file") MultipartFile file, @RequestParam("cols") int cols,
			@RequestParam("rows") int rows, @RequestParam("title") String title,
			@RequestParam("sentence") String sentence, Model model, RedirectAttributes redir) {

		System.out.println("---------------------");
		System.out.println(cols);
		System.out.println(rows);
		System.out.println(title);
		System.out.println(sentence);
		System.out.println(file.getOriginalFilename());

		UUID uuid = UUID.randomUUID();

		System.out.println("---------------------");

		if (!file.isEmpty()) {

			try {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(context.getRealPath("uploads") + File.separator + uuid.toString() + ".png");

				System.out.println(path);
				Files.write(path, bytes);

			} catch (IOException e) {
				e.printStackTrace();
//				model.addAttribute("message", e.getMessage());
				redir.addFlashAttribute("message", e.getMessage());
				return "redirect:error.do";
			}

		}

		redir.addFlashAttribute("message", "You successfully uploaded: " + file.getOriginalFilename() + "!");
		redir.addFlashAttribute("title", title);
		redir.addFlashAttribute("sentence", sentence);
		redir.addFlashAttribute("cols", cols);
		redir.addFlashAttribute("rows", rows);
		redir.addFlashAttribute("uuid", uuid.toString() + ".png");

//		model.addAttribute("message", "You successfully uploaded: " + file.getOriginalFilename() + "!");
//		model.addAttribute("title", title);
//		model.addAttribute("sentence", sentence);
//		model.addAttribute("cols", cols);
//		model.addAttribute("rows", rows);
//		model.addAttribute("uuid", uuid.toString() + ".png");

		System.out.println("redirecting to success");
		System.out.println(title);
		System.out.println(sentence);
		System.out.println(cols);
		System.out.println(rows);
		System.out.println(uuid.toString() + ".png");
		return "redirect:success.do";
	}

}
