<%@page import="Model.Bean.CartItem"%>
<%@page import="Model.Bo.CartBo"%>
<%@page import="Model.Bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JBooks</title>
<meta charset="utf-8">
<link rel="icon" href="./image_sach/icon_jshop.png">
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
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<!-- My CSS -->
<link rel="stylesheet" href="./CSS/home_reset.css">
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8") ;
	response.setCharacterEncoding("utf-8");
	
	Customer user = (Customer) session.getAttribute("user");
	
	CartBo Cart = (CartBo) session.getAttribute("cart");
	
	if(Cart == null || Cart.size() < 1) response.sendRedirect("Home");
%>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg sticky-top">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<ion-icon name="menu"></ion-icon>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="Home"> <img
					src="./image_sach/logo_jtc.png" height="55" alt="" loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="Home"> <ion-icon
								name="home-outline"></ion-icon> TRANG CHỦ
					</a></li>
					<li class="nav-item active"><a
						class="nav-link d-flex align-items-center link-cart" href="Cart">
							<ion-icon name="cart-outline"></ion-icon> GIỎ HÀNG
					</a></li>
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="#"> <ion-icon
								name="hourglass-outline"></ion-icon> LỊCH SỬ MUA HÀNG
					</a></li>
				</ul>
			</div>
			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<!-- Avatar -->
				<%if(user == null) {%>
				<a href="LoginRegister?exist=1" type="button"
					class="btn btn-outline-light">Đăng nhập</a> <a
					href="LoginRegister?exist=0" type="button"
					class="btn btn-outline-light ml-2">Đăng ký</a>
				<%} else{ %>
				<a
					class="nav-link text-light d-flex align-items-center text-uppercase"
					href="User"> <ion-icon name="person-outline"></ion-icon> <%=user.getName() %>
				</a> <a class="btn btn-outline-danger ml-2 font-weight-bold"
					href="Logout" type="button"> Đăng xuất </a>
			</div>
			<%} %>
		</div>
	</nav>
	<!-- Body -->
	<div id="body" class="container pt-3">
		<div class="alert alert-success" role="alert">
			<h4 class="text-center">Đặt hàng thành công !</h4>
		</div>
		<div class="mb-2 p-3 bg-light rounded d-flex justify-content-between">
			<span><strong>MÃ ĐƠN HÀNG: </strong>#<%=Cart.getId() %></span> <span>THỜI
				GIAN: <strong><%=Cart.getDateOrder() %></strong>
			</span>
		</div>
		<table class="table pt-3 bg-light">
			<thead>
				<tr class="table-active">
					<th scope="col">#</th>
					<th scope="col">Sản phẩm sách</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Thành tiền</th>
				</tr>
			</thead>
			<tbody>
				<% int i = 0;
			 	for(CartItem ci: Cart.getCart()){ %>
				<tr>
					<th scope="row"><%=++i %></th>
					<td><%=ci.getName() %></td>
					<td><%="x "+ci.getAmount() %></td>
					<td><%=ci.moneyToString() %></td>
				</tr>
				<%}%>
				<tr class="table-active">
					<td></td>
					<td></td>
					<td></td>
					<td><h4 class="text-success font-weight-bold"><%=Cart.getThanhTien() %></h4></td>
				</tr>
			</tbody>
		</table>
		<div class="mb-4 mt-4 d-flex justify-content-between">
			<a href="Home" role="button" class="btn btn-success text-light">Trang
				Chủ</a> <a href="#" role="button" class="btn btn-danger text-light">Xem
				Lịch Sử Mua Hàng</a>
		</div>
	</div>
	<!-- Footer -->
	<footer class="bg-dark text-center">
		<!-- Grid container -->
		<div class="container p-4 pb-0">
			<!-- Section: Social media -->
			<section class="mb-3 d-flex justify-content-center">
				<!-- Facebook -->
				<a target="_blank" class="rounded-circle m-2 text-white"
					href="https://www.facebook.com/joseph.ttrungchinh" role="button">
					<ion-icon name="logo-facebook"></ion-icon>
				</a>
				<!-- Instagram -->
				<a target="_blank" class="rounded-circle m-2 text-white"
					href="https://www.instagram.com/joseph.trungchinh" role="button">
					<ion-icon name="logo-instagram"></ion-icon>
				</a>
				<!-- Github -->
				<a target="_blank" class="rounded-circle m-2 text-white"
					href="https://github.com/JTC-IT" role="button"> <ion-icon
						name="logo-github"></ion-icon>
				</a>
			</section>
		</div>
		<!-- Copyright -->
		<div class="text-center p-3 text-white"
			style="background-color: rgba(0, 0, 0, 0.2);">© 2021 Copyright:
			Trần Trung Chính</div>
	</footer>
	<%Cart.clearCart();%>
</body>
</html>