<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
</head>
<body style="overflow:hidden;overflow-y:auto;width: 800px;">
    <script type="text/javascript">
 function change(){
		$("#vyselect").val($("#ayselect").val());
	}
 function edit(id){
	 layer_show("修改","Activity_time/uponecheck?id="+id,600,400)
 }
 function checkall(){
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
	layer_show("学生考勤","Activity_time/updateallview?ids="+ids,400,400); 
	}
 }
 
 </script> 
  <form action="Activity_time/checkwork" method="post" >
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
        <input type="hidden"  name="id" id="vyselect" value="${requestScope.number}"/>
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" onclick="checkall();" type="button">批量考勤</button>
       </div>
        </form>  
        
    <table class="tablelist" style="width:600px;margin-left: 100px;">
    	<thead>
    	<tr>
        <th><input  type="checkbox" style="vertical-align:middle;">全选</th>
        <th>活动</th>
        <th>用户</th>     
        <th>第一次</th>
        <th>第二次</th>     
        <th>第三次</th>
        <th>操作员</th>     
        <th>时间</th>
        <th>最终时间</th>
        <th>修改</th>
        </tr>
        </thead>
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td><input type="checkbox" class="chk" myid="${row.id}"></td>
        <td>${row.aname}</td>
        <td>${row.uname}</td>
        <td>${row.check1_Name}</td>
        <td>${row.check2_Name}</td>
        <td>${row.check3_Name}</td>
        <td>${row.oname}</td>
        <td>${row.date}</td>
        <td>${row.lastdate}</td>
        <td>
        <a href="javascript:edit(${row.id});" class="tablelink" >修改</a>
        </td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
<c:import url="../Model/list_footer.jsp" ></c:import>

