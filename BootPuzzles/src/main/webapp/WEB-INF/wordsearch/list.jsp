<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>

<html lang="en">

<jsp:include page="../_head.jsp" />

<body>

	<jsp:include page="../_nav.jsp" />

	<main class="container text-center">

		<h1>Wordsearches</h1>

		<c:if test="${! empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>

		<c:if test="${! empty wordsearches}">

			<c:forEach var="wordsearch" items="${wordsearches}">

				<c:if test="${! empty wordsearch}">

					<c:set var="cols" value="${wordsearch.cols}" />
					<c:set var="title" value="${wordsearch.title}" />
					<c:set var="rows" value="${wordsearch.rows}" />
					<c:set var="puzzle" value="${wordsearch.puzzle}" />
					<c:set var="solution" value="${wordsearch.solution}" />
					<c:set var="image" value="${wordsearch.image}" />

					<c:set var="url" value="${pageContext.request.contextPath}" />

					<div class="bordered">

						<table>

							<tr class="bg-success">
								<th>Details</th>

								<th>Puzzle</th>
								<th>Solution</th>

								<!-- <th>Edit/Delete</th> -->

							</tr>

							<tbody>
							
							<tr class="bg-success"><td colspan="3"><br></td></tr>

								<tr>
									<td><h3>${wordsearch.id}</h3><br><a
										href="getWordsearch.do?id=${wordsearch.id}"><img
											src="${myUrl}/uploads/${image}" class="img-responsive"
											alt="${myUrl}/uploads/${image}" style="width: 200px;"
											onerror="this.style.display='none';">

									</a> <br>

										<p>
											<span>Title:</span>${wordsearch.title}</p> <br>

										<p>
											<span>Sentence:</span>${wordsearch.sentence}</p> <br>

										<p>
											<span>Columns,Rows:</span>${wordsearch.cols},
											${wordsearch.rows}
										</p>

										<hr>

										<form method="GET" action="edit.do">
											<input type="hidden" name="id" value="${wordsearch.id}" /> <input
												type="submit" class="btn btn-warning"
												value="Update Wordsearch" />
										</form> <br>

										<form method="POST" action="delete.do"
											onsubmit="return confirm('Are you sure?');">
											<input type="hidden" name="id" value="${wordsearch.id}" /> <input
												type="submit" class="btn btn-danger"
												value="Delete Wordsearch" />
										</form>
										
										<br>

									</td>

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
															href="index.html?cols=${cols}&rows=${rows}&puzzleString=${puzzle}">Play</a>

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
															href="index.html?cols=${cols}&rows=${rows}&puzzleString=${solution}">Play</a>

														<br>

													</c:if>
												</c:if>
											</c:if>
										</div>

									</td>

									<%-- 									<td>

										<form method="GET" action="edit.do">
											<input type="hidden" name="id" value="${wordsearch.id}" /> <input
												type="submit" class="btn btn-warning"
												value="Edit Wordsearch" />
										</form>
										
										<br>
										
												<form method="POST" action="delete.do"
											onsubmit="return confirm('Are you sure?');">
											<input type="hidden" name="id" value="${wordsearch.id}" /> <input
												type="submit" class="btn btn-danger"
												value="Delete Wordsearch" />
										</form>

									</td> --%>

								</tr>
							</tbody>

						</table>

					</div>

				</c:if>

			</c:forEach>

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

	<jsp:include page="../_tail.jsp" />

	<br>
	<br>
	<br>


</body>

</html>