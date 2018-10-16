<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>

<form action="insert" method="post">
<input name="name">
<select name="parentid">
<c:forEach items="${requestScope.sublist}" var="row">
<option value="${row.id}">${row.name}</option>
</c:forEach>
</select>
<button type="submit">保存</button>
</form>

</body>
</html>