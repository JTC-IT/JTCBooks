<%@page import="Model.Bo.CartBo"%>
<%@page import="Model.Bean.Customer"%>
<%@page import="Model.Bean.Book"%>
<%@page import="Model.Bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bo.BookBo"%>
<%@page import="Model.Bo.CategoryBo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JBooks-Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--JavaScript cdn-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<!-- My CSS -->
<link rel="stylesheet" href="app.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8") ;
	response.setCharacterEncoding("utf-8");

	CategoryBo categoryBo = new CategoryBo();
	BookBo bookBo = new BookBo();
	
	ArrayList<Category> listCategory = categoryBo.getCategorys();
	ArrayList<Book> listBook = bookBo.getBooks();
	
	//get Khach hang
	Customer user = (Customer) session.getAttribute("user");
%>
<!-- Header -->
<nav class="navbar navbar-expand-lg sticky-top">
  <!-- Container wrapper -->
  <div class="container-fluid">
    <!-- Toggle button -->
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <ion-icon name="menu"></ion-icon>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Navbar brand -->
      <a class="navbar-brand mt-2 mt-lg-0" href="#">
        <img
          src="./logo_jtc.png"
          height="55"
          alt="Jbooks"
          loading="lazy"
        />
      </a>
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item active">
          <a class="nav-link d-flex align-items-center" href="Home.jsp">
          	<ion-icon name="home-outline"></ion-icon>
          	TRANG CHỦ
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link d-flex align-items-center link-cart" href="Cart.jsp">
          	<span id="badge-cart" class="badge rounded-pill bg-danger text-light"><%
          		CartBo Cart = (CartBo)session.getAttribute("cart");
          		if(Cart != null && Cart.size() > 0) out.print(Cart.size());
          	%></span>
          	<ion-icon name="cart-outline"></ion-icon>
          	GIỎ HÀNG
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link d-flex align-items-center" href="#">
          	<ion-icon name="hourglass-outline"></ion-icon>
          	LỊCH SỬ MUA HÀNG
          </a>
        </li>
      </ul>
    </div>
    <!-- Right elements -->
    <div class="d-flex align-items-center">
      <!-- Avatar -->
      <%if(user == null) {%>
      	<a href="Register.jsp?exist=1" type="button"
          class="btn btn-outline-light">Đăng nhập</a>
        <a href="Register.jsp?exist=0" type="button"
          class="btn btn-outline-light ml-2">Đăng ký</a>
      <%} else{ %>
        <a class="nav-link text-light d-flex align-items-center text-uppercase" href="User.jsp">
        	<ion-icon name="person-outline"></ion-icon>
        	<%=user.getName() %>
        </a>
        <a class="btn btn-outline-danger ml-2 font-weight-bold" href="Logout" type="button">
        	Đăng xuất
        </a>
      </div>
      <%} %>
    </div>
  </div>
</nav>
<!-- Body -->
<div class="container min-vh-100">
<div class="row">
	<div class="col-sm-3 list-loai_sach">
		<div class="has-search mb-3">
		    <ion-icon name="search" class="form-control-feedback" size="small"></ion-icon>
		    <input type="text" id="search" class="form-control" placeholder="Tìm kiếm" oninput="searchByKey(this)">
		</div>
		<dl>
		    <dt class="p-2 bg-warning font-weight-bold text-dark text-uppercase">Thể Loại</dt>
			<% for(Category ls: listCategory){ %>
				<dd class="loaiSach-item" onclick="searchByCategory(<%=ls.getId()%>)"> <%=ls.getName()%></dd>
			<%}%>
		</dl>   
		<div></div>
	</div>
	<div class="col-sm-9 list-Sach">
		<!-- Gird Books -->
		<div class="container grid">
			<div class="row" id="listBooks">
				<%
				int i = 0;
				for(Book s: listBook){
				%>
					<div class="col-sm-4 pb-3 bookItem">
					<div class="card">
						<div class="card-body d-flex flex-column align-items-center">
							<img alt="<%=s.getName()%>" src="image_sach/<%=s.getImg()%>">
							<div class="card-content d-flex flex-column align-items-center mt-3 justify-content-between">
								<div class="w-100">
									<div class="font-weight-bold text-center text-truncate"><%=s.getName() %></div>
									<small class="text-primary text-center text-truncate"><%=s.getAuthor() %></small>
								</div>
								<div class="w-100 mt-3 d-flex align-items-end justify-content-between">
									<strong class="text-danger"><%=s.priceToString()%></strong>
									<a class="btn btn-outline-success" href="OrderControl?id=<%=s.getId()%>" role="button">Mua</a>
								</div>
							</div>
						</div>
					</div>
					</div>
					<%
				}
				%>
			</div>
		</div>
		<!-- Next list books -->
		<div class="d-flex justify-content-center mb-4">
			<button id="btnSeeMore" type="button" class="btn btn-outline-info" onclick="seeMore()">Xem thêm >></button>
		</div>
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
      <a target="_blank" class="rounded-circle m-2 text-white" href="https://www.facebook.com/joseph.ttrungchinh" role="button">
      	<ion-icon name="logo-facebook"></ion-icon>
      </a>
      <!-- Instagram -->
      <a target="_blank" class="rounded-circle m-2 text-white" href="https://www.instagram.com/joseph.trungchinh" role="button">
        <ion-icon name="logo-instagram"></ion-icon>
      </a>
      <!-- Github -->
      <a target="_blank" class="rounded-circle m-2 text-white" href="https://github.com/JTC-IT" role="button">
        <ion-icon name="logo-github"></ion-icon>
      </a>
    </section>
  </div>
  <!-- Copyright -->
  <div class="text-center p-3 text-white" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2021 Copyright: Trần Trung Chính
  </div>
</footer>
<script type="text/javascript" src="main.js"></script>
</body>
</html>