<%@page import="BLL.admin_BLL"%>
<%@page import="DTO.Product_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	admin_BLL admin = new admin_BLL();
	ResultSet list= admin.get_listCategory();
	ArrayList<Product_DTO> list_product= admin.getListProduct();
%>
<html>
	<head>
		<title>Quản lý chi tiêu</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" type="text/css" href="public/css/style.css" />
	</head>
	<body id="page" onload="ready()">
		<div id="header">
			<p>Quản lý sản phẩm</p>
			<div class="user">
				<ul>
					<li><a href="#" class="color-DDD" id="userName">Admin</a>
						<ul class="ul2" id="intro">
							<li><a href="login.jsp">Thoát</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div id="ndchinh">
			<div class="qlchitieu">
				
				<div class="mucchitieu">
					<p class="bg-color-4A8DF8">Thêm sản phẩm mới</p>
					<form action="Addproduct" method="post">
						<p>
							<label>Danh mục sản phẩm: </label>
							<select name="Category" style="margin-left:60px">
								<option>--Product Category--</option>
								<%while(list.next()){ %>
								<option><%=list.getString(1) %></option>
								<%} %>
								
							</select>
						</p>
						<p>
							<label style="margin-left:45px">Tên sản phẩm: </label>
							<input style="margin-left:60px" type="text" name="name" />
						</p>
						<p>
							<label style="margin-left:125px">giá: </label>
							<input style="margin-left:60px" stype="text" name="price" />
						</p>
						<p>
							<label style="margin-left:115px">Màu: </label>
							<input style="margin-left:60px" type="text" name="color" />
						</p>
						<p>
							<label style="margin-left:115px" >Size: </label>
							<select style="margin-left:60px" name="size">
								<option>--Chọn size--</option>
								<option> 1m * 1m9 </option>
								<option> 1m2 * 1m9 </option>
								<option> 1m8 * 2m </option>
								<option> 1m6 * 2m </option>
								<option> 2m  * 2m2 </option>
							</select>
						</p>
						<p>
							<label style="margin-left:106px">Mô tả: </label>
							<input style="margin-left:60px" type="text" name="mota" />
						</p>
						<p>
							<label style="margin-left:116px">Ảnh: </label>
							<input style="margin-left:60px" type="file" name="img"/>
						</p>
						
						<p>
							<input type="submit" value="Thêm Sản Phẩm" class="phai-button" />
						</p>
						
					</form>
				</div>			
			</div>
			<a href = "ProductsAPI.html">Danh sách sản phẩm mới...</a>
			<div class="clear"></div>
		</div>
		<div id="update" class="modal">
		<div class="content">
			<span class="close">×</span>
			<h1>Thêm ảnh cho sản phẩm</h1>
			
			<form action="update_process.jsp" method="post">
				<input id="updateId" name="idHang" type="text"
					 style="display: none;" />
				<div class="form-group">
					<label>Tên Hàng: </label> <input id=updatename type="text" name="name"
						placeholder=""
						 class="form-control" />
				</div>
				<div class="form-group">
					<label>Nhà Sản Xuất: </label> <input id=updatenhasx type="text" name="nhasx"
						
						class="form-control" />
				</div>
				<div class="form-group">
					<label>Nhà Phân Phối: </label> <input id=updatenhapp type="text" name="nhapp"
						placeholder=""
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="submit" value="Lưu" class="btn btn-primary" /> <a
						class="btn btn-default" href="../student/student.jsp">Quay lại</a>
				</div>
			</form>
		</div>
	</div>
	</body>
	<script src="public/js/myScript.js"></script>		
	
</html>