package com.skilldistillery.puzzle.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "wordsearch")
public class Wordsearch {

	/*
	 * By the way , my DB is named ‘puzzle’ and my Table is named ‘wordsearch’
	 * 
	 * For reference ‘wordsearch’ is a single word so I don’t need or want
	 * underscores in my table name, and no extra camel casing in my entity!
	 * 
	 * A wordsearch is a puzzle made up of letters arranged in a grid which contains
	 * a number of hidden words running in various directions.
	 * 
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "title")
	private String title;

	@Column(name = "number_of_columns")
	private Integer cols;

	@Column(name = "number_of_rows")
	private Integer rows;

	@Column(name = "sentence")
	private String sentence;

	@Column(name = "puzzle")
	private String puzzle;

	@Column(name = "solution")
	private String solution;

	@Column(name = "image")
	private String image;

	public Wordsearch() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getCols() {
		return cols;
	}

	public void setCols(Integer cols) {
		this.cols = cols;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public String getPuzzle() {
		return puzzle;
	}

	public void setPuzzle(String puzzle) {
		this.puzzle = puzzle;
	}

	public String getSolution() {
		return solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Wordsearch other = (Wordsearch) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Wordsearch [id=" + id + ", title=" + title + ", cols=" + cols + ", rows=" + rows + ", sentence="
				+ sentence + ", puzzle=" + puzzle + ", solution=" + solution + ", image=" + image + "]";
	}

}
