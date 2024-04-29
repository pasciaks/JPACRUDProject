<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html> 

<html lang="en">

<jsp:include page="_head.jsp" />

<style>
input[type="number"] {
	width: 150px;
}
strong {
    font-size: 20px;
}
</style>

<body>

	<jsp:include page="_nav.jsp" />

	<main class="container text-center puzzle">

		<div class="container">

			<div class="row">
				<div class="col">
					<h3>${title}</h3>
					<p>${sentence}</p>
				</div>
				<div class="col">
					<div class="container p-1 m-1">

						<h1>
							<label for="id">Search by Id:</label>
						</h1>

						<form action="getWordsearch.do" method="GET">
							<input type="number" name="id" required min="1" /> 
							<input
								type="submit" class="btn btn-success" value="Search By Id" />
						</form>

					</div>
				</div>
			</div>

			<div class="row">
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
												<td class="${cellValue}">
													<strong>${cellValue}</strong>
												</td>
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
												<td><strong>${cellValue}</strong></td>
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
			</div>
		</div> 



	</main>



	<jsp:include page="_tail.jsp" />

</body>

</html>