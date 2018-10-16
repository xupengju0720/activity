<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<script>
// function fresh(){
// location.href="Department/index?pageno="+p;
// }
function returnobject(o){
	
	}

   function person(id){
	 layer_show("成员信息","Activity_usergroup/persondetail?id="+id,600,400);
	}

   function openwin(){
	   var id = $("#vyselect").val();
	 layer_show("新增小组","Activity_usergroup/addgroup?id="+id,1000,500);
	}
	function openedit(id,activity_id){
	layer_show("修改信息","Activity_usergroup/openedit?id="+id+"&activity_id="+activity_id,1000,500);
	}
	function groupcount(id){
		 layer_show("打分","Activity_usergroup/groupcount?id="+id,600,400);
	}
	
	
	function del(id){
		$.post("Activity_usergroup/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
	function teamperson(str){
		layer_show("人员详情","Activity_usergroup/teamperson?ids="+str,300,350)
	}
	function change(){
		$("#vyselect").val($("#ayselect").val());
	}
</script>

</head>


<body>
     <form action="Activity_usergroup/index" method="post">
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
       	<input type="hidden" name="table" value="Activity_usergroup"/>
       	<input type="hidden" name="col" value="activity_id"/>
       	<input type="hidden" name="ex" value="="/>
        <input type="hidden"  name="value" id="vyselect" value="${requestScope.number}"/>
        <button class="seachbt" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>活动名称</th>     
        <th>小组名称</th>
        <th>操作员</th>
        <th>上传路径</th>
        <th>创建日期</th>
        <th>项目</th>
        <th>人员</th>     
        <th>分数</th>     
        <th>操作</th>     
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.name}</td>
        <td>${row.oname}</td>
        <td>${row.path}</td>
        <td>${row.createdate}</td>
        <td>${row.project}</td>
        <td><a href="javascript:person(${row.id});" class="tablelink" >人员</a></td>
        <td><a href="javascript:groupcount(${row.id});" class="tablelink" >打分</a></td>
        <td><a href="javascript:openedit(${row.id},${requestScope.number});" class="tablelink" >修改</a>
         <%--<a href="javascript:del(${row.id});" class="tablelink" >删除</a> --%>
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

