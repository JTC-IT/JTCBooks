<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!-- Header -->
	<nav class="sticky-top bg-secondary">
		<!-- Container wrapper -->
		<div class="container-fluid d-flex justify-content-between">
			<!-- Navbar brand -->
			<div class="ml-3">
				<a class="navbar-brand mt-2 mt-lg-0" href="AceptBill"> <img
					src="./IMG/logo_jtc.png" height="55" alt="Jbooks" />
				</a>
			</div>
			<!-- Collapsible wrapper -->
			<div class="d-flex">
				<a class="menu_item d-flex flex-column align-items-center" href="AceptBill">
					<span>
						<ion-icon name="documents-outline"></ion-icon>
						<span class="badge badge-pill badge-danger">${quantityBill }</span>
					</span>
					DUYỆT ĐƠN HÀNG
				</a>
				<a class="menu_item active d-flex flex-column align-items-center" href="BooksManage">
					<span><ion-icon name="library-outline"></ion-icon></span>QUẢN LÝ SÁCH
				</a>
				<a class="menu_item d-flex flex-column align-items-center" href="UserManage">
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
	<div class="container-fluid">
		<div class="row mt-4">
			<div class="col-md-6">
				<h4>QUẢN LÝ SÁCH</h4>
			</div>
			<div class="col-md-1">
				<a href="AddBook" class="badge badge-pill badge-success p-2">
					<ion-icon name="add"></ion-icon>Thêm sách
				</a>
			</div>
			<div class="col-md-2">
				<select class="form-control form-control-sm" onchange="searchByCategory(this.value)">
					<option value="0" selected>Tất cả sách</option>
					<c:forEach items="${listCategory }" var="item">
						<option value="${item.getId() }">${item.getName() }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-3">
				<div class="has-search mb-3">
					<ion-icon name="search" class="form-control-feedback" size="small"></ion-icon>
					<input type="text" id="search" class="form-control form-control-sm"
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
							<th>Ảnh</th>
							<th>Tên Sách</th>
							<th>Tác Giả</th>
							<th>Tồn Kho</th>
							<th>Giá Bán</th>
							<th>Ngày Thêm</th>
							<th>Sửa</th>
							<th><button class="btn btn-danger">Xóa</button></th>
						</thead>
						<tbody id="listBooks">
							<c:forEach items="${listBook }" var="book">
							<tr>
								<td><input type="checkbox" class="checkthis" value="${book.getId() }"/></td>
								<td><img src="./IMG/${book.getImg() }" width="40" height="50" alt="Sách" class="border"></td>
								<td class="text-truncate">${book.getName() }</td>
								<td class="text-truncate">${book.getAuthor() }</td>
								<td>${book.getAmount() }</td>
								<td>${book.priceToString() }</td>
								<td class="text-truncate">${book.dateAddToString() }</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<a href="UpdateBook?id=${book.getId() }" class="btn btn-primary btn-xs" role="button">
											<ion-icon name="create-outline"></ion-icon>
										</a>
									</p>
								</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete" 
											onclick="selectedBook(${book.getId() })">
											<ion-icon name="trash-outline"></ion-icon>
										</button>
									</p>
								</td>
							</tr>
							</c:forEach>
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

	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header d-flex justify-content-between">
					<h4 class="modal-title custom_align" id="Heading">
						Xóa sách
					</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<ion-icon name="close-outline"></ion-icon>
					</button>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger">
						<ion-icon name="warning-outline"></ion-icon>
						Bạn có chắc chắn muốn xóa sách này?
					</div>
				</div>
				<div class="modal-footer ">
					<a href="" type="button" id="removeBook" class="btn btn-warning" role="button">
						Xóa
					</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Hủy
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
<script src="./JS/manage_books.js"></script>
</html>