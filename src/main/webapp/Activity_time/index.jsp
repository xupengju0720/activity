<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<script>
// function fresh(){
// location.href="Department/index?pageno="+p;
// }
function returnobject(o){
	
	}
function feedback(){
    var id = $("#vyselect").val();
	layer_show("反馈","Activity_time/feedback?id="+id,900,500);
	}
function market(){
	 var id = $("#vyselect").val();
	layer_show("市场","Activity_time/market?id="+id,800,500);
	}
function checkwork(){
	var id = $("#vyselect").val();
	layer_show("考勤","Activity_time/checkwork?id="+id,800,500);
	}
function dayreport(){
	var id = $("#vyselect").val();
	layer_show("日报","Activity_time/report?id="+id,600,500);
	}

  function openwin(id){
	  var id = $("#vyselect").val();
	layer_show("添加活动时间","Activity_time/addatime?id="+id,900,500);
	}
	
	function openedit(id){
	layer_show("部门信息","Activity_time/edit?id="+id,900,500);
	}
	function del(id){
		$.post("Activity_time/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
	function change(){
		$("#vyselect").val($("#ayselect").val());
	}
</script>

</head>


<body>
   <span class="printtitle"></span>
      <form action="Activity_time/index" method="post">
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
       	<input type="hidden" name="table" value="Activity_time"/>
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
        <th>活动</th>
        <th>时间</th>
        <th>教室信息</th>
        <th>执行人</th>
        <th>上午</th>
        <th>上午</th>
        <th>下午</th>
        <th>下午</th>
        <th>晚上</th>
        <th>晚上</th>
        <th>状态</th>
        <th>反馈信息</th>
        <th>市场活动</th>
        <th>操作</th>     
        <th>考勤</th>
        <th>日报</th>
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.date}</td>
        <td>${row.roominfo}</td>
        <td>${row.oname}</td>
        <td>${row.time1}</td>
        <td>${row.time2}</td>
        <td>${row.time3}</td>
        <td>${row.time4}</td>
        <td>${row.time5}</td>
        <td>${row.time6}</td>
        <td>${row.status_Name}</td>
        <td><a href="javascript:feedback();" class="tablelink" >反馈</a></td>
        <td><a href="javascript:market();" class="tablelink" >市场</a></td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink" >修改</a>
        </td>
        <td><a href="javascript:checkwork();" class="tablelink" >考勤</a></td>
        <td><a href="javascript:dayreport();" class="tablelink" >日报</a></td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity_time/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

