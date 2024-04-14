package com.skilldistillery.puzzle.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import com.skilldistillery.puzzle.util.PuzzleResult;

import jakarta.servlet.ServletContext;

@Controller
public class WordsearchController {

	private static int puzzleCounter = 0;

	private WordsearchDAO dao;

	@Value("${my.url}")
	private String myUrl;

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

	@GetMapping("add.do")
	public String add() {
		return "wordsearch/add";
	}

	@GetMapping("increaseAlgorithm.do")
	public String increaseAlgorithm(RedirectAttributes redir) {
		puzzleCounter++;
		return "redirect:/";
	}

	@PostMapping("delete.do")
	public String delete(@RequestParam("id") int id, RedirectAttributes redir) {

		boolean wasDeleted = false;

		try {
			wasDeleted = dao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			return "redirect:error.do";

		}

		if (!wasDeleted) {
			redir.addFlashAttribute("message", "Not found.");
			return "redirect:error.do";
		} else {
			redir.addFlashAttribute("message", "You successfully deleted a puzzle.");
			return "redirect:list.do";
		}

	}

	@GetMapping("edit.do")
	public ModelAndView add(@RequestParam("id") int id, RedirectAttributes redir) {

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
			redir.addFlashAttribute("message", "Not found.");
			mv.setViewName("redirect:error.do");
			return mv;
		}

