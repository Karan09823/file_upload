
<div class="container-fluid">
	<div class="row">

		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<p class="text-center fs-3">Image Upload</p>

					<%
					String msg = (String) session.getAttribute("msg");
					
					if(msg!=null){
						%>
						<h4 class="text-center text-sucess"><%= msg%></h4>
						
						<% 
						session.removeAttribute("msg");
					}
					%>


					<form action=upload method="post" enctype="multipart/form-data">
						<!--action -> name of servlet -->
						<!-- enctype defines which type of data is being uploaded -->
						<div class="mb-3">
							<label>Image</label><input class="form-control" type="file"
								name="files" />
						</div>

						<div class="mb-3">
							<label>Remark</label><input class="form-control" type="text"
								name="remark" />
						</div>

						<div class="text-center">
							<button class="btn btn-primary">Upload</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</div>