<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style>
</style>
</head>
<script type="text/javascript">
function edit() {
	var data = $(".f1").serializeArray();
	$.ajax({
		url : "Activity_usergroup/updatecount",
		type : "post",
		data : data,
		dataType : "json",
		success : function(json) {
		event.srcElement.disabled=false;
			if (json.status > 0) {
				parent.location.reload()
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index);  
			}
		}
	});
}
</script>
<body style="overflow:hidden;overflow-y:auto;">
   <label class="searchtext" style="margin-left: 40px;"><b>所选小组：</b>${requestScope.group_name }</label> 
	<form class="f1" style="width: 500px;margin-left: 40px;height:200px;"> 
	                            <c:if test="${requestScope.info==null}">
	                             <input type="hidden" name="id" value="${requestScope.group_id}" >
	                             </c:if>
	                             <c:if test="${requestScope.info!=null}">
	                             <input type="hidden" name="id" value="${requestScope.info.id}" >
	                             </c:if>
	                             <span class="inputspan"> 
							    <label class="inputtext" >分数1：</label> 
							    <input class="inputinput" type="text"  name="point1" value="${requestScope.info.point1}" style=" width:150px;"> 
							    <label class="inputtext" >分数2：</label> 
							    <input class="inputinput" type="text"  name="point2" value="${requestScope.info.point2}" style=" width:150px;"> 
							    <label class="inputtext" >分数3：</label> 
							    <input class="inputinput" type="text"  name="point3" value="${requestScope.info.point3}" style=" width:150px;"> 
							    <label class="inputtext" >分数4：</label> 
							    <input class="inputinput" type="text"  name="point4" value="${requestScope.info.point4}" style=" width:150px;"> 
							    <label class="inputtext" >分数5：</label> 
							    <input class="inputinput" type="text"  name="point5" value="${requestScope.info.point5}" style=" width:150px;"> 
							    <label class="inputtext" >分数6：</label> 
							    <input class="inputinput" type="text"  name="point6" value="${requestScope.info.point6}" style=" width:150px;"> 
							    <label class="inputtext" >分数7：</label> 
							    <input class="inputinput" type="text"  name="point7" value="${requestScope.info.point7}" style=" width:150px;"> 
							    <label class="inputtext" >分数8：</label> 
							    <input class="inputinput" type="text"  name="point8" value="${requestScope.info.point8}" style=" width:150px;"> 
							    <label class="inputtext" >分数9：</label> 
							    <input class="inputinput" type="text"  name="point9" value="${requestScope.info.point9}" style=" width:150px;"> 
							    <label class="inputtext" >分数10：</label> 
							    <input class="inputinput" type="text"  name="point10" value="${requestScope.info.point10}" style=" width:150px;"> 
						     	</span>
				</form>
              <button class="seachbt1"  onclick="layer_close();" style="margin-left: 180px;">取消</button>
              <button class="seachbt1" type="button" onclick="edit();">保存</button>
  <c:import url="/Model/form_footer.jsp" ></c:import>
