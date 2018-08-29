<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div class="container-fluid"  style="background-color: #ffffff;">
		<tiles:insertAttribute name="header-m"/>
	    <section class="padding-top100" style="padding-top: 100px; background-color: #000000;">
	      <!-- <div>&nbsp;</div> -->
		</section>
		<div class="container-fluid">
		
			<div class="col-md-2">           	
				<tiles:insertAttribute name="lefter-my"/>
			</div>
			<div class="col-md-10">
				<tiles:insertAttribute name="body"/>
			</div>
		</div>
			
		<tiles:insertAttribute name="footer-m"/>
	</div>
</body>
</html>