<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${cart == null || cart.size() < 1 }">
	<c:redirect url="Home"></c:redirect>
</c:if>
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
<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<!-- My CSS -->
<link rel="stylesheet" href="./CSS/home_reset.css">
</head>
<body>
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
					src="./IMG/logo_jtc.png" height="55" alt="" loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="Home"> <ion-icon
								name="home-outline"></ion-icon> TRANG CH???
					</a></li>
					<li class="nav-item active"><a
						class="nav-link d-flex align-items-center link-cart" href="Cart">
							<ion-icon name="cart-outline"></ion-icon> GI??? H??NG
					</a></li>
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="HistoryOrder"> <ion-icon
								name="hourglass-outline"></ion-icon> L???CH S??? MUA H??NG
					</a></li>
				</ul>
			</div>
			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<!-- Avatar -->
				<c:choose>
					<c:when test="${user == null }">
						<a href="LoginRegister?exist=1" type="button"
						class="btn btn-outline-light">????ng nh???p</a>
						<a href="LoginRegister?exist=0" type="button"
						class="btn btn-outline-light ml-2">????ng k??</a>
					</c:when>
					<c:otherwise>
						<a class="nav-link text-light d-flex align-items-center text-uppercase"
						href="User">
							<ion-icon name="person-outline"></ion-icon>
							${user.getName() }
						</a>
						<a class="btn btn-outline-danger ml-2" href="Logout" type="button">????ng xu???t </a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<!-- Body -->
	<div id="body" class="container pt-3">
		<div class="alert alert-success" role="alert">
			<h4 class="text-center">?????t h??ng th??nh c??ng !</h4>
		</div>
		<div class="mb-2 p-3 bg-light rounded d-flex justify-content-between">
			<span><strong>M?? ????N H??NG: </strong>#${cart.getBill().getId() }</span> <span>TH???I
				GIAN: <strong>${cart.getDateOrder() }</strong>
			</span>
		</div>
		<table class="table pt-3 bg-light">
			<thead>
				<tr class="table-active">
					<th scope="col">#</th>
					<th scope="col">S???n ph???m s??ch</th>
					<th scope="col">S??? l?????ng</th>
					<th scope="col">Th??nh ti???n</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${0 }"></c:set>
				<c:forEach items="${cart.getCart() }" var="ci">
					<tr>
						<th scope="row">${i }</th>
						<td>${ci.getName() }</td>
						<td>x ${ci.getAmount() }</td>
						<td>${ci.moneyToString() }</td>
					</tr>
				</c:forEach>
				<tr class="table-active">
					<td></td>
					<td></td>
					<td></td>
					<td><h4 class="text-success font-weight-bold">${cart.getThanhTien() }</h4></td>
				</tr>
			</tbody>
		</table>
		<div class="mb-4 mt-4 d-flex justify-content-between">
			<a href="Home" role="button" class="btn btn-success text-light">Trang
				Ch???</a> <a href="HistoryOrder" role="button" class="btn btn-danger text-light">Xem
				L???ch S??? Mua H??ng</a>
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
			style="background-color: rgba(0, 0, 0, 0.2);">?? 2021 Copyright:
			Tr???n Trung Ch??nh</div>
	</footer>
	${cart.clearCart()}
</body>
</html>