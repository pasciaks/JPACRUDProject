package com.skilldistillery.puzzle.data;

import java.util.List;

import com.skilldistillery.puzzle.entities.Wordsearch;

public interface WordsearchDAO {

	Wordsearch findById(int id);

	Wordsearch create(Wordsearch wordsearch);

	Wordsearch update(int id, Wordsearch wordsearch);

	boolean delete(int id);

	List<Wordsearch> findAll();
}
