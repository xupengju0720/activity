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
	layer_show("部门信息","Activity_operator/edit",600,250);
	}
	
	function openedit(id){
	layer_show("部门信息","Activity_operator/edit?id="+id,600,250);
	}
	function del(id){
		$.post("Activity_operator/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="Activity_operator/index" method="post">
     <label class="searchtext">姓名:</label>
     	<input type="hidden" name="table" value="Activity_operator"/>
       	<input type="hidden" name="col" value="name"/>
       	<input type="hidden" name="ex" value="like"/>
         <input class="searchinput" name="value"/>        
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" type="button" onclick="openwin();">新增</button>
         
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th width="15%">用户名</th>
        <th width="10%">姓名</th>
        <th width="7%">类型</th>
        <th  width="10%">电话</th>
        <th  width="5%">权限</th>
        <th width="15%">状态</th>
        <th width="15%">备注</th>
        <th width="15%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.niki}</td>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.type_Name}</td>
        <td class="bigtext">${row.tel}</td>
        <td class="bigtext">${row.power_Name}</td>
        <td class="bigtext">${row.status_Name}</td>
        <td>${row.comments}</td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" ">修改</a>
        </td>
        
        </tr>  
        </c:forEach>
        </tbody>
    </table>
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_operator/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_operator/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_operator/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_operator/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

