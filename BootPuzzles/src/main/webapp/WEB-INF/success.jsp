<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>

<html lang="en">

<jsp:include page="_head.jsp" />

<body>

	<jsp:include page="_nav.jsp" />

	<main class="container text-center">


		<c:if test="${! empty scores}">
			<div class="alert alert-warning" role="alert">Scores!</div>

			<p>Note: I didn't spend the extra time to format these Static,
				comma separated values. Just wanted to show that they are being
				passed back from the game.</p>
			<p>Note: This score functionality was added in 1.5 hours starting
				at 5am this morning!</p>
			<br>
			<hr>
			<br>
			
			<c:forEach var="score" items="${scores}">

				<p>${score}</p>

			</c:forEach>

			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</c:if>

		<c:if test="${ empty wordsearch}">
			<div class="alert alert-danger">
				<p>Word Search Not Found or Present.</p>
			</div>
		</c:if>


		<c:if test="${! empty error}">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if>

		<c:if test="${! empty message}">
			<div class="alert alert-success" role="alert">${message}</div>
		</c:if>

		<c:if test="${! empty wordsearch}">

			<c:set var="cols" value="${wordsearch.cols}" />
			<c:set var="rows" value="${wordsearch.rows}" />
			<c:set var="puzzle" value="${wordsearch.puzzle}" />
			<c:set var="solution" value="${wordsearch.solution}" />
			<c:set var="image" value="${wordsearch.image}" />
			<c:set var="sentence" value="${wordsearch.sentence}" />
			<c:set var="id" value="${wordsearch.id}" />
			<c:set var="title" value="${wordsearch.title}" />
			<c:choose>
				<c:when test="${fn:startsWith(image, 'http')}">
					<c:set var="image" value="${image}" />
					<c:set var="wordsearch.image" value="${image}" />
				</c:when>
				<c:when test="${fn:startsWith(image, 'HTTP')}">
					<c:set var="wordsearch.image" value="${image}" />
					<c:set var="image" value="${image}" />
				</c:when>
				<c:otherwise>
					<c:set var="image" value="${myUrl}/uploads/${image}" />
					<c:set var="wordsearch.image" value="${myUrl}/uploads/${image}" />
				</c:otherwise>
			</c:choose>



			<div class="row text-warning">
				<div class="col">
					<h3>${wordsearch.title}</h3>
					<p>${wordsearch.sentence}</p>
					<p>${wordsearch.image}</p>
				</div>
			</div>


			<table>



				<tbody>

					<tr>
						<td colspan="2"><a
							href="getWordsearch.do?id=${wordsearch.id}"><img
								src="${image}" class="img-responsive" alt="${image}"
								style="width: 200px;" onerror="this.style.display='none';">
						</a>



							<div class="row">
								<div class="col">
									<p>
										<span class="text-primary">(${wordsearch.id})</span> <span><strong>Title:
										</strong></span>${wordsearch.title}</p>
								</div>
								<div class="col">
									<p>
										<span><strong>Sentence: </strong></span>${wordsearch.sentence}</p>
								</div>

								<div class="col">
									<p>
										<span><strong>Columns, Rows: </strong></span>${wordsearch.cols},
										${wordsearch.rows}
									</p>
								</div>
							</div>


							<div class="row">
								<div class="col">
									<form method="GET" action="edit.do">
										<input type="hidden" name="id" value="${wordsearch.id}" /> <input
											type="submit" class="btn btn-warning"
											value="Update Wordsearch" />
									</form>
								</div>
								<div class="col">
									<form method="POST" action="delete.do"
										onsubmit="return confirm('Are you sure?');">
										<input type="hidden" name="id" value="${wordsearch.id}" /> <input
											type="submit" class="btn btn-danger"
											value="Delete Wordsearch" />
									</form>
								</div>
							</div></td>

					</tr>

					<tr>

						<td>

							<div class="col">
								<c:if test="${! empty rows}">
									<c:if test="${! empty cols}">
										<c:if test="${! empty puzzle}">

											<table border="1">
												<c:forEach var="row" begin="0" end="${rows-1}">
													<tr>
														<c:forEach var="col" begin="0" end="${cols-1}">
															<c:set var="cellIndex" value="${row * cols + col}" />
															<c:set var="cellValue"
																value="${cellIndex >= puzzle.length() ? '' : puzzle.charAt(cellIndex)}" />
															<td>${cellValue}</td>
														</c:forEach>

													</tr>
												</c:forEach>
											</table>

											<br>

											<a target="_blank"
												href="index.html?cols=${cols}&rows=${rows}&puzzleString=${puzzle}&title=${title}&sentence=${sentence}&id=${id}">Play</a>

											<br>

										</c:if>
									</c:if>
								</c:if>
							</div>

						</td>

						<td>

							<div class="col">
								<c:if test="${! empty rows}">
									<c:if test="${! empty cols}">
										<c:if test="${! empty solution}">

											<table border="1">
												<c:forEach var="row" begin="0" end="${rows-1}">
													<tr>
														<c:forEach var="col" begin="0" end="${cols-1}">
															<c:set var="cellIndex" value="${row * cols + col}" />
															<c:set var="cellValue"
																value="${cellIndex >= solution.length() ? '' : solution.charAt(cellIndex)}" />
															<td>${cellValue}</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</table>

											<br>

											<a target="_blank"
												href="index.html?cols=${cols}&rows=${rows}&puzzleString=${solution}&title=${title}&sentence=${sentence}&id=${id}">Play</a>

											<br>

										</c:if>
									</c:if>
								</c:if>
							</div>

						</td>

					</tr>
				</tbody>

			</table>



		</c:if>

	</main>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<jsp:include page="_tail.jsp" />


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


</body>

</html>