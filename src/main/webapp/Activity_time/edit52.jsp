<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/form_head.jsp" ></c:import>
<script src="/practicaltraining/laydate/laydate.js"></script>
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
.inputtext,.input{
margin-top: 20px;
}
.lablefirst{
margin-left:30px; 
}
.opt_student{
border: 1px solid black;
margin-left: 0px;
position: relative;
}
-->
</style>
</head>
<body style="overflow:hidden;overflow-y:auto;">
	<script>
		
		function edit() {
		    var date=[];
			$(".impl").each(function(){
				var id=$(this).find(".selectid").text();
				var name=$(this).find(".selectname").text();
				var info=$(this).find(".selectinfo").text();
				var row={id:id,name:name,info:info};
				date.push(row);
			})
		    var zdata=JSON.stringify(date);
			var data = $.param({'json':zdata})+'&'+$(".f1").serialize();
			$.ajax({
				url : "Activity_time/reportupdate",
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
		
		function addtd(){
			$(".personadd").css("display","block");
		}
		function personedit(){
			$(".tablenn>tbody").append($("<tr class='impl'><td class='selectid'>"+$(".perid").val()+"</td><td class='selectname'>"+$(".pername").val()+"</td><td class='selectinfo'>"+$(".perinfo").val()+"</td><td><a onclick='del(this);' class='tablelink' >移除</a></td></tr>"));
			 $(".perid").val("");  
			 $(".pername").val("");  
			 $(".perinfo").val("");  
			$(".personadd").css("display","none");
		}
		function del(o){
		 $(o).parent().parent().remove();
		}
	</script>

		<form class="f1">
				<div class="viewlist">
				<input type="hidden" name="id" value="${requestScope.info.id}">
				<input type="hidden" name="activity_id" value="${requestScope.info.activity_id}">
				<label class="inputtext ">教学进度:</label>
				<input class="inputinput" value="${requestScope.info.tprogress}"  name=tprogress style="width: 300px;margin-left: 65px;"/>
				<br>
				<label class="inputtext ">学生状况:</label>
				<input class="inputinput" value="${requestScope.info.sprogress}" name="sprogress" style="width: 300px;margin-left: 65px;"/>
				<br>
				<label class="inputtext ">市场状况:</label>
				<input class="inputinput" value="${requestScope.info.cprogress}" name="cprogress" style="width: 300px;margin-left: 65px;"/>
				<br>
				<label class="inputtext ">日总结:</label>
					<textarea class="input" name="comments" style=" position: relative; padding-left:0px; top:5px; left:65px; width:300px; height:50px;border: solid 1px #A673AB;">${requestScope.info.comments}</textarea>		
				</div>
			    <label class="inputtext" style="margin-left: 20px;">学生记录:</label>
			     </form>
	   <table class="tablelist tablenn"  style="width: 300px;margin-left: 200px;">
    	<thead>
    	<tr>
        <th>id</th>
        <th>名字</th>
        <th>信息</th>
        <th><a href="javascript:addtd();" class="tablelink" >新增</a></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.jsons}" var="row">
        <tr class="impl">
        <td class="selectid">${row.id}</td>
        <td class="selectname">${row.name}</td>
        <td class="selectinfo">${row.info}</td>
        <td><a onclick="del(this);" class="tablelink">移除</a></td>
        </tr>  
        </c:forEach>
	    </tbody>  
	    </table>  
               <div class="inputbtpanel" style="margin-top: 20px;width: 300px;margin-left: 150px;" >
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();">保存</button>
				</div>
		
		<div class="personadd" style="width: 400px;height: 300px;background-color: #EBEBEB;position: absolute;margin-top:-350px;margin-left: 100px;display: none;">
		 <form class="f2">
				<div class="viewlist">
				<label class="inputtext " style="margin-left: 20px;">id:</label>
				<input class="inputinput perid"  name="id" style="width: 160px"/>
				<br>
				<label class="inputtext " style="margin-left: 20px;">名字:</label>
				<input class="inputinput pername"  name="name" style="width: 160px"/>
				<br>
			    <label class="inputtext" style="margin-left: 20px;">详细信息:</label>
			    <textarea class="input perinfo" name="info" style=" position: relative;width:160px; height:80px;border: solid 1px #A673AB;"></textarea>		
				</div>
                <div class="inputbtpanel" style="margin-top: 20px;width: 400px" >
					<button class="seachbt1" type="button" onclick="personedit();">确定</button>
				</div>
		</form>
		</div>
  <c:import url="/Model/form_footer.jsp" ></c:import>