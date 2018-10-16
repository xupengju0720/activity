<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>

<body style="width: 600px;overflow:hidden;overflow-y:auto;">
<script type="text/javascript">
function countall(aid) {
	var idp = [];
	$(".chk").each(function(){
		if($(this).prop("checked")){
			var id=$(this).attr("myid");
			idp.push(id);
		}
	})
	if(idp.length==0){
		alert("未选择学生");
	}else{
	var ids = idp.join(',');
	layer_show("学生打分","Activity/countall?ids="+ids+"&id="+aid,400,400);
	}
}
function openedit(id){
	layer_show("学生打分","Activity/countone?id="+id,400,400);
}


</script>
        <label class="searchtext" style="margin-left: 50px;"><b>学生测评：</b></label>
        <button class="seachbt" type="button" onclick="countall(${requestScope.activity.id});">批量打分</button>
        <table class="tablelist" style="width:500px;margin-left: 50px;">
    	<thead>
    	<tr>
        <th><input type="checkbox" style="vertical-align:middle;">全选 </th>
        <th>活动</th>
        <th>学生</th>
        <th>分数</th>
        <th>状态</th>
        <th>评语</th>
        <th>修改分数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td><input type="checkbox" style="vertical-align:middle;" class="chk" myid="${row.user_id}"></td>
        <td>${row.aname}</td>
        <td>${row.uname}</td>
        <td>${row.point}</td>
        <td>${row.status_Name}</td>
        <td>${row.comments}</td>
        <td>
        <a href="javascript:openedit(${row.id});" class="tablelink">打分</a></td>
    </tr>  
        </c:forEach>
        </tbody>
    </table>
 <div class="inputbtpanel" style="width: 600px;margin-top: 20px;">
					<button class="seachbt1" type="button" onclick="layer_close();">取消</button>
				</div>
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

