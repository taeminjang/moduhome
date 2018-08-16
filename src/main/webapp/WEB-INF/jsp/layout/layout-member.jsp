<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

			<tiles:insertAttribute name="header-m"/>
            <!-- 메인container-->
           	
           	
           	<tiles:insertAttribute name="body"/>
            <!-- // container -->
            
            <tiles:insertAttribute name="footer-m"/>

</html>