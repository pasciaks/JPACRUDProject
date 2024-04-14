<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

				<a href="${image}" target="_blank">Download Image</a>

			</div>

			<table>

				<tr>

					<th>Details</th>

					<th>Puzzle</th>

					<th>Solution</th>

				</tr>

				<tbody>

					<tr>
						<td><h3>${wordsearch.id}</h3> <br> <%-- 						  <a
							href="getWordsearch.do?id=${wordsearch.id}"><img
								src="${myUrl}/uploads/${image}" class="img-responsive"
								alt="${myUrl}/uploads/${image}" style="width: 200px;"
								onerror="this.style.display='none';"> </a> 
								
								<br>  --%> <a href="getWordsearch.do?id=${wordsearch.id}"><img
								src="${image}" class="img-responsive" alt="${image}"
								style="width: 200px;" onerror="this.style.display='none';">

						</a> <br>




							<p>
								<span>Title:</span>${wordsearch.title}</p> <br>

							<p>
								<span>Sentence:</span>${wordsearch.sentence}</p> <br>

							<p>
								<span>Columns,Rows:</span>${wordsearch.cols}, ${wordsearch.rows}
							</p>


							<hr>

							<form method="GET" action="edit.do">
								<input type="hidden" name="id" value="${wordsearch.id}" /> <input
									type="submit" class="btn btn-warning" value="Update Wordsearch" />
							</form> <br>

							<form method="POST" action="delete.do"
								onsubmit="return confirm('Are you sure?');">
								<input type="hidden" name="id" value="${wordsearch.id}" /> <input
									type="submit" class="btn btn-danger" value="Delete Wordsearch" />
							</form> <br></td>

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

	<jsp:include page="../_tail.jsp" />

</body>

</html>