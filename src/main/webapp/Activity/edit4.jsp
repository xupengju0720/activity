<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>

<body>
   <span class="printtitle"></span>
     <label class="inputtext">当前活动</label>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>活动</th>
        <th>讲师</th>
        <th>地点</th>
        <th>时间</th>
        <th>上午</th>
        <th>上午</th>
        <th>下午</th>
        <th>下午</th>
        <th>晚上</th>
        <th>晚上</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.oname}</td>
        <td>${row.roominfo}</td>
        <td>${row.date}</td>
        <td>${row.time1}</td>
        <td>${row.time2}</td>
        <td>${row.time3}</td>
        <td>${row.time4}</td>
        <td>${row.time5}</td>
        <td>${row.time6}</td>
    </tr>  
        </c:forEach>
        </tbody>
    </table>
<%-- 
<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div> --%>
<c:import url="../Model/list_footer.jsp" ></c:import>

