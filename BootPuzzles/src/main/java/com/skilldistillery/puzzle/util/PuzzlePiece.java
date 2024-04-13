package com.skilldistillery.puzzle.util;

public class PuzzlePiece {

	protected char letter;

	protected int row;

	protected int col;

	protected String color;

	public PuzzlePiece(char letter, String color, int row, int col) {

		if (color == null) {
			color = "white";
		}

		this.letter = letter;
		this.color = color;
		this.row = row;
		this.col = col;
	}

	protected String setColor(int r, int g, int b, int a) {
		String previousColor = this.color;
		color = "white";
		return previousColor;
	}

	protected char setLetter(char letter) {
		char previousLetter = this.letter;
		this.letter = letter;
		return previousLetter;
	}

	public char getLetter() {
		return letter;
	}

	public int getRow() {
		return row;
	}

	public int getCol() {
		return col;
	}

	@Override
	public String toString() {
		return "PuzzlePiece [letter=" + letter + ", row=" + row + ", col=" + col + ", color=" + color + "] ";
	}

}
