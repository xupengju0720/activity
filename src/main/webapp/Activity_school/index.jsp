<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<script>
// function fresh(){
// location.href="Department/index?pageno="+p;
// }
function returnobject(o){
	
	}

function openwin(){
	layer_show("部门信息","Activity_school/edit",300,250);
	}
	
	function openedit(id){
	layer_show("部门信息","Activity_school/edit?id="+id,300,250);
	}
	function del(id){
		$.post("Activity_school/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
</script>

</head>


<body>
   <span class="printtitle"></span>
     
     <form action="Activity_school/index" method="post">
       <div class="searchview">
       <label class="searchtext"><b>名称：</b></label>
       	<input type="hidden" name="table" value="Activity_school"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/>
         <input class="searchinput" name="value"/>
        
        <button class="seachbt" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th width="20%">学校</th>
        <th width="12%">操作</th>     
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.name}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
            <a href="javascript:del(${row.id});" class="tablelink" >删除</a>
        </td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_school/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_school/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_school/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_school/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

