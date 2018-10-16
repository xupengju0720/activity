<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
<script src="/practicaltraining/laydate/laydate.js"></script>
</head>
<body style="overflow:hidden;overflow-y:auto;">


<script type="text/javascript">
function view(id,actid){
	layer_show("反馈","Activity_time/view?id="+id,600,400);
}
function result(id){
	layer_show("回应","Activity_time/result?id="+id,600,200);
	}
function change(id,statu){
	if(statu==1){
    var	status=0;
	}
	if(statu==0){
   	var	status=1;
	}
	$.post("Activity_time/statusupdate",{id:id,status:status},function(json){
		if(json.status>0){
			location.reload();
		}
		
	},"json");
}


</script>
   <table class="tablelist" style="width: 800px;margin-left: 50px;margin-top: 20px;">
    	<thead>
    	<tr>
        <th>活动名称</th>
        <th>用户名</th>
        <th>状态</th>
        <th>查看</th>
        <th>回应</th>
        <th>切换</th>
        </tr>
        </thead>
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="row" >
    <tr>
        <td>${row.aname}</td>
        <td>${row.uname}</td>
        <td>${row.status_Name}</td>
        <td><a href="javascript:view(${row.id});" class="tablelink" >查看</a></td>
        <td><a href="javascript:result(${row.id});" class="tablelink" >回应</a></td>
        <td><a href="javascript:change(${row.id},${row.status});" class="tablelink" >切换</a></td>
        </tr>  
  </c:forEach>
        </tbody>
    </table>
    <div class="inputbtpanel" >
					<button class="seachbt1" type="button" style="margin-top: 20px;" onclick="layer_close();"
						>取消</button>
				</div>
    
    
    
  <c:import url="/Model/form_footer.jsp" ></c:import>