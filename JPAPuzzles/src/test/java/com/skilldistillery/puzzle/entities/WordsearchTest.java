package com.skilldistillery.puzzle.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class WordsearchTest {

	private static EntityManagerFactory emf;

	private EntityManager em;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAPuzzles");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Wordsearch_entity_mapping() {
		Wordsearch wordsearch = em.find(Wordsearch.class, 1);
		System.out.println(wordsearch);
		assertNotNull(wordsearch);
	}

	@Test
	void test_Wordsearch_entity_first_row_found_is_correct() {

		Wordsearch wordsearch = em.find(Wordsearch.class, 1);

		assertEquals("First Puzzle", wordsearch.getTitle());

		assertEquals(12, wordsearch.getCols());

		assertEquals(12, wordsearch.getRows());

		assertEquals("NOW IS THE TIME FOR ALL GOOD MEN", wordsearch.getSentence());

		assertEquals(
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				wordsearch.getPuzzle());

		assertEquals(
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				wordsearch.getSolution());

		assertEquals("https://placehold.co/400", wordsearch.getImage());

	}

}
