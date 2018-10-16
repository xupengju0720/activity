<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>

<body style="width: 400px;overflow:hidden;overflow-y:auto;">
<script type="text/javascript">
function countall() {
	var idp = [];
	$(".chk").each(function(){
			var id=$(this).attr("myid");
			idp.push(id);
	});
	var ids = idp.join(',');
	$("#piliangids").val(ids);
	var data = $("#f1").serializeArray();
	$.ajax({
		url : "Activity/countallupdate",
		type : "post",
		data : data,
		dataType : "json",
		success : function(json) {
			if (json.status > 0) {
				parent.location.reload()
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index);  
			}
		}
	});
}
function updateone() {
	var data = $("#f2").serializeArray();
	$.ajax({
		url : "Activity/countoneupdate",
		type : "post",
		data : data,
		dataType : "json",
		success : function(json) {
			if (json.status > 0) {
				parent.location.reload()
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index);  
			}
		}
	});
	
}

</script>
  <c:if test="${requestScope.list!=null}">
        <label class="searchtext" style="margin-left: 50px;"><b>所选学生：</b></label> 
        <table class="tablelist" style="width:200px;margin-left: 100px;">
    	<thead>
    	<tr>
        <th>学生</th>
        <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <input type="hidden" class="chk" myid="${row.id}">
        <tr>
        <td>${row.uname}</td>
        <td>${row.status_Name}</td>
    </tr>  
        </c:forEach>
        </tbody>
    </table>
    <form id="f1">
      <input class="inputinput" name="ids" type="hidden" value="" id="piliangids"/>
    <label class="inputtext ">分数:</label> 
    <input class="inputinput" required="required" name="point" style="width:200px;"/><br>
    <label class="inputtext ">评语:</label> 
    <textarea class="inputinput"  name="comments" style="width:200px;"></textarea>	
    <div class="inputbtpanel" style="width: 400px;margin-top: 20px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="countall();"
						>保存</button>
				</div>
              </form>
				</c:if>
		<c:if test="${requestScope.info!=null}">
		<form  id="f2" style="margin-left: 50px;margin-top:50px;width: 300px;">
		 <input type="hidden" name="id" value="${requestScope.info.id}">
		 <label class="inputtext ">姓名:</label> 
		 <label class="inputtext ">${requestScope.info.uname}</label> <br>
         <label class="inputtext ">分数:</label> 
          <input class="inputinput" required="required" name="point" style="width:200px;" value="${requestScope.info.point}"/><br>
         <label class="inputtext ">评语:</label> 
          <textarea class="inputinput"  name="comments" style="width:200px;">${requestScope.info.comments}</textarea>	
           <div class="inputbtpanel" style="width: 300px;margin-top: 20px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="updateone();"
						>保存</button>
				</div>
				</form>
        </c:if>	
				
				
				
<c:import url="../Model/list_footer.jsp" ></c:import>

