<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detail</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	User u = (User) session.getAttribute("userobj");
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 150px; weight: 150px"><br>
				<h4 class="mt-4">
					Book Name:<span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-regular fa-envelope"></i>EMail: <%=b.getEmail()%></h5>
				<%
				}
				%>

				<div class="row mt-2">
					<div class="col-md-4 text-success text-center p-2 ">
						<i class="fa-solid fa-money-bill fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-success text-center p-2 ">

						<i class="fa-solid fa-truck-fast fa-2x"></i>
						<p>Free shipping</p>
					</div>
					
				</div>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Continue shopping</a> <a href="index.jsp"
						class="btn btn-danger"><%=b.getPrice() %><i class="fa-solid fa-dollar-sign"></i></a>
				</div>
				<%
				}else{
				%>
				<div class="text-center p-3">
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><%=b.getPrice() %><i class="fa-solid fa-dollar-sign"></i></a>
				</div>
				<% }
				%>
			</div>
		</div>
	</div>
</body>
</html>