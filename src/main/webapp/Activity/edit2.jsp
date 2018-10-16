<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>

var activity_id= ${sessionScope.activityname.id};
function fresh() {
		location.href = "Activity/index";
	}
function returnobject(o) {

	}
function remove(id){
	$.post("Activity/removeuser",{id:id},function(json){
		if(json.status>0){
			location.reload();
		}
},"json")
}
		
function openwin(){
	layer_show("学生添加","Activity/personadd?activity_id="+activity_id,620,365);
	}
function openwindao(){
	layer_show("就业企业","Activity/edit2",620,365);
	}
	function openedit(id,type){
		if(type==0){
	layer_show("企业编辑","Activity/edit?id="+id,620,365);
		}
		if(type==1){
	layer_show("企业编辑","Activity/edit2?id="+id,620,365);
		}
	}
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
        <label class="inputtext">当前活动:</label>
        <label class="inputtext">${sessionScope.activityname.name}</label>
        <button class="seachbt" type="button" onclick="openwin();">添加学生</button>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th>用户名</th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>qq</th>
        <th>专业</th>
        <th>学校</th>
        <th>学院</th>
        <th>状态</th>
        <th>创建时间</th>
        <th width="8%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.ulist}" var="row" >
        <tr>
        <td class="bigtext">${row.niki}</td>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.sex_Name}</td>
        <td class="bigtext">${row.tel}</td>
        <td class="bigtext">${row.qq}</td>
        <td class="bigtext">${row.classinfo}</td>
        <td class="bigtext">${row.sname}</td>
        <td class="bigtext">${row.cname}</td>
        <td class="bigtext">${row.status_Name}</td>
        <td class="bigtext">${row.createdate}</td>
        <td>
            <a href="javascript:remove(${row.id});" class="tablelink">移除</a>
        </td>
        
        </tr>  
        </c:forEach>
        </tbody>
    </table>
   <%--     
    <div class="pagin">
			<div class="message">
				共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
				<i class="blue">${requestScope.result.pageno}&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a
					href="Activity/persondetail?pageno=${requestScope.result.first_pageno}">首页</a>
				</li>
				<li class="paginItem"><a
					href="Activity/persondetail?pageno=${requestScope.result.pro_pageno}">上一页</a>
				</li>
				<li class="paginItem"><a
					href="Activity/persondetail?pageno=${requestScope.result.next_pageno}">下一页</a>
				</li>
				<li class="paginItem"><a
					href="Activity/persondetail?pageno=${requestScope.result.last_pageno}">末页</a>
				</li>
			</ul>
		</div> --%>
  <c:import url="/Model/list_footer.jsp" ></c:import>