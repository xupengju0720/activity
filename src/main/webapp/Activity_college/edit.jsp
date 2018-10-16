<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
</head>
<body style="min-width:100px;">
	<script>
		function add() {
			if (name1.value == "") {
				MsgDialog("必须录入学院！", "录入错误");
				return;
			}
			event.srcElement.disabled=true;
			var data = $(".f1").serializeArray();
			$.ajax({
				url : "Activity_college/index",
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
				MsgDialog("必须录入学院！", "录入错误");
				return;
			}
			event.srcElement.disabled=true;
			var data = $(".f2").serializeArray();
			$.ajax({
				url : "Activity_college/index",
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
						<input type="hidden" name="insert" />
				    <label class="inputtext ">学校：
						</label> 
						<select class="inputselect" name="school_id"  >
							<c:forEach items="${requestScope.sublist}" var="row">
                                <option  value="${row.id}">${row.name}</option>
                             </c:forEach>
							</select>
								<label class="inputtext ">学院:
							</label> 
							<input class="inputinput"
							id="name1" name="name"/>
						</span>
				<div class="inputbtpanel"  style="margin-top: 40px;">
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
							 <input type="hidden"
								name="id" value="${requestScope.info.id}" /> 
							    	<label class="inputtext ">学院:
							</label> 
								<input class="inputinput" id="name2" name="name"
								value="${requestScope.info.name}"
								 />
							</span>
				<div class="inputbtpanel"  style="margin-top: 40px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
				</div>
		</form>
	</c:if>
  <c:import url="/Model/form_footer.jsp" ></c:import>