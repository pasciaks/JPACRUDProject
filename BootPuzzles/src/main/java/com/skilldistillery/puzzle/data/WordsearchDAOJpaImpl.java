package com.skilldistillery.puzzle.data;

import java.util.List;

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

	@Override
	public Wordsearch create(Wordsearch wordsearch) {

		try {
			em.persist(wordsearch);
			em.flush();
		} catch (Exception e) {
			e.printStackTrace();
			wordsearch = null;
		}

		return wordsearch;
	}

	@Override
	public Wordsearch update(int id, Wordsearch wordsearch) {

		Wordsearch managed = em.find(Wordsearch.class, id);

		if (managed == null) {
			return null;
		}

		managed.setTitle(wordsearch.getTitle());
		managed.setSentence(wordsearch.getSentence());
		managed.setCols(wordsearch.getCols());
		managed.setRows(wordsearch.getRows());
		managed.setSolution(wordsearch.getSolution());
		managed.setPuzzle(wordsearch.getPuzzle());
		managed.setImage(wordsearch.getImage());

		try {
			em.persist(managed);
			em.flush();
		} catch (Exception e) {
			e.printStackTrace();
			managed = null;
		}

		System.out.println(managed);

		return managed;
	}

	@Override
	public boolean delete(int id) {

		try {
			Wordsearch wordsearch = em.find(Wordsearch.class, id);
			em.remove(wordsearch);
			em.flush();
			if (em.contains(wordsearch)) {
				return false;
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Wordsearch> findAll() {

		List<Wordsearch> wordsearches = null;

		try {
			String query = "SELECT w FROM Wordsearch w";
			wordsearches = em.createQuery(query, Wordsearch.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return wordsearches;
	}

}
