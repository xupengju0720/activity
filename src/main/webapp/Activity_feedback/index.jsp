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
   <span class="printtitle"></span>
        <form action="Activity_feedback/index" method="post">
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
       	<input type="hidden" name="table" value="Activity_feedback"/>
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
        <th>反馈人</th>
        <th>回应</th>
        <th>状态</th>
        <th>text1</th>
        <th>text2</th>
        <th>text3</th>
        <th>text4</th>
        <th>text5</th>
        <th>text6</th>
        <th>text7</th>
        <th>text8</th>
        <th>text9</th>
        <th>text10</th>
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.uname}</td>
        <td>${row.result}</td>
        <td>${row.status_Name}</td>
        <td>${row.text1}</td>
        <td>${row.text2}</td>
        <td>${row.text3}</td>
        <td>${row.text4}</td>
        <td>${row.text5}</td>
        <td>${row.text6}</td>
        <td>${row.text7}</td>
        <td>${row.text8}</td>
        <td>${row.text9}</td>
        <td>${row.text10}</td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_feedback/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_feedback/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_feedback/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_feedback/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

