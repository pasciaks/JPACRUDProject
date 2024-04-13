<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>

<html lang="en">

<jsp:include page="_head.jsp" />

<body>

	<jsp:include page="_nav.jsp" />

	<main class="container text-center puzzle">




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

					<a href="index.html?cols=${cols}&rows=${rows}&puzzleString=${puzzle}">Play</a>

					<br>

				</c:if>
			</c:if>
		</c:if>

		<div class="container">
			<p></p>
			<hr>
		</div>

		<div class="container">

			<form action="getWordsearch.do" method="GET">
				ID: <input type="number" name="id" required min="1" /> <input
					type="submit" value="Show Wordsearch" />
			</form>

		</div>

	</main>

	<!--     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>  -->

	<%-- 	<jsp:include page="_tail.jsp" /> --%>

</body>

</html>