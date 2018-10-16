<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
</head>
<body>
 <script type="text/javascript">
 function change(){
		$("#vyselect").val($("#ayselect").val());
	}
 </script> 
    <form action="Activity_report/index" method="post">
       <div class="searchview">
        <label class="searchtext"><b>名称：</b></label>
        <select id="ayselect" class="inputselect" onchange="change();">
          <c:forEach items="${requestScope.alist}" var="r">
          <c:if test="${requestScope.number==r.id}">
          <option selected="selected" value="${r.id}">${r.name}</option>    
          </c:if> 
          <c:if test="${requestScope.number!=r.id}">
          <option value="${r.id}">${r.name}</option>    
          </c:if> 
         </c:forEach>
         </select>
       	<input type="hidden" name="table" value="Activity_report"/>
       	<input type="hidden" name="col" value="activity_id"/>
       	<input type="hidden" name="ex" value="="/>
        <input type="hidden"  name="value" id="vyselect" value="${requestScope.number}"/>
        <button class="seachbt" type="submit">查询</button>
       </div>
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>活动</th>
        <th>日报人</th>
        <th>时间</th>
        <th>课程进度</th>
        <th>学生状况</th>
        <th>市场状况</th>
        <th>其他信息</th>
        <th>日总结</th>
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.oname}</td>
        <td>${row.date}</td>
        <td>${row.tprogress}</td>
        <td>${row.sprogress}</td>
        <td>${row.cprogress}</td>
        <td>${row.json}</td>
        <td>${row.comments}</td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_report/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_report/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_report/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_report/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

