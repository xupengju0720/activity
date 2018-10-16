<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<script>
function returnobject(o){
	
	}

function timedetail(id){
   layer_show("时间详情","Activity/datedetail?id="+id,950,400); 
}
function openwin(){
	layer_show("活动新增","Activity/edit",800,500);
	}
function ceping(id){
	layer_show("活动测评","Activity/evaluation?id="+id,600,450);
}	
function zongjie(id){
	layer_show("活动总结","Activity/activityzongjie?id="+id,800,500);
}	
function sheshi(id){
	 layer_show("设施信息","Activity/sheshidetail?id="+id,400,500);
}	
function person(id){
	 layer_show("人员信息","Activity/persondetail?id="+id,1000,400); 
}	
	
	function openedit(id){
	layer_show("活动修改","Activity/edit?id="+id,800,500);
	}
	function del(id){
		$.post("Activity/delete",{id:id},function(json){
			if(json.status>0){
				location.reload();
			}
	},"json")
	}
function change() {
	var id=$("#myselect").val(); 
	$(".ppp").css("display","none");
	$(".ppp").removeAttr("name");
	$(".rowname").removeAttr("value");
	$(".rowppp").removeAttr("value");
	if(id==0){
		valuezero();
	}
	if(id==1){
		valueone();
	}
	if(id==2){
		valuetwo();
	}
	if(id==3){
		valuethree();
	}
	
}
function valuezero() {
	$(".valuezero").css("display","inline-block");
	$(".valuezero").attr("name","value");
	$(".rowname").attr("value","school_id");
	$(".rowppp").attr("value","like");
}
function valueone() {
	$(".valueone").css("display","inline-block");
	$(".valueone").attr("name","value");
	$(".rowname").attr("value","type");
	$(".rowppp").attr("value","=");
}
function valuetwo() {
	$(".valuetwo").css("display","inline-block");
	$(".valuetwo").attr("name","value");
	$(".rowname").attr("value","source_operator_id");
	$(".rowppp").attr("value","=");
}
function valuethree() {
	$(".valuethree").css("display","inline-block");
	$(".valuethree").attr("name","value");
	$(".rowname").attr("value","charge_operator_id");
	$(".rowppp").attr("value","=");
}
$(function(){
	valuezero();
})
</script>

</head>


<body>
   <span class="printtitle"></span>
     <form action="Activity/index" method="post">
         <div class="searchview">
       	<input type="hidden" name="table" value="Activity"/>
       	<input type="hidden" name="col" class="rowname"/>
       	<input type="hidden" name="ex"  class="rowppp"/>
       	 <label class="searchtext"><b>选择：</b></label>
           <select class="inputselect" id="myselect" onchange="change();">
            <option value="0">学校</option>
            <option value="1">类型</option>
            <option value="2">来源人</option>
            <option value="3">负责人</option>
           </select>
       	 <input type="text" class="searchinput valuezero ppp"  placeholder="学校名称"  style="display: none" />
         <select  class="inputselect valueone ppp" style="display: none">
         <c:forEach items="${requestScope.tlist}" var="r" varStatus="v"> 
         <option value="${v.index}">${r}</option>
         </c:forEach>
         </select>
         <input type="text" class="searchinput valuetwo ppp"  placeholder="来源人"  style="display: none" />
         <input type="text" class="searchinput valuethree ppp"   placeholder="负责人" style="display: none" />
        <button class="seachbt" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>名称</th>
        <th>时间安排</th> 
        <th>学校</th>     
        <th>学院</th>
        <th>参加人数</th>     
        <th>班级数量</th>
        <th>辅导员</th>     
        <th>课程信息</th>
        <th>计划安排信息</th>     
        <th>活动类型</th>     
        <th>状态</th>     
        <th>注意事项</th>     
        <th>人员信息</th> 
        <th>设施</th>     
        <th>时间信息</th>
        <th>操作</th> 
        </tr>
        </thead>
        <tbody>
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.name}</td>
        <td>${row.date}</td>
        <td>${row.school_id}</td>
        <td>${row.college_id}</td>
        <td>${row.count}</td>
        <td>${row.classcount}</td>
        <td>${row.instructor_user_id}</td>
        <td>${row.courseinfo}</td>
        <td>${row.planinfo}</td>
        <td>${row.type_Name}</td>
        <td>${row.status_Name}</td>
        <td>${row.attention}</td>
        <td><a class="tablelink" onclick="person(${row.id});">详情</a></td>
        <td><a class="tablelink" onclick="sheshi(${row.id});">详情</a></td>
        <td> <a class="tablelink" onclick="timedetail(${row.id});">详情</a></td>
        <td><a href="javascript:openedit(${row.id});" class="tablelink">修改</a>
           <a href="javascript:zongjie(${row.id});" class="tablelink">总结</a>
           <a href="javascript:ceping(${row.id});" class="tablelink">测评</a>
            <%-- <a href="javascript:del(${row.id});" class="tablelink">删除</a> --%>
        </td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
    	<i class="blue">${requestScope.result.pageno}&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="Activity/index?pageno=${requestScope.result.first_pageno}">首页</a></li>
        <li class="paginItem"><a href="Activity/index?pageno=${requestScope.result.pro_pageno}">上一页</a></li>
        <li class="paginItem"><a href="Activity/index?pageno=${requestScope.result.next_pageno}">下一页</a></li>
        <li class="paginItem"><a href="Activity/index?pageno=${requestScope.result.last_pageno}">末页</a></li>
        </ul>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

