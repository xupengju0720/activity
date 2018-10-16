<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>


<c:forEach items="${requestScope.list}" var="r">
${r.name}| ${r.p_name} <a href="delete?id=${r.id}">删除</a><br>
</c:forEach>
<a href="add">新增</a>
</body>
</html>