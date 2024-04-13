<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!doctype html>

<html lang="en">

<jsp:include page="../_head.jsp" />

<body>

	<jsp:include page="../_nav.jsp" />

	<main class="container puzzle">

		<div class="container p-2 m-2">

			<form class="m-2 p-2" action="postUpdateWordsearch.do" method="POST"
				enctype="multipart/form-data">


				<jsp:include page="_form.jsp" />

				<br>

				<div class="row">
					<div class="col">

						<input type="submit" class="w-100 btn btn-warning"
							value="Update Wordsearch" /> <br>
					</div>
				</div>
				
			</form>

			<br>

			<hr>

			<div class="row">
				<div class="col">

					<form method="POST" action="delete.do"
						onsubmit="return confirm('Are you sure?');">
						<input type="hidden" name="id" value="${wordsearch.id}" /> <input
							type="submit" class="btn btn-danger" value="Delete Wordsearch" />
					</form>

				</div>

			</div>

		</div>

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