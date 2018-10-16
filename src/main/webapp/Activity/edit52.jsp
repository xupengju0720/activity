<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../Model/list_head.jsp" ></c:import>
<style>
<!--
.opt_mark{
width: 50px;height: 20px;background-color: #3F3;color: #FFF;cursor: pointer;text-align: center;
border: solid #eee 1px;
}
.opt_mark_selected{
background-color: #F33;
}
-->
</style>
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
<body style="overflow:hidden;overflow-y:auto;line-height:30px">
<script type="text/javascript">
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
var mark=0;
if(mark==0){
	$(document).on("click",".opt_mark",function(e){
	var o=$(e.target);
		o.addClass("opt_mark_selected");
		o.siblings().removeClass("opt_mark_selected");
	});
	
	}
function editchange(){
	var idp=[];
	$(".opt_mark_selected").each(function(){
		var id=$(this).attr("myid");
        idp.push(id);
	})
		var ids = idp.join(',');
		$("#optionpinjie2").val(ids);
		var data = $(".f2").serializeArray();
		$.ajax({
			url : "Activity/updatesummary",
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
	var idp=[];
	var count = 0;
	$(".opt_mark_selected").each(function(){
		count++;
		var id=$(this).attr("myid");
        idp.push(id);
	})
	if(count==5){
		var ids = idp.join(',');
		$("#optionpinjie1").val(ids);
		var data = $(".f1").serializeArray();
		$.ajax({
			url : "Activity/insertsummary",
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
	if(count<5){
		alert("存在未选项");
	}
}	

</script>
<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">状态信息</li>
					<li onclick="setTab(0,1)">评价选项</li>
				</ul>
				<c:if test="${requestScope.info==null}">
				<div class="main" id="main0" style="width:600px;">
<form class="f1">
						<input type="hidden" name="insert" /> 
					      <ul class="block" style="margin-left: 80px;">
				            <span class="inputspan">
				            <label class="inputtext ">总结:</label> 
				         <textarea class="inputinput"  required="required" name="summary" style="width:400px"></textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">建议:</label> 
				         <textarea class="inputinput"  required="required" name="proposal" style="width:400px"></textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">学生状况:</label> 
				         <textarea class="inputinput"  required="required" name="sstatus" style="width:400px"></textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">课程状况:</label> 
				         <textarea class="inputinput"  required="required" name="tstatus" style="width:400px"></textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">市场状况:</label> 
				         <textarea class="inputinput"  required="required" name="cstatus" style="width:400px"></textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">学校状况:</label> 
				         <textarea class="inputinput"  required="required" name="xstatus" style="width:400px"></textarea>
				          </span>
					   
					   </ul>	
						<ul>
						<input type="hidden" name="options" id="optionpinjie1" value="">
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left:90px;width: 600px;">
						<b>第1项</b>
							<div style="margin-left: 60px;">
							<b>你对当天自己的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 220px;">
							<tbody>
							<tr>
							<td class="opt_mark" myid="0">A</td>
							<td class="opt_mark" myid="1">B</td>
							<td class="opt_mark" myid="2">C</td>
							</tr>
							</tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 90px;width: 600px;">
						<b>第2项</b>
							<div style="margin-left: 60px;">
							<b>你对当天市场的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 220px;"><tbody>
							<tr>
							<td class="opt_mark" myid="0">A</td>
							<td class="opt_mark" myid="1">B</td>
							<td class="opt_mark" myid="2">C</td>
							</tr></tbody>
							</table>
						
					    </div>
                       <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 90px;width: 600px;">
						<b>第3项</b>
							<div style="margin-left: 60px;">
							<b>你对当天学生的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 220px;"><tbody>
							<tr>
							<td class="opt_mark" myid="0">A</td>
							<td class="opt_mark" myid="1">B</td>
							<td class="opt_mark" myid="2">C</td>
							</tr></tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 90px;width: 600px;">
						<b>第4项</b>
							<div style="margin-left: 60px;">
							<b>你对当天课程的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 220px;"><tbody>
							<tr>
							<td class="opt_mark" myid="0">A</td>
							<td class="opt_mark" myid="1">B</td>
							<td class="opt_mark" myid="2">C</td>
							</tr></tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 90px;width: 600px;">
						<b>第5项</b>
							<div style="margin-left: 60px;">
							<b>你对当天学校的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 220px;"><tbody>
							<tr>
							<td class="opt_mark" myid="0">A</td>
							<td class="opt_mark" myid="1">B</td>
							<td class="opt_mark" myid="2">C</td>
							</tr></tbody>
							</table>
						
					</div>
                <div class="inputbtpanel" style="width: 600px;margin-left: 90px;margin-top: 20px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="edit();"
						>保存</button>
				</div>
				</ul>	
							
    </form>
    </div>
	</c:if>		

<c:if test="${requestScope.info!=null}">
<div class="main" id="main0" style="width:500px;">
       <form class="f2">
							<input type="hidden" name="update" /> 
							<input type="hidden" name="id" value="${requestScope.info.id}"> 
							<input type="hidden" name="createdate" value="${requestScope.info.createdate}"> 
							<input type="hidden" name="activity_id" value="${requestScope.info.activity_id}">
					        <ul class="block" style="margin-left: 40px;">
				            <span class="inputspan">
				            <label class="inputtext ">总结:</label> 
				            <textarea class="inputinput"  required="required" name="summary" style="width:250px">${requestScope.info.summary}</textarea>
				            </span>
				            <span class="inputspan">
				            <label class="inputtext ">建议:</label> 
				            <textarea class="inputinput"  required="required" name="proposal" style="width:250px">${requestScope.info.proposal}</textarea>
				            </span>
				            <span class="inputspan">
				            <label class="inputtext ">学生状况:</label> 
				         <textarea class="inputinput"  required="required" name="sstatus" style="width:250px">${requestScope.info.sstatus}</textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">课程状况:</label> 
				         <textarea class="inputinput"  required="required" name="tstatus" style="width:250px">${requestScope.info.tstatus}</textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">市场状况:</label> 
				         <textarea class="inputinput"  required="required" name="cstatus" style="width:250px">${requestScope.info.cstatus}</textarea>
				          </span>
				            <span class="inputspan">
				            <label class="inputtext ">学校状况:</label> 
				         <textarea class="inputinput"  required="required" name="xstatus" style="width:250px">${requestScope.info.xstatus}</textarea>
				          </span>
					   
					   </ul>	
						<ul>
						<input type="hidden" name="options" id="optionpinjie2" value="${requestScope.info.options}">
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left:100px;width: 400px;">
						<b>第1项</b>
							<div style="margin-left: 60px;">
							<b>你对当天自己的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<br><label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.options_Number[0]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.options_Number[0]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr>
							</tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 100px;width: 400px;">
						<b>第2项</b>
							<div style="margin-left: 60px;">
							<b>你对当天市场的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<br><label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.options_Number[1]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.options_Number[1]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 100px;width: 400px;">
						<b>第3项</b>
							<div style="margin-left: 60px;">
							<b>你对当天学生的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<br><label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.options_Number[2]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.options_Number[2]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 100px;width: 400px;">
						<b>第4项</b>
							<div style="margin-left: 60px;">
							<b>你对当天课程的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<br><label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.options_Number[3]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.options_Number[3]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
						
					</div>
           <div class="viewlist" style="border-bottom: 1px solid #FFBA00;margin-left: 100px;width: 400px;">
						<b>第5项</b>
							<div style="margin-left: 60px;">
							<b>你对当天学校的综合满意度。</b>
							</div>
							<label class="title"><b>选项：</b> </label>
							A.       较为满意       B.       一般       C.   感觉不太好
							
							<br><label class="title"><b>回答：</b> </label>
							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.info.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.info.options_Number[4]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.info.options_Number[4]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
						
					</div>
                <div class="inputbtpanel" style="width: 600px;margin-top: 20px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="editchange();"
						>保存</button>
				</div>
				</ul>	
							
</form>
</div>
					</c:if>		

				
<c:import url="../Model/list_footer.jsp" ></c:import>

