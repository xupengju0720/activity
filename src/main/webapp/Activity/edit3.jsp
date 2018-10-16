<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>

<body style="overflow:hidden;overflow-y:auto">
   <span class="printtitle"></span>
   <label class="inputtext ">活动名称:</label><label class="inputtext"> ${requestScope.sslist.name}</label> 
   <br><label class="inputtext ">设施表:</label> 
  
    <table class="tablelist" style="width: 300px;margin-left: 50px;">
    	<thead>
    	<tr>
        <th width="150px">设施</th>
        <th width="150px">有无</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.sheshi}" var="r" varStatus="v">
        <c:forEach items="${requestScope.sslist.options_Number}" var="rr">
        <c:if test="${v.index==rr}">
        <tr>
        <td width="150px">${r}</td>
        <td width="150px" style="color: #04CF3D">有</td>
        </tr>  
        </c:if>
        </c:forEach>
        <c:forEach items="${requestScope.sslist.options_Numbers}" var="rrr">
        <c:if test="${v.index==rrr}">
        <tr>
        <td width="150px">${r}</td>
        <td width="150px" style="color: #F02B05">无</td>
        </tr>  
         </c:if>
        </c:forEach>
        </c:forEach>
        </tbody>
    </table>
<c:import url="../Model/list_footer.jsp" ></c:import>

