<%@page import="Model.Bean.CartItem"%>
<%@page import="Model.Bo.CartBo"%>
<%@page import="Model.Bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="icon" href="./image_sach/icon_jshop.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JBooks</title>

<!--JavaScript cdn-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<!-- IonIcon -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<!-- My CSS -->
<link rel="stylesheet" href="./CSS/cart_styles.css">
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8") ;
	response.setCharacterEncoding("utf-8");
	
	Customer user = (Customer) session.getAttribute("user");
	
	CartBo Cart = (CartBo) session.getAttribute("cart");
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
		<!-- Alert-->
		<div class="alert alert-info text-center" style="margin-bottom: 30px;"
			role="alert">
			<span id="alert-status"> <%if(Cart == null || Cart.size() <= 0) out.print("Giỏ hàng trống !");
			else out.print("Giỏ hàng có "+Cart.size()+" sản phẩm chưa được thanh toán !");%>
			</span>
		</div>
		<!-- Shopping Cart-->
		<div class="table-responsive shopping-cart">
			<table class="table bg-light">
				<thead>
					<tr class="table-active">
						<th>Sản Phẩm</th>
						<th class="text-center">S.Lượng</th>
						<th class="text-center">Thành Tiền</th>
						<th class="text-center">
							<button id="btn-cleanCart" class="btn btn-sm btn-outline-danger"
								onclick="document.getElementById('confirmClean').style.display='block'">Xóa
								tất cả</button>
						</th>
					</tr>
				</thead>
				<tbody id="cart-body">
					<%if(Cart != null) for(CartItem item: Cart.getCart()){ %>
					<tr class="cart-item">
						<td>
							<div class="product-item">
								<a class="product-thumb" href="image_sach/<%=item.getImg()%>">
									<img src="image_sach/<%=item.getImg()%>" alt="Book">
								</a>
								<div class="product-info">
									<h6 class="product-title font-weight-bold text-truncate">
										<a href="#"><%=item.getName() %></a>
									</h6>
									<span class="text-primary text-truncate"><%=item.getAuthor() %></span>
									<span><em>Giá: </em><%=item.priceToString() %></span>
								</div>
							</div>
						</td>
						<td class="text-center">
							<div class="count-input">
								<select class="form-control selectAmount"
									onchange="changeAmount(this,<%=item.getId() %>)">
									<%for(int i = 1; i <= 5; i++){ %>
									<option value="<%=i %>"
										<%if(i == item.getAmount()) out.print("selected"); %>><%=i %></option>
									<%} %>
								</select>
							</div>
						</td>
						<td id="intoMoney" class="text-center text-lg text-medium"><%=item.moneyToString() %></td>
						<td class="text-center">
							<button type="button" class="btn btn-ligh remove-from-cart"
								onclick="removeCartItem(this,<%=item.getId()%>)">
								<ion-icon name="trash"></ion-icon>
							</button>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<div class="shopping-cart-footer">
			<div class="column text-lg">
				Thành tiền:
				<h3 id="sumPay" class="d-inline font-weight-bold">
					<%if(Cart != null) out.print(Cart.getThanhTien()); else out.print("0 đ");%>
				</h3>
			</div>
		</div>
		<div class="shopping-cart-footer">
			<div class="column">
				<a class="btn btn-outline-primary" href="Home"><i
					class="icon-arrow-left"></i>Tiếp tục mua</a>
			</div>
			<div class="column">
				<%if(Cart != null && Cart.size() > 0)
					out.print("<button type=\"button\" id=\"btn-payCart\" class=\"btn btn-success\" onclick=\"showConfirmOrder()\">Đặt mua ngay</button>");
				%>
			</div>
		</div>
	</div>

	<!-- Modal confirm Order -->
	<div id="modalConfirmOrder" class="modal">
		<span
			onclick="document.getElementById('modalConfirmOrder').style.display='none'"
			class="close" title="Close Modal">×</span>
		<div class="modal-content">
			<h2>Hoàn tất đặt hàng</h2>
			<p>Đặt tất cả các sách trong giỏ hàng của bạn.</p>

			<div class="d-flex justify-content-between">
				<button type="button"
					onclick="document.getElementById('modalConfirmOrder').style.display='none'"
					class="btn btn-outline-secondary">Hủy bỏ</button>
				<a href="ThanhToan" role="button" class="btn btn-success text-light">Đặt
					hàng</a>
			</div>
		</div>
	</div>

	<!-- Modal confirm clear cart -->
	<div id="confirmClean" class="modal">
		<span
			onclick="document.getElementById('confirmClean').style.display='none'"
			class="close" title="Close Modal">×</span>
		<div class="modal-content">
			<h2>Xóa sạch giỏ hàng</h2>
			<p>Bạn có muốn xóa tất cả sách đã chọn ?</p>

			<div class="d-flex justify-content-between">
				<button type="button" onclick="clearCart()"
					class="btn btn-outline-danger">Xóa</button>
				<button type="button"
					onclick="document.getElementById('confirmClean').style.display='none'"
					class="btn btn-outline-secondary">Hủy</button>
			</div>
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

	<script type="text/javascript" src="./JS/cart_js.js"></script>
</body>
</html>