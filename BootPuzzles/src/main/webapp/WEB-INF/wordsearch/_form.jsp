				<div class="row">
					<input type="hidden" name="id" value="${wordsearch.id}" />
				</div>

				<div class="row">
					<div class="col-2">
						<label class="" for="title">Title: </label>
					</div>
					<div class="col">
						<input type="text" name="title" required minlength="5"
							title="Minimum 5 characters required"
							value="${wordsearch.title}"/>
					</div>
				</div>


				<div class="row">
					<div class="col-2">
						<label class="" for="sentence">Sentence: </label>
					</div>
					<div class="col">
						<input type="text" name="sentence" required minlength="5"
							value="${wordsearch.sentence}"
							title="Minimum 5 characters required" />
					</div>
				</div>

				<div class="row">
					<div class="col-2">
						<label class="" for="cols">Columns:</label>
					</div>
					<div class="col">
						<input required min="4" max="20" type="number" name="cols"
							required value="${wordsearch.cols}"  />
					</div>
				</div>

				<div class="row">
					<div class="col-2">
						<label class="" for="rows">Rows:</label>
					</div>
					<div class="col">
						<input required min="4" max="20" type="number" name="rows"
							required 	value="${wordsearch.rows}" />
					</div>
				</div>


				<div class="row">
					<div class="col-2">
						<label class="" for="image">Image URL:</label>
					</div>
					<div class="col">
						<input value="${wordsearch.image}" type="text" name="image" />
					</div>
				</div>

				<div class="row">
					<div class="col-2">
						<label class="" for="file">Image Upload:</label>
					</div>
					<div class="col">
						<input disabled id="file" class="btn btn-success" type="file" name="file"
							accept="image/png" value="Upload PNG Image" />
					</div>
				</div>