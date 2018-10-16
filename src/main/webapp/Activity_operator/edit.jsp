<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
</head>
<body style="min-width:100px;width: 600px;overflow:hidden;overflow-y:auto;">
	<script>
		function add() {
			if (name1.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;
			}
			event.srcElement.disabled=true;
			var data = $(".f1").serializeArray();
			$.ajax({
				url : "Activity_operator/index",
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
		
		
		function edit() {
			if (name2.value == "") {
				MsgDialog("必须录入名称！", "录入错误");
				return;r
			}
			event.srcElement.disabled=true;
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "Activity_operator/index",
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

		<form class="f1">
			<div class="inputview">
				<span class="inputspan">
				 <input type="hidden" name="insert"/>
				 <input type="hidden" name="pass" value="123">
				 <label class="inputtext " >用户名:</label>
				 <input class="inputinput" id="name1" name="niki"/>
				 <label class="inputtext ">姓名:</label>
				 <input class="inputinput"  name="name"/>
				 <label class="inputtext ">电话:</label>
				 <input class="inputinput"  name="tel"/>
				 <label class="inputtext ">备注:</label>
				 <input class="inputinput"  name="comments"/>
				         <label class="inputtext ">状态:</label>
				 	    <select class="inputselect" name="status"  >
				 	    	<c:forEach items="${requestScope.statuss}"  var="row" varStatus="v">
			                     <option  value="${v.index}">${row}</option>
			                      </c:forEach>
							</select>
							 <label class="inputtext ">权限:</label>
								<select class="inputselect" name="power"  >
							<c:forEach items="${requestScope.powers}" var="row" varStatus="v">
                                <option  value="${v.index}">${row}</option>
                             </c:forEach>
							</select>
							 <label class="inputtext ">类型:</label>
								<select class="inputselect" name="type"  >
							<c:forEach items="${requestScope.types}" var="row" varStatus="v">
                                <option  value="${v.index}">${row}</option>
                             </c:forEach>
							</select>
				</span>
				<div class="inputbtpanel"  style="margin-top: 70px;margin-left: 75px">
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
				 <input type="hidden" name="id" value="${requestScope.info.id}" /> 
				 <label class="inputtext" id="name2" >用户名:</label>
				 <input class="inputinput"  name="niki" value="${requestScope.info.niki}"/>
				
				 <label class="inputtext ">姓名:</label>
				 <input class="inputinput" name="name" value="${requestScope.info.name}"/>
				
				 <label class="inputtext ">电话:</label>
				 <input class="inputinput"  name="tel" value="${requestScope.info.tel}"/>
				 
				 <label class="inputtext ">备注:</label>
				 <input class="inputinput"  name="comments" value="${requestScope.info.comments}"/>
				  <label class="inputtext ">状态:</label>
				 	    <select class="inputselect" name="status"  >
				 	    	<c:forEach items="${requestScope.statuss}"  var="row" varStatus="v">
			                     <c:if test="${requestScope.info.status!=v.index}">
			                        <option  value="${v.index}">${row}</option>
		                            	</c:if>
		                               	<c:if test="${requestScope.info.status==v.index}">
		                               	<option  selected="selected" value="${v.index}">${row}</option>
			                           </c:if>
			                      </c:forEach>
							</select>
							 <label class="inputtext ">权限:</label>
								<select class="inputselect" name="power"  >
							<c:forEach items="${requestScope.powers}" var="row" varStatus="v">
                                 <c:if test="${requestScope.info.power!=v.index}">
			                        <option  value="${v.index}">${row}</option>
		                            	</c:if>
		                               	<c:if test="${requestScope.info.power==v.index}">
		                               	<option  selected="selected" value="${v.index}">${row}</option>
			                           </c:if>
                             </c:forEach>
							</select>
							 <label class="inputtext ">类型:</label>
								<select class="inputselect" name="type"  >
							<c:forEach items="${requestScope.types}" var="row" varStatus="v">
                                 <c:if test="${requestScope.info.type!=v.index}">
			                        <option  value="${v.index}">${row}</option>
		                            	</c:if>
		                               	<c:if test="${requestScope.info.type==v.index}">
		                               	<option  selected="selected" value="${v.index}">${row}</option>
			                           </c:if>
                                
                             </c:forEach>
							</select>
				</span>
				<div class="inputbtpanel" style="margin-top: 70px;margin-left: 75px">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>