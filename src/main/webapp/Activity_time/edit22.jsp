<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<style>
.opt_mark{
width: 50px;height: 20px;background-color: #3F3;color: #FFF;cursor: pointer;text-align: center;
border: solid #eee 1px;
}
.opt_mark_selected{
background-color: #F33;
}
.seach .input {
    height: 30px;
    margin-right: 15px;
    padding-left: 5px;
    padding-right: 5px;
    line-height: 30px;
    display: inline-block;
    width: 150px;
    border: #bbb solid 1px;
}
.viewlist {
    margin-top: 5px;
    margin-bottom: 5px;
    padding-left: 40px;
}
.seach .title {
    margin-right: 5px;
    padding-right: 5px;
    line-height: 30px;
    width: 100px;
    text-align: right;
    display: inline-block;
}
.view .title {
    margin-right: 5px;
    padding-right: 5px;
    line-height: 30px;
    width: 100px;
    text-align: right;
    display: inline-block;
}
.title {
    cursor: pointer;
}
.input {
    margin-bottom: 10px;
    padding-left: 3px;
}
.viewlist	textarea {
    vertical-align: top;
    resize: none;
}

</style>
<body style="overflow:hidden;overflow-y:auto;">
<script type="text/javascript">
var mark=0;
if(mark==0){
	$(document).on("click",".opt_mark",function(e){
	var o=$(e.target);
		o.addClass("opt_mark_selected");
		o.siblings().removeClass("opt_mark_selected");
	});
	
	}
	function edit(){
		var idp=[];
		$(".opt_mark_selected").each(function(){
			var id=$(this).attr("myid");
	        idp.push(id);
		})
			var ids = idp.join(',');
			$("#opt1").val(ids);
			$("#optionpinjie").val(ids);
			var data = $("#f1").serializeArray();
			$.ajax({
				url : "Activity_time/opupdatefeedbook",
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
<c:if test="${requestScope.info!=null}">
	<div class="viewlist">
	<input type="hidden" id="optionpinjie" name="optk" value="">
	<input type = "hidden" name = "id" value="${requestScope.info.id}">
	<input type = "hidden" name = "status" value="${requestScope.info.status}">
	<input type = "hidden" name = "user_id" value="${requestScope.info.user_id}">
	<input type = "hidden" name = "activity_id" value="${requestScope.info.activity_id}">
	<b>第1项</b>
		<div style="margin-left: 60px;">
		<b>在本次活动中，你的学习状态如何？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A比较好     B一般     C较差
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt1!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt1==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>状态不好的原因：</b> </label>
	    <br>
		<textarea class="input" name="text1" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text1}</textarea>
</div>

<div class="viewlist">
	<b>第2项</b>
		<div style="margin-left: 60px;">
		<b>在本次活动中，你认为自己哪些环节比较薄弱？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A知识理解    B自己动手     C其他
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt2!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt2==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>这样认为的原因：</b> </label>
	    <br>
		<textarea class="input" name="text2" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text2}</textarea>
</div>

<div class="viewlist">
	<b>第3项</b>
		<div style="margin-left: 60px;">
		<b>在本次活动中，是否能更上讲师的进度？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A完全跟得上    B跟得上     C跟不上
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt3!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt3==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>跟不上的原因：</b> </label>
	    <br>
		<textarea class="input" name="text3" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text3}</textarea>
</div>


<div class="viewlist">
	<b>第4项</b>
		<div style="margin-left: 60px;">
		<b>自我感觉本次活动的课堂气氛如何</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A比较活跃     B一般     C较差
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt4!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt4==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>你认为的原因：</b> </label>
	    <br>
		<textarea class="input" name="text4" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text4}</textarea>
</div>



<div class="viewlist">
	<b>第5项</b>
		<div style="margin-left: 60px;">
		<b>在本次活动中，未完成哪个作业？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A作业1    B作业2    C都完成
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt5!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt5==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>未完成的原因：</b> </label>
	    <br>
		<textarea class="input" name="text5" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text5}</textarea>
</div>
<div class="viewlist">
	<b>第6项</b>
		<div style="margin-left: 60px;">
		<b>在本次活动中，你认为同学们的学习气氛如何？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A积极     B一般     C较差
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt6!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt6==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>你认为的原因：</b> </label>
	    <br>
		<textarea class="input" name="text6" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text6}</textarea>
</div>
<div class="viewlist">
	<b>第7项</b>
		<div style="margin-left: 60px;">
		<b>通过本次活动，你认为自己的进步程度如何？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A较大    B一般     C较差
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt7!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt7==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>较差的原因：</b> </label>
	    <br>
		<textarea class="input" name="text7" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text7}</textarea>
</div>
<div class="viewlist">
	<b>第8项</b>
		<div style="margin-left: 60px;">
		<b>你认为该活动的开展，当代大学生是否有意义？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A较大意义     B一般     C无意义
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt8!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt8==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>你认为的原因：</b> </label>
	    <br>
		<textarea class="input" name="text8" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text8}</textarea>
</div>

<div class="viewlist">
	<b>第9项</b>
		<div style="margin-left: 60px;">
		<b>你认为自己参加这次活动，是否有意义？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A意义很大     B一般     C无意义
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt9!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt9==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>你认为的的原因：</b> </label>
	    <br>
		<textarea class="input" name="text9" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text9}</textarea>
</div>

<div class="viewlist">
	<b>第10项</b>
		<div style="margin-left: 60px;">
		<b>通过本次活动，有想法的你是否会参加思途培训？</b>
		</div>
		<label class="title"><b>选项：</b> </label>
		A会     B不会     C再考虑考虑
		<br>
		<label class="title"><b>回答：</b> </label>
		<table style="position: relative;margin-left: 150px;margin-top: -25px;"><tbody><tr>
		<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.opt10!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.opt10==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
		</tr></tbody></table>
	    <label class="title" style="width:400px;" ><b>不会的原因：</b> </label>
	    <br>
		<textarea class="input" name="text10" style=" position: relative; padding-left:0px; top:5px; left:65px; width:450px; height:80px;border: solid 1px #A673AB;">${requestScope.info.text10}</textarea>
        </div>
            <span style="margin-left: 150px;"> 
						     <button class="seachbt1"  onclick="layer_close();">取消</button>
				            <button class="seachbt1" type="button" onclick="edit();">保存</button>
			  </span>
</c:if>
</form>
<c:import url="../Model/list_footer.jsp" ></c:import>

