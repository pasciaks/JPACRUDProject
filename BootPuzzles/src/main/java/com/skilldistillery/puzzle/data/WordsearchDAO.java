package com.skilldistillery.puzzle.data;

import com.skilldistillery.puzzle.entities.Wordsearch;

public interface WordsearchDAO {

	Wordsearch findById(int id);
}
