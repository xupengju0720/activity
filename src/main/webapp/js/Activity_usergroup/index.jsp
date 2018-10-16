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
	layer_show("部门信息","Activity_usergroup/edit",600,250);
	}
	
	function openedit(id){
	layer_show("部门信息","Activity_usergroup/edit?id="+id,600,250);
	}
	function del(id){
		$.post("Activity_usergroup/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
</script>

</head>


<body>
   <span class="printtitle"></span>
     
     <form action="Activity_usergroup/index" method="post">
       <div class="searchview">
       <label class="searchtext"><b>名称：</b></label>
       	<input type="hidden" name="table" value="Activity_usergroup"/>
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
        <th>活动</th>
        <th>小组名称</th>     
        <th>成员</th>
        <th>项目路径</th>     
        <th>项目详情</th>
        <th>创建日期</th>     
        <th>操作员</th>
        <th>备注</th>     
        <th>分数1</th>
        <th>分数2</th>
        <th>分数3</th>
        <th>分数4</th>
        <th>分数5</th>
        <th>分数6</th>
        <th>分数7</th>
        <th>分数8</th>
        <th>分数9</th>
        <th>分数10</th>
        <th>操作</th>     
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.name}</td>
        <td>${row.ids}</td>
        <td>${row.path}</td>
        <td>${row.project}</td>
        <td>${row.createdate}</td>
        <td>${row.operater_id}</td>
        <td>${row.comments}</td>
        <td>${row.point1}</td>
        <td>${row.point2}</td>
        <td>${row.point3}</td>
        <td>${row.point4}</td>
        <td>${row.point5}</td>
        <td>${row.point6}</td>
        <td>${row.point7}</td>
        <td>${row.point8}</td>
        <td>${row.point9}</td>
        <td>${row.point10}</td>
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
        <li class="paginItem"><a href="Activity_usergroup/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_usergroup/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_usergroup/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_usergroup/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

