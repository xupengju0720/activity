<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style>
<!--
.selectperson{
position:absolute;
background-color:#FFF5D9;
width: 400px;
margin-right: 50px;
margin-left: 500px;
margin-top: -30px;
}
-->
</style>
</head>
<script type="text/javascript">
	function edit() {
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Activity_usergroup/index",
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
	function pageParam(obj) {
    
	}
	function personadd(){
		$(".selectperson").css("display","block");
	}
	function personinsert(){
		var idp = [];
		$(".chk").each(function(){
			if($(this).prop("checked"))
			{
			var id=$(this).attr("myid");
			idp.push(id);			
		    }
		});
		var ids = idp.join(',');
		$(".renyuan").val(ids);
		$(".selectperson").css("display","none");
	}
</script>
<body>
        <div class="selectperson" style="display: none;">
              <c:if test="${requestScope.info==null}">
              <table  class="tablelist" style="width: 300px;margin-left: 50px;margin-top: 20px;">
              <thead>
              <tr>
              <th>全选 <input type="checkbox"></th>
              <th>id</th>
              <th>名字</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${requestScope.ulist}" var="r">
              <tr>
              <td> <input type="checkbox" class="chk" myid="${r.id}"></td>
              <td>${r.id}</td>
              <td>${r.name}</td>
              </tr>
              </c:forEach>
              </tbody>
              </table>    
              </c:if> 
              <c:if test="${requestScope.info!=null}">
              <table  class="tablelist" style="width: 300px;margin-left: 50px;margin-top: 20px;">
              <thead>
              <tr>
              <th>全选 <input type="checkbox"></th>
              <th>id</th>
              <th>名字</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${requestScope.bulist}" var="r">
              <tr>
              <td> <input type="checkbox" checked="checked" class="chk" myid="${r.id}"></td>
              <td>${r.id}</td>
              <td>${r.name}</td>
              </tr>
              </c:forEach>
               <c:forEach items="${requestScope.ulist}" var="r">
              <tr>
              <td> <input type="checkbox" class="chk" myid="${r.id}"></td>
              <td>${r.id}</td>
              <td>${r.name}</td>
              </tr>
              </c:forEach>
              </tbody>
              </table>    
              </c:if> 
           <button class="seachbt1" type="button" onclick="personinsert();" style="margin-left: 140px;">确定</button>
           </div>
		<form class="f1" style="margin-top: 50px;">
				            <c:if test="${requestScope.info==null}">
							<input type="hidden" name="insert" /> 
							<input class="inputinput" type="hidden"  name="activity_id" value="${requestScope.activity_id}" > 
							</c:if>
							<c:if test="${requestScope.info!=null}">
								<input type="hidden" name="update" /> 
								<input type="hidden" name="id" value="${requestScope.info.id}"> 
						 	</c:if>
						    <div class="inputview1">
						      <span class="inputspan"> 
							    <label class="inputtext" >小组名称:</label> 
							    <input class="inputinput" type="text"  name="name" value="${requestScope.info.name}" style=" width:800px;"> 
						     	</span>
						     	 <span class="inputspan">
						      <label class="inputtext">人员</label> 
						      <input class="inputinput renyuan" type="text"  name="ids" value="${requestScope.info.ids}" style=" width:340px;">
						      <a href="javascript:personadd();" class="tablelink" >添加</a>
						      <label class="inputtext">上传路径:</label> 
							  <input class="inputinput" type="text"  name="path" value="${requestScope.info.path}" style=" width:335px;">
						     </span>
								<span class="inputspan"> 
								<label class="inputtext">项目:</label> 
								<textarea class="inputinput"  name="project" style="width:800px;">${requestScope.info.project}</textarea>	
							  <br><label class="inputtext">备注:</label> 
							    <textarea class="inputinput"  name="comments" style="width:800px;">${requestScope.info.comments}</textarea>	
						     </span>
						    
						    <br> <span style="margin-left: 350px;"> 
						     <button class="seachbt1"  onclick="layer_close();">取消</button>
				            <button class="seachbt1" type="button" onclick="edit();">保存</button>
							   </span>
							    </div>
	</form>
  <c:import url="/Model/form_footer.jsp" ></c:import>
