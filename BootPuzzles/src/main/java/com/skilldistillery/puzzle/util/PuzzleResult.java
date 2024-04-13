package com.skilldistillery.puzzle.util;

public class PuzzleResult {

	public String title;
	public String sentence;
	public int cols;
	public int rows;
	public String solution;
	public String puzzle;
	public String error;

	public PuzzleResult() {
		this.title = "";
		this.sentence = "";
		this.cols = 0;
		this.rows = 0;
		this.solution = "";
		this.puzzle = "";
		this.error = "";
	}

}