<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<style>
<!--
.viewlist	textarea {
    vertical-align: top;
    resize: none;
}
.viewlist {
    margin-top: 5px;
    margin-bottom: 5px;
    padding-left: 40px;
}
-->
</style>
<body style="overflow:hidden;overflow-y:auto;">
<script type="text/javascript">
function edit(){
var data = $("#f1").serializeArray();
$.ajax({
	url : "Activity_time/resultupdate",
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
  <form id ="f1">
  <input type="hidden" name="id" value="${requestScope.info.id}">
  <div class="viewlist">
  <label class="inputtext ">回应: </label> <br>
  <textarea class="input" name="result" style="position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.result}</textarea>
 </div>
 <span style="margin-left: 150px;"> 
						     <button class="seachbt1"  onclick="layer_close();">取消</button>
				            <button class="seachbt1" type="button" onclick="edit();">保存</button>
							   </span>
</form>
<c:import url="../Model/list_footer.jsp" ></c:import>

