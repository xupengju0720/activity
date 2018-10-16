<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
<style type="text/css">
.tablelists{
overflow: hidden;
width: 600px;
margin-left:100px;
}
.checkss{
overflow: hidden;
}
.checkssperson{
float:left;
margin-top:10px;
margin-bottom:10px;
margin-left:250px;
height:15px;
width:75px;
border: 1px black solid;
padding-top: 3px;
background-color:#A0E7FF;
}
</style>
</head>
<body style="min-width:100px;">
	<script>
		function add() {
			var ids=[];
			$(".chk").each(function(){
				if($(this).prop("checked"))
				{
				var id=$(this).val();
				ids.push(id);
				};
			});
			event.srcElement.disabled=true;
			var oo = ids.join(',');
			var data=$.param({'options':oo})+'&'+$(".f1").serialize();
			$.ajax({
				url : "Activity/index",
				type : "post",
				data : data,
				dataType : "json",
				success : function(json) {
				event.srcElement.disabled=false;
					if (json.status > 0) {
						parent.location.reload();
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
						parent.layer.close(index);  
					}
				}
			});
		}
		
		
		function edit() {
			var ids=[];
			$(".chk").each(function(){
				if($(this).prop("checked"))
				{
				var id=$(this).val();
				ids.push(id);
				};
			});
			event.srcElement.disabled=true;
			var oo = ids.join(',');
			var data=$.param({'options':oo})+'&'+$(".f2").serialize();
			$.ajax({
				url : "Activity/index",
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

		function pageParam(obj) {

		}
		
		function idsadd(){
			 var idd=[];
				$(".chk").each(function(){
					if($(this).prop("checked"))
					{
					var id=$(this).attr("myid");
					idd.push(id);
					};
				});
			$(".idsappend").val(idd);	
		}
		$(function(){
			$(".chk").on("click",function(){
				idsadd();
			});
			$(".chks").on("click",function(){
				idsadd();
			});
		})
		
	</script>

	<c:if test="${requestScope.info==null}">

		<form class="f1">
			<div class="inputview">
				<span class="inputspan">
			        <input type="hidden" name="insert" />
			        	<label class="inputtext ">名称:</label> 
						 <input class="inputinput" required="required"	 name="name"/>
			        	<label class="inputtext ">学校:</label> 
						 <input class="inputinput" required="required"	 name="school_id"/>
			        	<label class="inputtext ">学院:</label> 
						 <input class="inputinput" required="required"	 name="college_id"/>
						</span>
						<span class="inputspan">
			        	<label class="inputtext ">参加人数:</label> 
						 <input class="inputinput" required="required"	 name="count"/>
			        	<label class="inputtext ">班级个数</label> 
						 <input class="inputinput" required="required"	 name="classcount"/>
			        	<label class="inputtext ">辅导员</label> 
						 <input class="inputinput" required="required"	 name="instructor_user_id"/>
						</span>
						<span class="inputspan">
			        	<label class="inputtext ">课程信息:</label> 
						 <input class="inputinput" required="required"	 name="courseinfo"/>
			        	<label class="inputtext ">计划安排</label> 
						 <input class="inputinput" required="required"	 name="planinfo"/>
						 <label class="inputtext">负责人:</label> 
						 <input class="inputinput" required="required"	 name="charge_operator_id"/>
						</span>
						 <span class="inputspan">
			             <label class="inputtext ">时间信息</label> 
			        	 <input type="text" class="inputinput" name="date">
						<label class="inputtext ">类型:</label> 
						<select name="type" class="inputselect">
						<c:forEach items="${requestScope.types}" var="r" varStatus="v">
							<option value="${v.index}">${r}</option>
						</c:forEach>
						</select>
						
						<label class="inputtext">状态:</label> 
						<select name="status" class="inputselect">
						<c:forEach items="${requestScope.statuss}" var="r" varStatus="v">
							<option value="${v.index}">${r}</option>
						</c:forEach>
						</select>
						</span>
						<span class="inputspan">
						<label class="inputtext ">来源人:</label> 
						 <input class="inputinput" required="required"	 name="source_operator_id"/>
			        	<label class="inputtext ">注意事项:</label> 
						 <input class="inputinput" required="required"	 name="attention"/>
						</span>
						
						<span class="inputspan">
						<label class="inputtext">活动选项:</label>
						 <c:forEach items="${requestScope.optionss}" var="r" varStatus="v">
						 <label style="margin-left: 20px;vertical-align:middle;">${r}</label>
						 <input type="checkbox" class="chk" style="vertical-align:middle;" value="${v.index}"/>
						 </c:forEach>
						</span>
							<span class="inputspan">
							<label class="inputtext ">备注:</label> 
							<textarea class="inputinput"  name="comments" style="width:618px;"></textarea>	
				         </span>
			</div>
				<%-- <ul>
					<li>
				    <span class="inputspan"> 
					<label class="inputtext">活动人员:</label> 
					<input class="inputinput idsappend" type="text" required="required" name="ids" value="${requestScope.info.ids}" style=" width:250px;"> 
				    </span>
				    
				   </li>
					<li>
					      <div  class="tablelists">
					      <label class="inputtext">所有学生</label> 
					      <table class="tablelist">
                           <thead>
                           <tr>
                            <th width="30%"><span style="vertical-align:middle;">全选</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" class="chks" style="vertical-align:middle;"></th>                           
                            <th width="30%">id</th>                           
                            <th width="30%">名字</th>                           
                           </tr>
                           </thead>					      
					      <tbody>
					       <c:forEach items="${requestScope.ulist}" var="r" >
					      <tr>
					      <td width="30%"><input type="checkbox" class="chk" myid="${r.id}"></td>
					      <td width="30%">${r.id}</td>
					      <td width="30%">${r.name}</td>
					      </tr>
					      </c:forEach> 
					      </tbody>
					      </table>
						   </div>
						</li>   
						<li>   
						      
					  </li>
				</ul> --%>
				<div class="inputbtpanel">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();"
						>保存</button>
				</div>
		</form>
	</c:if>
	<c:if test="${requestScope.info!=null}">

		
		<form class="f2">
			<div class="inputview">
				<span class="inputspan">
			        <input type="hidden" name="update" />
			            <input type="hidden" name="id" value="${requestScope.info.id}">
			        	<label class="inputtext ">名称:</label> 
						 <input class="inputinput" required="required"	 name="name" value="${requestScope.info.name}"/>
			        	<label class="inputtext ">学校:</label> 
						 <input class="inputinput" required="required"	 name="school_id" value="${requestScope.info.school_id}"/>
			        	<label class="inputtext ">学院:</label> 
						 <input class="inputinput" required="required"	 name="college_id" value="${requestScope.info.college_id}"/>
						</span>
						<span class="inputspan">
			        	<label class="inputtext ">参加人数:</label> 
						 <input class="inputinput" required="required"	 name="count" value="${requestScope.info.count}"/>
			        	<label class="inputtext ">班级个数</label> 
						 <input class="inputinput" required="required"	 name="classcount" value="${requestScope.info.classcount}"/>
			        	<label class="inputtext ">辅导员</label> 
						 <input class="inputinput" required="required"	 name="instructor_user_id" value="${requestScope.info.instructor_user_id}"/>
						</span>
						<span class="inputspan">
			        	<label class="inputtext ">课程信息:</label> 
						 <input class="inputinput" required="required"	 name="courseinfo" value="${requestScope.info.courseinfo}"/>
			        	<label class="inputtext ">计划安排</label> 
						 <input class="inputinput" required="required"	 name="planinfo" value="${requestScope.info.planinfo}"/>
						 <label class="inputtext">负责人:</label> 
						 <input class="inputinput" required="required"	 name="charge_operator_id" value="${requestScope.info.charge_operator_id}"/>
						</span>
						
						 <span class="inputspan">
			             <label class="inputtext ">时间信息</label> 
			        	 <input class="inputinput"  type="text" name="date" value="${requestScope.info.date}"/>
						
						<label class="inputtext ">类型:</label> 
						<select name="type" class="inputselect">
						<c:forEach items="${requestScope.types}" var="r" varStatus="v">
							<c:if test="${requestScope.info.type==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.type!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
						</c:forEach>
						</select>
						
						<label class="inputtext">状态:</label> 
						<select name="status" class="inputselect">
						<c:forEach items="${requestScope.statuss}" var="r" varStatus="v">
						  <c:if test="${requestScope.info.status==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.status!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							
						</c:forEach>
						</select>
						
						</span>
						<span class="inputspan">
						<label class="inputtext ">来源人:</label> 
						 <input class="inputinput" required="required"	 name="source_operator_id" value="${requestScope.info.source_operator_id}"/>
			        	<label class="inputtext ">注意事项:</label> 
						 <input class="inputinput" required="required"	 name="attention" value="${requestScope.info.attention}"/>
						</span>
						<span class="inputspan">
						<label class="inputtext">活动选项:</label>
						 <c:forEach items="${requestScope.optionss}" var="r" varStatus="v">
						 <c:forEach items="${requestScope.info.options_Number}" var="qq">
						 <c:if test="${qq==v.index}">
						 <label style="margin-left: 20px">${r}</label>&nbsp;
						 <input type="checkbox" checked="checked"  class="chk" value="${v.index}"/>
						 </c:if>
						 </c:forEach>
						  <c:forEach items="${requestScope.info.options_Numbers}" var="pp">
						  <c:if test="${v.index==pp}">
						  <label style="margin-left: 20px">${r}</label>&nbsp;
						  <input type="checkbox" class="chk" value="${v.index}"/>
						  </c:if>
						  </c:forEach>
						 </c:forEach>
						</span>
						<span class="inputspan">
			        	<label class="inputtext ">备注:</label> 
			        	<textarea class="inputinput"  required="required" name="comments" style="width:618px;">${requestScope.info.comments}</textarea>
						</span>
				   <div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();"
						>保存</button>
				</div>
			</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>