<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>

<html lang="en">

<jsp:include page="../_head.jsp" />

<body>

	<jsp:include page="../_nav.jsp" />

	<main class="container text-center">

		<c:if test="${! empty wordsearch}">

			<c:set var="cols" value="${wordsearch.cols}" />
			<c:set var="rows" value="${wordsearch.rows}" />
			<c:set var="puzzle" value="${wordsearch.puzzle}" />
			<c:set var="solution" value="${wordsearch.solution}" />
			<c:set var="image" value="${wordsearch.image}" />

			<c:set var="url" value="${pageContext.request.contextPath}" />

			<div class="row">
				<div class="col">
					<h3>${wordsearch.title}</h3>
					<p>${wordsearch.sentence}</p>
				</div>
			</div>

			<div class="container text-center p-2 m-2">
				<a href="${myUrl}/uploads/${image}" target="_blank">Download
					Image</a> <img style="max-height: 100px"
					src="${myUrl}/uploads/${image}" class="img-fluid"
					alt="${myUrl}/uploads/${image}"
					onerror="this.style.display='none';">
			</div>

			<div class="bordered">

				<table>

					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Sentence</th>
						<th>Columns</th>
						<th>Rows</th>
						<th>Puzzle</th>
						<th>Solution</th>
						<th>Image</th>

						<th>Edit</th>
						<th>Delete</th>
					</tr>

					<tbody>
						<tr>
							<td>${wordsearch.id}</td>
							<td>${wordsearch.title}</td>
							<td>${wordsearch.sentence}</td>
							<td>${wordsearch.cols}</td>
							<td>${wordsearch.rows}</td>
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

							<td>${wordsearch.image}</td>

							<td>

								<form method="GET" action="edit.do">
									<input type="hidden" name="id" value="${wordsearch.id}" /> <input
										type="submit" class="btn btn-warning" value="Edit Wordsearch" />
								</form>

							</td>
							<td>


								<form method="POST" action="delete.do"
									onsubmit="return confirm('Are you sure?');">
									<input type="hidden" name="id" value="${wordsearch.id}" /> <input
										type="submit" class="btn btn-danger" value="Delete Wordsearch" />
								</form>


							</td>
						</tr>
					</tbody>

				</table>

			</div>

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

</body>

</html>