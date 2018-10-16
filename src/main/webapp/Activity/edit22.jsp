<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style type="text/css">
body {
	font: 18px "宋体";
	text-align: center;
}

.viewlist input{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist select{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist label{
	height: 30px;
}

a:link {
	color: #00F;
	text-decoration: none;
}

a:visited {
	color: #00F;
	text-decoration: none;
}

a:hover {
	color: #c00;
	text-decoration: underline;
}

ul {
	list-style: none;
}

.main {
	clear: both;
	padding: 8px;
	text-align: center;
}



.menu0 {
	width: 600px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 150px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
}

.menu0 li.hover {
	background: #54f2e4;
}
.viewlist input{
	height: 30px;
}
.viewlist select{
	height: 30px;
}
.viewlist label{
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}
</style>

<script>
	function setTab(m, n) {

		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");

		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");

		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";

		}

	}
	
	function change(){
	  var id=$("#myselect").val(); 
		$.getJSON("Activity_user/getcollege",{id:id},function(json){
			$(".xueyuan").empty();
			if(json.length>0){
				for(var i=0;i<json.length;i++){
					$(".xueyuan").append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
			}
		});
	}
	
</script>
</head>
<script type="text/javascript">
$(function(){
	change();
})
	function edit() {
		if (name1.value == "") {
			MsgDialog("必须录入名称！", "录入错误");
			return;
		}
		event.srcElement.disabled=true;
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Activity/personinsert",
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
<body style="min-width:200px;">
		<form class="f1">
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">个人信息</li>
					<li onclick="setTab(0,1)">联系方式</li>
					<li onclick="setTab(0,2)">意向信息</li>
					<li onclick="setTab(0,3)">其他信息</li>
				</ul>
				
				<div class="main" id="main0">
				            <c:if test="${requestScope.info==null}">
							<input type="hidden" name="insert" /> 
							</c:if>
							<c:if test="${requestScope.info!=null}">
								<input type="hidden" name="update" /> 
								<input type="hidden" name="id" value="${requestScope.info.id}"> 
							</c:if>
					<ul class="block">
						<li>
						<div class="inputview1">
						<span class="inputspan"> 
								<label class="inputtext" >用户名: </label>
								<input class="inputinput" type="text" id="name1" name="niki" value="${requestScope.info.niki}" style=" width:400px;"> 
								<input type="hidden" name="pass" value=${123}>
								</span>
							
							   <span class="inputspan"> 
								<label class="inputtext">学校:</label> 
								<select onchange="change();" class="inputselect" id="myselect" name="school_id" style="width: 150px;">
							   <c:forEach items="${requestScope.slist}" var="row" varStatus="v">
							   <c:if test="${requestScope.info.school_id==v.index+1}">
                                <option selected="selected" value="${v.index+1}" >${row.name}</option>
                                </c:if>
                                <c:if test="${requestScope.info.school_id!=v.index+1}">
                                <option  value="${v.index+1}" >${row.name}</option>
                                </c:if>
                             </c:forEach>
							</select>
								<label class="inputtext" >学院:</label> 
								<select class="inputselect xueyuan" name="college_id" style="width: 150px;">
							</select>
							</span>
								<span class="inputspan"> 
							    <label class="inputtext" >状态:</label> 
								<select  class="inputselect" name="status" style="width: 150px;">
							    <c:forEach var="r" items="${requestScope.statuss}" varStatus="v">
								<c:if test="${requestScope.info.status==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.status!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							    </c:forEach>
							    </select> 
								<label class="inputtext" >性别:</label> 
								<select class="inputselect" name="sex" style="width: 150px;">
							    <c:forEach var="r" items="${requestScope.sexs}" varStatus="v">
								<c:if test="${requestScope.info.sex==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.sex!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
							   </c:forEach>
								</select> 
								</span>
							<label class="inputtext" >专业: </label>
								<input class="inputinput" type="text"  name="classinfo" value="${requestScope.info.classinfo}" style=" width:400px;"> 
								
							    </div>
					</li>
					</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan"> 
						         <label class="inputtext" >姓名:</label> 
								<input class="inputinput" type="text"  name="name" value="${requestScope.info.niki}" style=" width:180px;">
								</span>
							    <span class="inputspan"> 
								<label class="inputtext" >电话:</label> 
								<input class="inputinput" type="text" name="tel" value="${requestScope.info.tel}" style="width: 180px;">
								</span><span class="inputspan"> 
								<label class="inputtext" >qq:</label> 
								<input class="inputinput" type="text" name="qq" value="${requestScope.info.qq}" style="width: 180px;"> 	
							</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
						<span class="inputspan"> 
							<label class="inputtext" >未来意向:</label> 
								<select class="inputselect" name="ylevel" style="width: 150px;">
							    <c:forEach var="r" items="${requestScope.ylevels}" varStatus="v">
								<c:if test="${requestScope.info.ylevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.ylevel!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
						    	</c:forEach>
							    </select> 
								</span>
						<span class="inputspan"> 
							<label class="inputtext" >关注程度:</label> 
								<select class="inputselect" name="glevel" style="width: 150px;">
							    <c:forEach var="r" items="${requestScope.glevels}" varStatus="v">
								<c:if test="${requestScope.info.glevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.glevel!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
						    	</c:forEach>
							    </select> 
								</span>
						        <span class="inputspan"> 
							    <label class="inputtext" >联系情况:</label> 
								<select class="inputselect" name="slevel" style="width: 150px;">
							    <c:forEach var="r" items="${requestScope.slevels}" varStatus="v">
								<c:if test="${requestScope.info.slevel==v.index}">
								<option selected="selected" value="${v.index}">${r}</option>
								</c:if>
								<c:if test="${requestScope.info.slevel!=v.index}">
								<option value="${v.index}">${r}</option>
								</c:if>
						    	</c:forEach>
							    </select> 
								</span>
								<span>
								<label class="inputtext" >相关信息: </label>
								<textarea  class="inputinput"  name="info"  style=" width:150px;">${requestScope.info.info}</textarea>
								</span>
						</div>
					</li>
				</ul>
				<ul>
					<li><div class="inputview1">
							</span>
							<span class="inputspan"> 
							<label class="inputtext" >备注: </label> 
							<textarea class="inputinput"  name="comments" style="width:400px;">${requestScope.info.comments}</textarea>	
						</span></div>
					</li>
				</ul>
			</div>
		<div class="inputbtpanel" style="margin-top: -10px">
				<button class="seachbt1"  onclick="layer_close();">取消</button>
				<button class="seachbt1" type="button" onclick="edit();">保存</button>
		</div>
	</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
