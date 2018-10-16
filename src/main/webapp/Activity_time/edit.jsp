<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
<script src="/practicaltraining/laydate/laydate.js"></script>
</head>
<body style="min-width:100px;line-height:20px">
<style>
<!--
.timepps{
  border: #A0E7FF solid 1px;
 }
  body{padding: 20px;}
  .demo-input{padding-left: 20px; height: 30px; min-width: 50px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
  .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
  .demo-footer a{padding: 0 5px; color: #01AAED;}
  -->
</style>
	<script>
		function add() {
			var data = $(".f1").serializeArray();
			$.ajax({
				url : "Activity_time/index",
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
		
		
		function edit() {
			event.srcElement.disabled=true;
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "Activity_time/index",
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
	</script>

	<c:if test="${requestScope.info==null}">
		<form class="f1" style="margin-top: 50px;">
			<div class="inputview">
				<input type="hidden" name="insert" />
                <input type="hidden" name="activity_id" value="${requestScope.activity_id}"/>
			    <span class="inputspan">
				<label class="inputtext ">地点</label> 
				<input class="inputinput"  name="roominfo" style="width: 167px"/>
					<label class="inputtext ">状态:</label> 
					<select name="status" class="inputselect" style="width: 168px">
					<c:forEach items="${requestScope.statuss}" var="r" varStatus="v">
					<option value="${v.index}">${r}</option>
					</c:forEach>
					</select>
				<label class="inputtext ">日期:</label> 
				<input type="text" class="demo-input timeppsdate" placeholder="请选择日期" name="date" >
				</span>
				
				 <span class="inputspan">
				<label class="inputtext">时间1:</label> 
				<input type="text" class="demo-input timepps" id="timepps1" placeholder="请选择时间" name="time1" >
				<label class="inputtext ">时间2:</label> 
			    <input type="text" class="demo-input timepps" id="timepps2" placeholder="请选择时间"  name="time2">
				<label class="inputtext">时间3:</label> 
				<input type="text" class="demo-input timepps" id="timepps3" placeholder="请选择时间"  name="time3">
				</span>
				<span class="inputspan">
				<label class="inputtext ">时间4:</label> 
			    <input type="text" class="demo-input timepps" id="timepps4" placeholder="请选择时间" name="time4">
				<label class="inputtext">时间5:</label> 
			    <input type="text" class="demo-input timepps" id="timepps5" placeholder="请选择时间" name="time5">
				<label class="inputtext ">时间6:</label> 
				<input type="text" class="demo-input timepps" id="timepps6" placeholder="请选择时间" name="time6">
				</span>
				<span class="inputspan">
				<label class="inputtext ">备注:</label> 
				<textarea class="inputinput"  required="required" name="comments" style="width:700px;"></textarea>
				</span>
				
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="add();"
						>保存</button>
				</div>
			</div>
		</form>
	</c:if>
	<c:if test="${requestScope.info!=null}">

		<form class="f2">
			<div class="inputview">
				<span class="inputspan">
				<input type="hidden" name="update" />
				<input type="hidden" name="id" value="${requestScope.info.id}">
				<input type="hidden" name="activity_id" value="${requestScope.info.activity_id}">
				<input type="hidden"  name="operator_id" value="${requestScope.info.operator_id}"/>
				</span>
			    <span class="inputspan">
				<label class="inputtext ">地点</label> 
				<input class="inputinput"  name="roominfo" value="${requestScope.info.roominfo}" style="width: 167px"/>
					<label class="inputtext ">状态:</label> 
					<select name="status" class="inputselect" style="width: 168px">
					<c:forEach items="${requestScope.statuss}" var="r" varStatus="v">
					<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
					</c:if>
					<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
					</c:if>
					</c:forEach>
					</select>
				<label class="inputtext ">日期:</label> 
				<input type="text" class="demo-input timeppsdate" placeholder="请选择日期" name="date" value="${requestScope.info.date}">
				</span>
				
				 <span class="inputspan">
				<label class="inputtext">时间1:</label> 
				<input type="text" class="demo-input timepps" id="timepps1" placeholder="请选择时间" name="time1"  value="${requestScope.info.time1}">
				<label class="inputtext ">时间2:</label> 
			    <input type="text" class="demo-input timepps" id="timepps2" placeholder="请选择时间"  name="time2" value="${requestScope.info.time2}">
				<label class="inputtext">时间3:</label> 
				<input type="text" class="demo-input timepps" id="timepps3" placeholder="请选择时间"  name="time3" value="${requestScope.info.time3}">
				</span>
				<span class="inputspan">
				<label class="inputtext ">时间4:</label> 
			    <input type="text" class="demo-input timepps" id="timepps4" placeholder="请选择时间" name="time4" value="${requestScope.info.time4}">
				<label class="inputtext">时间5:</label> 
			    <input type="text" class="demo-input timepps" id="timepps5" placeholder="请选择时间" name="time5" value="${requestScope.info.time5}">
				<label class="inputtext ">时间6:</label> 
				<input type="text" class="demo-input timepps" id="timepps6" placeholder="请选择时间" name="time6" value="${requestScope.info.time6}">
				</span>
				<span class="inputspan">
				<label class="inputtext ">备注:</label> 
				<textarea class="inputinput"  required="required" name="comments" style="width:700px;">${requestScope.info.comments}</textarea>
				</span>
							
							
				<div class="inputbtpanel" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
<script>
lay('#version').html('-v'+ laydate.v);
laydate.render({
  elem: '#timepps1' 
    ,type:'time'
});
laydate.render({
  elem: '#timepps2' 
    ,type:'time'
});
laydate.render({
  elem: '#timepps3' 
    ,type:'time'
});
laydate.render({
  elem: '#timepps4' 
    ,type:'time'
});
laydate.render({
  elem: '#timepps5' 
    ,type:'time'
});
laydate.render({
  elem: '#timepps6' 
    ,type:'time'
});
laydate.render({
  elem: '.timeppsdate' 
});
</script>
  <c:import url="/Model/form_footer.jsp" ></c:import>