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
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<div class="container bg-info text-light rounded mt-3 p-4">
		<div class="row">
			<div class="col-md-12">
				<h4>CẬP NHẬT THÔNG TIN SÁCH</h4>
				<hr>
			</div>
		</div>
		<form class="row" action="UpdateBook" method="post" enctype="multipart/form-data">
			<div class="col-md-7">
				<div class="form-group">
				    <label for="book-name">Tên Sách:</label>
				    <input type="hidden" name="id" value="${book.getId() }">
				    <input type="text" class="form-control" id="book-name" name="name" placeholder="Nhập tên sách" value="${book.getName() }" required>
				</div>
				<div class="form-group">
				    <label for="book-author">Tác Giả:</label>
				    <input type="text" class="form-control" id="book-author" name="author" placeholder="Nhập tên tác giả" value="${book.getAuthor() }" required>
				</div>
				<div class="form-group">
				    <label for="book-price">Giá Bán:</label>
				    <input type="number" class="form-control" id="book-price" name="price" value="${book.getPrice() }" min="0" required>
				</div>
				<div class="form-group">
				    <label for="book-amount">Số Lượng:</label>
				    <input type="number" class="form-control" id="book-amount" name="amount" value="${book.getAmount() }"  min="0" required>
				</div>
				<div class="form-group">
				    <label for="book-category">Loại Sách:</label>
				    <select class="form-control" id="book-category" name="category">
				    	<c:forEach items="${listCategory }" var="item">
							<option 
								value="${item.getId() }"
								<c:if test="${item.getId() == book.getCategoryId() }">
									<c:out value = "selected"/>
								</c:if>>
								${item.getName() }
							</option>
						</c:forEach>
				    </select>
				</div>
			</div>
			<div class="col-md-5">
				<div class="form-group">
				    <label for="book-image">Đổi Ảnh Bìa:</label>
				    <input type="file" 
				    	class="form-control" 
				    	id="book-image" 
				    	name="image" 
				    	accept="image/png, image/jpg, image/jpeg" 
				    	onchange="preview()">
				</div>
				<div class="p-2">
					<img id="preview-image" src="IMG/${book.getImg() }" height="200" alt="Bìa Sách" class="border">
                </div>
			</div>
			<div class="col-md-12 d-flex justify-content-end">
				<a class="btn btn-danger mr-3" href="BooksManage" role="button">Hủy Bỏ</a>
				<input type="submit" class="btn btn-warning" name="submit" value="Cập nhật">
			</div>
		</form>
	</div>
</body>
<script>
function preview() {
	$("#preview-image").attr("src",URL.createObjectURL(event.target.files[0]));
}
</script>
</html>