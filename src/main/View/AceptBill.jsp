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
<body style="background-color: #e5e2e2;">
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
				<a class="menu_item active d-flex flex-column align-items-center" href="AceptBill">
					<span>
						<ion-icon name="documents-outline"></ion-icon>
						<span class="badge badge-pill badge-danger">${quantityBill }</span>
					</span>
					DUYỆT ĐƠN HÀNG
				</a>
				<a class="menu_item d-flex flex-column align-items-center" href="BooksManage">
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
	<div id="body" class="container pt-2 pb-4 grid">
		<div class="row ml-2 mr-2">
			<div class="col-sm-12 pt-3">
				<h4>Đơn Hàng Chưa Duyệt</h4>
				<hr>
			</div>
		</div>
			
		<c:choose>
			<c:when test="${listBills == null || listBills.size() < 1 }">
				<div class="row">
					<div class="col-sm-12">
						<div class="alert alert-warning text-center" role="alert">
						  Chưa có đơn hàng nào!
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${listBills }" var="cart">
					<div class="row ml-3 mr-3 mb-4 bg-light rounded">
						<div class="col-sm-12">
							<div class="d-flex justify-content-between pt-2 pb-2 border-bottom">
								<span class="badge badge-info p-2">
									<div class="mb-1">Mã khách hàng: #${cart.getBill().getCustomerId() }</div>
									<div>Địa chỉ: ${cart.getBill().getAddress() }</div>
								</span>
								<span class="badge badge-info p-3">
									Ngày đặt: ${cart.getDateOrder() }
								</span>
								<a href="AceptBill?id=${cart.getBill().getId() }&acept=1" class="btn btn-success" role="button">
									Xác nhận đơn
								</a>
							</div>
							<c:forEach items="${cart.getCart() }" var="item">
								<div class="d-flex justify-content-between p-3 border-bottom">
									<div class="d-flex">
										<img src="./IMG/${item.getImg() }" width="40" height="50" alt="sach">
										<div class="ml-3">
											<div class="font-weight-bold text-primary">${item.getName() }</div>
											<small><c:out value="${item.priceToString() } x ${item.getAmount() }"></c:out></small>
										</div>
									</div>
									<div><c:out value="${item.moneyToString() }"></c:out></div>
								</div>
							</c:forEach>
							<div class="d-flex justify-content-between p-3 border-top">
								<h5 class="font-weight-bold text-warning">${cart.getThanhTien() }</h5>
								<a href="AceptBill?id=${cart.getBill().getId() }&acept=0" role="button" class="btn btn-danger">Hủy đơn</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>