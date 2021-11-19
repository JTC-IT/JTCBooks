<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JBooks</title>
<meta charset="utf-8">
<link rel="icon" href="./IMG/icon_jshop.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
<!-- IonIcon -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<!-- My CSS -->
<link rel="stylesheet" href="./CSS/manage_styles.css">
</head>
<body>
<!-- Header -->
	<nav class="sticky-top bg-secondary">
		<!-- Container wrapper -->
		<div class="container-fluid d-flex justify-content-between">
			<!-- Navbar brand -->
			<div class="ml-3">
				<a class="navbar-brand mt-2 mt-lg-0" href="Home"> <img
					src="./IMG/logo_jtc.png" height="55" alt="Jbooks" />
				</a>
			</div>
			<!-- Collapsible wrapper -->
			<div class="d-flex">
				<a class="menu_item d-flex flex-column align-items-center" href="Home">
					<span>
						<ion-icon name="documents-outline"></ion-icon>
						<span class="badge badge-pill badge-danger">5</span>
					</span>
					DUYỆT ĐƠN HÀNG
				</a>
				<a class="menu_item active d-flex flex-column align-items-center" href="Cart">
					<span><ion-icon name="library-outline"></ion-icon></span>QUẢN LÝ SÁCH
				</a>
				<a class="menu_item d-flex flex-column align-items-center" href="HistoryOrder">
					<span><ion-icon name="people-outline"></ion-icon></span>QUẢN LÝ NGƯỜI DÙNG
				</a>
			</div>
			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<!-- Avatar -->
				<a class="nav-link text-light d-flex align-items-center text-uppercase"
				href="User">
					<ion-icon name="person-outline" class="p-2"></ion-icon>
					ADMIN ${user.getName() }
				</a>
				<a class="btn btn-outline-danger ml-2" href="Logout" type="button">Đăng xuất </a>
			</div>
		</div>
	</nav>
	<!-- Body -->
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-5">
				<h4>QUẢN LÝ SÁCH</h4>
			</div>
			<div class="col-md-1">
				<a href="#" class="badge badge-pill badge-success p-2">
					<ion-icon name="add"></ion-icon>Thêm sách
				</a>
			</div>
			<div class="col-md-3">
				<select class="form-control form-control-sm">
				  <option>Tất cả sách</option>
				</select>
			</div>
			<div class="col-md-3">
				<div class="has-search mb-3">
					<ion-icon name="search" class="form-control-feedback" size="small"></ion-icon>
					<input type="text" id="search" class="form-control"
						placeholder="Tìm kiếm" oninput="searchByKey(this)">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="mytable" class="table table-bordred table-striped">
						<thead>
							<th><input type="checkbox" id="checkall" /></th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Contact</th>
							<th>Edit</th>
							<th>Delete</th>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" class="checkthis" /></td>
								<td>Mohsin</td>
								<td>Irshad</td>
								<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
								<td>isometric.mohsin@gmail.com</td>
								<td>+923335586757</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn-xs" data-title="Edit"
											data-toggle="modal" data-target="#edit">
											<ion-icon name="create-outline"></ion-icon>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete">
											<ion-icon name="trash-outline"></ion-icon>
										</button>
									</p></td>
							</tr>
						</tbody>
					</table>
					<div class="clearfix"></div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Edit Your
						Detail</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="Mohsin">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Irshad">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control"
							placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Update
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this
						entry</h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this Record?
					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
<script>
$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});
</script>
</html>