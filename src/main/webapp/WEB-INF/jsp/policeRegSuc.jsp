<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<title>�Ű�Ϸ�</title>
</head>

<script src="/style/resources/common/jquery-1.9.1.min.js"></script>
<script src="/style/resources/common/jquery.easing.1.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {   
	alert("�Ű� �����Ǿ����ϴ�. �����մϴ�.");
	
	var url = $(".url").attr("id"); 
	location.href = url;
});
</script>
<body>
<div style="display:none;" class="url" id="${url}" >
</div>  
</body>
</html>