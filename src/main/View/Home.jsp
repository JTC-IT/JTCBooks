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
					<li class="nav-item active"><a
						class="nav-link d-flex align-items-center" href="Home"> <ion-icon
								name="home-outline"></ion-icon> TRANG CHỦ
					</a></li>
					<li class="nav-item">
						<a class="nav-link d-flex align-items-center link-cart" href="Cart">
							<c:if test="${lengthCart != null && lengthCart > 0}">
								<span id="badge-cart" class="badge rounded-pill bg-danger text-light">
									${lengthCart }
								</span>
							</c:if>
							<ion-icon name="cart-outline"></ion-icon> GIỎ HÀNG
						</a></li>
					<li class="nav-item"><a
						class="nav-link d-flex align-items-center" href="HistoryOrder"> <ion-icon
								name="hourglass-outline"></ion-icon> LỊCH SỬ MUA HÀNG
					</a></li>
				</ul>
			</div>
			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<!-- Avatar -->
				<c:choose>
					<c:when test="${user == null }">
						<a href="LoginRegister?exist=1" type="button"
						class="btn btn-outline-light">Đăng nhập</a>
						<a href="LoginRegister?exist=0" type="button"
						class="btn btn-outline-light ml-2">Đăng ký</a>
					</c:when>
					<c:otherwise>
						<a class="nav-link text-light d-flex align-items-center text-uppercase"
						href="User">
							<ion-icon name="person-outline"></ion-icon>
							${user.getName() }
						</a>
						<a class="btn btn-outline-danger ml-2" href="Logout" type="button">Đăng xuất </a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<!-- Body -->
	<div class="container min-vh-100">
		<div class="row">
			<div class="col-sm-3 list-loai_sach">
				<div class="has-search mb-3">
					<ion-icon name="search" class="form-control-feedback" size="small"></ion-icon>
					<input type="text" id="search" class="form-control"
						placeholder="Tìm kiếm" oninput="searchByKey(this)">
				</div>
				<dl>
					<dt class="p-2 bg-warning font-weight-bold text-dark text-uppercase">
						Thể Loại Sách
					</dt>
					<c:if test="${listCategory != null }">
						<c:forEach items="${listCategory }" var="ls">
							<dd class="loaiSach-item" onclick="searchByCategory(${ls.getId()})">
								${ls.getName() }
							</dd>
						</c:forEach>
					</c:if>
				</dl>
				<div></div>
			</div>
			<div class="col-sm-9 list-Sach">
				<!-- Slider -->
				<div id="myCarousel" class="carousel slide m-3" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="./IMG/slide1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="./IMG/slide2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="./IMG/slide3.jpg"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#myCarousel" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#myCarousel" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
				<!-- Gird Books -->
				<div class="container grid">
					<div class="row" id="listBooks">
					<c:if test="${listBook != null }">
						<c:forEach items="${listBook }" var="s">
							<div class="col-sm-4 pb-3 bookItem">
								<div class="card">
									<div class="card-body d-flex flex-column align-items-center">
										<img alt="${s.getName() }" src="IMG/${s.getImg() }">
										<div
											class="card-content d-flex flex-column align-items-center mt-3 justify-content-between">
											<div class="w-100">
												<div class="font-weight-bold text-center text-truncate">${s.getName() }</div>
												<small class="text-primary text-center text-truncate">${s.getAuthor() }</small>
											</div>
											<div
												class="w-100 mt-3 d-flex align-items-end justify-content-between">
												<strong class="text-danger">${s.priceToString() }</strong> <a
													class="btn btn-outline-success"
													href="OrderControl?id=${s.getId() }" role="button">Mua</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>
				</div>
				<!-- Next list books -->
				<div class="d-flex justify-content-center mb-4">
					<button id="btnSeeMore" type="button" class="btn btn-outline-info"
						onclick="seeMore()">Xem thêm >></button>
				</div>
			</div>
		</div>
	</div>
	<!-- Back top -->
	<div id="back-top">
		<ion-icon name="arrow-up"></ion-icon>
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
	<!--JavaScript cdn-->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="./JS/home.js"></script>
</body>
</html>