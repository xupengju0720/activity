<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head_index.jsp" ></c:import>
<!DOCTYPE html>
<body style="overflow:hidden;overflow-y:auto;">
	<script>
	function edit(){
		var data=$("#update").serialize();
		$.post("password",data,function(json){
			if(json.status==1){
				parent.location.reload()
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.location.href="login.jsp";  
				parent.layer.close(index);  
				
			}
			if(json.status==2){
			alert("两次输入的密码不一致！");
			}
			if(json.status==3){
			alert("修改失败！");
			}
		},"json")
	}
	</script>
	<form id="update">
	<br>
	&nbsp;&nbsp;<label class="inputtext ">原密码:</label> 
	&nbsp;&nbsp;<input type="password" class="inputinput" id="password" name="password" /><br>
	&nbsp;&nbsp;<label class="inputtext ">新密码:</label> 
	&nbsp;&nbsp;<input  type="password" class="inputinput" id="password1" name="password1" /><br>
	&nbsp;&nbsp;<label class="inputtext ">系密码:</label> 
	&nbsp;&nbsp;<input  type="password" class="inputinput" id="password2" name="password2" /><br><br>
	 <span> 
						 &nbsp;&nbsp;&nbsp;<button class="seachbt1"  onclick="layer_close();">取消</button>
				        &nbsp;&nbsp;<button class="seachbt1" type="button" onclick="edit();">保存</button>
							   </span>
	</form>
  <c:import url="/Model/form_footer.jsp" ></c:import>