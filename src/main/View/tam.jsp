<%@page import="Model.Bean.Customer"%>
<%@page import="Model.Bo.CustomerBo"%>
<%@page import="Model.Bean.Category"%>
<%@page import="Model.Bean.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bo.BookBo"%>
<%@page import="Model.Bo.CategoryBo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JBooks</title>
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
<link rel="stylesheet" href="styles.css">
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
	<div class="container">
		<!-- header -->
		<nav
			class="navbar navbar-expand-sm navbar-dark sticky-top d-flex justify-content-between">
			<div class="navbar-header">
				<span class="navbar-brand font-weight-bold pl-4">JBooks</span>
			</div>
			<ul class="navbar-nav">
				<li class="nav-item active"><a
					class="nav-link d-flex align-items-end" href="Home.jsp"> <ion-icon
							name="home-outline"></ion-icon><span>Trang chủ</span>
				</a></li>
				<li class="nav-item"><a class="nav-link d-flex align-items-end"
					href="Cart.jsp"> <ion-icon name="cart-outline"></ion-icon><span>Giỏ
							hàng</span>
				</a></li>
				<li class="nav-item"><a class="nav-link d-flex align-items-end"
					href="#"> <ion-icon name="hourglass-outline"></ion-icon><span>Lịch
							sử mua hàng</span>
				</a></li>
			</ul>
			<div class="has-search">
			    <ion-icon name="search" class="form-control-feedback" size="small"></ion-icon>
			    <input type="text" id="search" class="form-control" placeholder="Tìm kiếm" oninput="searchByKey(this)">
			</div>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			        	<ion-icon name="person"></ion-icon><%
			        	if(user != null) out.print(user.getName());
			        	%>
			        </a>
			        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
			          <a class="dropdown-item text-primary <%if(user != null) out.print("d-none");%>" href="Register.jsp?exist=1">Đăng nhập</a>
			          <a class="dropdown-item text-primary <%if(user != null) out.print("d-none");%>" href="Register.jsp?exist=0">Đăng ký</a>
			          <a class="dropdown-item text-primary <%if(user == null) out.print("d-none");%>" href="User.jsp">Tài khoản</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item text-danger <%if(user == null) out.print("d-none");%>" href="Logout">Đăng xuất</a>
			        </div>
			      </li>
			</ul>
		</nav>

		<!-- body -->
		<div class="container gird bg-light">
			<div class="row">
				<div class="col-sm-3 list-loai_sach">
					<dl id="nav-left">
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
		<footer class="text-center text-lg-start">
		  <!-- Copyright -->
		  <div class="text-center p-3 text-white">
		    © 2021 Copyright: Trần Trung Chính
		  </div>
		</footer>
	</div>
	<script type="text/javascript" src="main.js"></script>
</body>
</html>