<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
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
					src="./IMG/logo_jtc.png" height="55" alt="Jbooks" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="Home"> <ion-icon
								name="home-outline"></ion-icon> TRANG CH???
					</a></li>
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center link-cart" href="Cart">
							<c:if test="${lengthCart != null && lengthCart > 0}">
								<span id="badge-cart" class="badge rounded-pill bg-danger text-light">
									${lengthCart }
								</span>
							</c:if>
						<ion-icon name="cart-outline"></ion-icon> GI??? H??NG
					</a></li>
					<li class="nav-item active"><a
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
	<div id="body" class="container pt-2 pb-4 grid">
		<div class="row ml-2 mr-2">
			<div class="col-sm-12 pt-3">
				<h4>????n H??ng C???a T??i</h4>
				<hr>
			</div>
		</div>
			
		<c:choose>
			<c:when test="${listBills == null || listBills.size() < 1 }">
				<div class="row">
					<div class="col-sm-12">
						<div class="alert alert-warning text-center" role="alert">
						  B???n ch??a c?? ????n h??ng n??o!
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${listBills }" var="cart">
					<div class="row ml-3 mr-3 mb-4 bg-light rounded">
						<div class="col-sm-12">
							<div class="d-flex justify-content-between pt-3 pb-3 border-bottom">
								<span class="badge badge-pill badge-success p-2">
									M?? ????n h??ng: #${cart.getBill().getId() }
								</span>
								<span class="badge badge-pill badge-info p-2">
									Ng??y ?????t: ${cart.getDateOrder() }
								</span>
								<span class="badge badge-pill badge-secondary p-2">
									<c:choose>
										<c:when test="${cart.getBill().isStatus() }">
											<c:out value="???? x??c nh???n"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="??ang ch??? x??c nh???n"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
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
							<div class="d-flex justify-content-end pt-3 pb-3 border-top">
								<h5 class="font-weight-bold text-warning">${cart.getThanhTien() }</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
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
</body>
</html>