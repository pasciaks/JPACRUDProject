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
		Wordsearch wordsearch = em.find(Wordsearch.class, 2);
		System.out.println(wordsearch);
		assertNotNull(wordsearch);
	}

	@Test
	void test_Wordsearch_entity_first_row_found_is_correct() {

		Wordsearch wordsearch = em.find(Wordsearch.class, 1);

		System.out.println(wordsearch);

		assertEquals("Sheldon's Puzzle", wordsearch.getTitle());

		assertEquals(10, wordsearch.getCols());

		assertEquals(14, wordsearch.getRows());

		assertEquals("SHELDON PASCIAK", wordsearch.getSentence());

		assertEquals(
				"NUBMFPMQIMRDQHTQPJPEXXEYAPCPRJBVDJSATYRWXCLICFHJZPKAVEIAKEEPYCMFFUTFSXIZRNCXNOIZOETPEHTDSPHDNCVAFLDGDJHDKLZEGWLVWLTBZHCRVPHVCAXSBBHVXYCRGGSB",
				wordsearch.getPuzzle());

		assertEquals(
				".........................P........SA........C.........IAK...................NO.........D.........L.........E.........H.........S............",
				wordsearch.getSolution());

		assertEquals("f25b9e76-37ad-432e-8bed-cb1da5d3a8b7.png", wordsearch.getImage());

	}

}
