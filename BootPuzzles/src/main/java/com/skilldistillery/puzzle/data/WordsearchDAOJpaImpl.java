package com.skilldistillery.puzzle.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.puzzle.entities.Wordsearch;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class WordsearchDAOJpaImpl implements WordsearchDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Wordsearch findById(int id) {

		Wordsearch wordsearch = new Wordsearch();
		try {
			wordsearch = em.find(Wordsearch.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			wordsearch = null;
		}
		return wordsearch;
	}

}
