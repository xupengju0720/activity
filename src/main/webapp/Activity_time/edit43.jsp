<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
</head>
<body style="overflow:hidden;overflow-y:auto;width: 400px;">
    <script type="text/javascript">
    function edit() {
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Activity_time/updateall",
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

		<form class="f1" style="margin-top: 50px;width: 500px;">
			<div class="inputview">
                <input type="hidden" name="ids" value="${requestScope.ids}"/>
			    <span class="inputspan">
				<label class="inputtext ">第一次</label> 
					<select name="check1" class="inputselect" style="width: 200px;margin-left: 50px">
					<c:forEach items="${requestScope.checks}" var="r" varStatus="v">
					<option  value="${v.index}">${r}</option>
					</c:forEach>
					</select>
				</span>
			    <span class="inputspan">
				<label class="inputtext ">第二次</label> 
					<select name="check2" class="inputselect" style="width: 200px;margin-left: 50px">
					<c:forEach items="${requestScope.checks}" var="r" varStatus="v">
					<option  value="${v.index}">${r}</option>
					</c:forEach>
					</select>
				</span>
			    <span class="inputspan">
				<label class="inputtext ">第三次</label> 
					<select name="check3" class="inputselect" style="width: 200px;margin-left: 50px">
					<c:forEach items="${requestScope.checks}" var="r" varStatus="v">
					<option  value="${v.index}">${r}</option>
					</c:forEach>
					</select>
				</span>
				<span class="inputspan">
				<label class="inputtext ">备注:</label> 
				<textarea class="inputinput"  required="required" name="comments" style="width:200px;margin-left: 50px"></textarea>
				</span>
				
				<div class="inputbtpanel" style="width: 400px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();"
						>保存</button>
				</div>
			</div>
		</form>
	
  
<c:import url="../Model/list_footer.jsp" ></c:import>