		mv.addObject("wordsearch", wordsearch);
		mv.addObject("myUrl", myUrl);
		mv.setViewName("wordsearch/edit");
		return mv;
	}

	@GetMapping(path = { "/" })
	public String index(Model model) {

		Random random = new Random();
		int rows = random.nextInt(7) + 11;
		int cols = random.nextInt(5) + 7;
		String title = "Sheldon's Wordsearch Puzzle";
		String sentence = "SHELDON PASCIAK SKILL DISTILLERY JAVA SPRING BOOT";
		PuzzleResult pr = createPuzzleData(title, sentence, cols, rows);

		model.addAttribute("title", title);
		model.addAttribute("sentence", sentence);
		model.addAttribute("cols", cols);
		model.addAttribute("rows", rows);
		model.addAttribute("solution", pr.solution);
		model.addAttribute("puzzle", pr.puzzle);
		model.addAttribute("error", pr.error);

		model.addAttribute("puzzleCounter", puzzleCounter);

		return "home";
	}

	@GetMapping("getWordsearch.do")
	public ModelAndView getWordsearch(@RequestParam("id") int id, RedirectAttributes redir) {
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
			redir.addFlashAttribute("message", "Not found.");
			mv.setViewName("redirect:error.do");
			return mv;
		}

		mv.addObject("wordsearch", wordsearch);
		mv.addObject("myUrl", myUrl);
		mv.setViewName("wordsearch/show");
		return mv;
	}

	@GetMapping("list.do")
	public ModelAndView listAll(RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		List<Wordsearch> wordsearches = null;

		try {
			wordsearches = dao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			mv.setViewName("redirect:error.do");
			return mv;
		}

		if (wordsearches == null) {
			redir.addFlashAttribute("message", "Not found.");
			mv.setViewName("redirect:error.do");
			return mv;
		}

		mv.addObject("wordsearches", wordsearches);
		mv.addObject("myUrl", myUrl);
		mv.setViewName("wordsearch/list");
		return mv;
	}

	@PostMapping("postUpdateWordsearch.do")
	public String fileUpdateUpload(@RequestParam("file") MultipartFile file, @RequestParam("id") int id,
			@RequestParam("cols") int cols, @RequestParam("rows") int rows, @RequestParam("title") String title,
			@RequestParam("sentence") String sentence, @RequestParam("image") String image, Model model,
			RedirectAttributes redir) {

		Wordsearch checkIfFound = null;

		try {
			checkIfFound = dao.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			return "redirect:error.do";
		}

		if (checkIfFound == null) {
			redir.addFlashAttribute("message", "Not found.");
			return "redirect:error.do";
		}

		UUID uuid = UUID.randomUUID();

		if (image == null || image.isBlank()) {
			image = "default.png";
		}

		System.out.println("---------------------");

		if (!file.isEmpty()) {

			try {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(context.getRealPath("uploads") + File.separator + uuid.toString() + ".png");

				System.out.println(path);
				Files.write(path, bytes);

				image = uuid.toString() + ".png";

			} catch (IOException e) {
				e.printStackTrace();
				redir.addFlashAttribute("message", e.getMessage());
				return "redirect:error.do";
			}

		}

		PuzzleResult pr = createPuzzleData(title, sentence, cols, rows);

		Wordsearch wordsearch = new Wordsearch();

		wordsearch.setTitle(pr.title);
		wordsearch.setSentence(pr.sentence);
		wordsearch.setCols(pr.cols);
		wordsearch.setRows(pr.rows);
		wordsearch.setSolution(pr.solution);
		wordsearch.setPuzzle(pr.puzzle);
		wordsearch.setImage(image);

		System.out.println("wordsearch: " + wordsearch);

		Wordsearch updated = null;

		try {
			updated = dao.update(id, wordsearch);
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			return "redirect:error.do";
		}

		redir.addFlashAttribute("error", pr.error);
		redir.addFlashAttribute("message", "You successfully updated a puzzle.");
		redir.addFlashAttribute("wordsearch", updated);

		return "redirect:success.do";
	}

	@PostMapping("postWordsearch.do")
	public String fileUpload(@RequestParam("file") MultipartFile file, @RequestParam("cols") int cols,
			@RequestParam("rows") int rows, @RequestParam("title") String title,
			@RequestParam("sentence") String sentence, @RequestParam("image") String image, Model model,
			RedirectAttributes redir) {

		UUID uuid = UUID.randomUUID();

		if (image == null || image.isBlank()) {
			image = "default.png";
		}

		if (!file.isEmpty()) {

			try {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(context.getRealPath("uploads") + File.separator + uuid.toString() + ".png");

				System.out.println(path);
				Files.write(path, bytes);

				image = uuid.toString() + ".png";

			} catch (IOException e) {
				e.printStackTrace();
				redir.addFlashAttribute("message", e.getMessage());
				return "redirect:error.do";
			}

		}

		PuzzleResult pr = createPuzzleData(title, sentence, cols, rows);

		Wordsearch wordsearch = new Wordsearch();

		wordsearch.setTitle(pr.title);
		wordsearch.setSentence(pr.sentence);
		wordsearch.setCols(pr.cols);
		wordsearch.setRows(pr.rows);
		wordsearch.setSolution(pr.solution);
		wordsearch.setPuzzle(pr.puzzle);
		wordsearch.setImage(image);

		System.out.println("wordsearch: " + wordsearch);

		try {
			wordsearch = dao.create(wordsearch);
		} catch (Exception e) {
			e.printStackTrace();
			redir.addFlashAttribute("message", e.getMessage());
			return "redirect:error.do";
		}

		redir.addFlashAttribute("error", pr.error);
		redir.addFlashAttribute("message", "You successfully added a puzzle.");

		redir.addFlashAttribute("wordsearch", wordsearch);

		return "redirect:success.do";
	}

	private PuzzleResult createPuzzleData(String title, String sentence, int cols, int rows) {

		Random random = new Random();

		Puzzle myPuzzle = new Puzzle(rows, cols);
		myPuzzle.fillPuzzle(myPuzzle.getSquare());
		String[] words = sentence.toUpperCase().split(" ");
		int puzzleRows = myPuzzle.getRows();
		int puzzleCols = myPuzzle.getCols();
		int countHidden = 0;
		for (String theWord : words) {
			int theLength = theWord.length();
			int sRow = (int) Math.floor(puzzleRows / 2);
			int sCol = (int) Math.floor(puzzleCols / 2);

			boolean wasHidden = false;

			int randomAlgorithm = random.nextInt(3);

			if (puzzleCounter > 3 || puzzleCounter < 0) {
				puzzleCounter = 0;
			}

			if (puzzleCounter == 3) {
				randomAlgorithm = random.nextInt(3);
			} else {
				randomAlgorithm = puzzleCounter;
			}

			if (randomAlgorithm == 0) {

				// paths algorithm

				int maxTries = 9999;
				int currentTries = 0;
				do {
					currentTries++;
					sRow = (int) Math.floor(puzzleRows * Math.random());
					sCol = (int) Math.floor(puzzleCols * Math.random());
					wasHidden = myPuzzle.testGetAndShowWordPathsByLength(theLength, theWord, sRow, sCol);
				} while (wasHidden == false && currentTries < maxTries);

			} else if (randomAlgorithm == 1) {

				// diagonal lines algorithm

				wasHidden = myPuzzle.tryToPlaceWordDiagonal(myPuzzle, theWord, 9999);

			} else {

				// straight rectangular lines algorithm

				wasHidden = myPuzzle.tryToPlaceWordRectangular(myPuzzle, theWord, 9999);

			}

			if (wasHidden) {
				countHidden++;
			}

		}

		PuzzleResult pr = new PuzzleResult();

		pr.title = title;
		pr.sentence = sentence;
		pr.cols = cols;
		pr.rows = rows;

		myPuzzle.fillPuzzleBlocks('■', ".");
		pr.solution = "" + myPuzzle.puzzleToString();

		myPuzzle.fillPuzzleBlocks('.', "abcdefghijklmnopqrstuvwxyz");
		pr.puzzle = "" + myPuzzle.puzzleToString();

		if (countHidden < words.length) {
			pr.error = "Not all words were hidden.";
		}

		return pr;
	}

}
