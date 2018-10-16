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
.qian{
margin-left: 150px;
margin-top: 20px;
}
.hou{
border-bottom: 1px silver #F8B200;
color: #36A3FF;
}
.xia{
position:absolute;
background-color:#A0E7FF;
width: 400px;
height: 400px;
margin-right: 50px;
margin-left: 70px;
margin-top: -300px;
}
-->
</style>
<body style="overflow:hidden;overflow-y:auto;">
<script type="text/javascript">
function openedit(id,str){
	layer_show("活动总结","Activity/zongjiexiugai?id="+id+"&date="+str,600,400);
}
function detailoptions(){
 $(".xia").css("display","block");
}
function cleardetail(){
$(".xia").css("display","none");
}
</script>

   <span class="printtitle"></span>
     <div>
         <label class="inputtext" style="color:#FF8238;">已经总结 </label>&nbsp;&nbsp;<label class="inputtext" >最后修改人:</label><label class="inputtext" >${requestScope.amlist.oname}</label>
         <button class="seachbt" onclick="openedit(${requestScope.amlist.activity_id},'${requestScope.amlist.createdate}');" type="button">修改总结</button>
         <br>
        <label class="inputtext qian">活动名称:</label><label class="inputtext hou">${requestScope.amlist.aname}</label>
        <label class="inputtext qian">总结人:</label><label class="inputtext hou">${requestScope.amlist.oname}</label><br>
        <label class="inputtext qian">创建时间:</label><label class="inputtext hou">${requestScope.amlist.createdate}</label>
        <label class="inputtext qian">评价内容:</label><label class="inputtext hou" onmouseover="detailoptions();" onmouseleave="cleardetail();">${requestScope.amlist.options}</label><br>
        <label class="inputtext qian">总结:</label><label class="inputtext hou">${requestScope.amlist.summary}</label>
        <label class="inputtext qian">建议:</label><label class="inputtext hou">${requestScope.amlist.proposal}</label><br>
        <label class="inputtext qian">学生状况:</label><label class="inputtext hou">${requestScope.amlist.sstatus}</label>
        <label class="inputtext qian">课程状况:</label><label class="inputtext hou">${requestScope.amlist.tstatus}</label><br>
        <label class="inputtext qian">市场状况:</label><label class="inputtext hou">${requestScope.amlist.cstatus}</label>
        <label class="inputtext qian">学校状况:</label><label class="inputtext hou">${requestScope.amlist.xstatus}</label>
    </div>   
    <div class="xia" style="display: none;line-height:15px">
							<b>第1项.</b>
							<div style="margin-left: 60px;">
							<b>你对当天自己的综合满意度。</b>
							</div>
							A.       较为满意       B.       一般       C.   感觉不太好
							<br>							
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.amlist.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.amlist.options_Number[0]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.amlist.options_Number[0]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr>
							</tbody>
							</table>
                             <br>
                           <b>第2项.</b>
							<div style="margin-left: 60px;">
							<b>你对当天市场的综合满意度。</b>
							</div>
							A.       较为满意       B.       一般       C.   感觉不太好
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.amlist.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.amlist.options_Number[1]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.amlist.options_Number[1]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
							<br>     
							<b>第3项.</b>
							<div style="margin-left: 60px;">
							<b>你对当天学生的综合满意度。</b>
							</div>
							A.       较为满意       B.       一般       C.   感觉不太好
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.amlist.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.amlist.options_Number[2]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.amlist.options_Number[2]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
							<br>
							<b>第4项.</b>
							<div style="margin-left: 60px;">
							<b>你对当天课程的综合满意度。</b>
							</div>
							A.       较为满意       B.       一般       C.   感觉不太好
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.amlist.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.amlist.options_Number[3]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.amlist.options_Number[3]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
							<br>
							<b>第5项.</b>
							<div style="margin-left: 60px;">
							<b>你对当天学校的综合满意度。</b>
							</div>
							A.       较为满意       B.       一般       C.   感觉不太好
							<table style="position: relative;margin-left: 130px;"><tbody>
							<tr>
							<c:forEach items="${requestScope.amlist.options_select}" var="r" varStatus="v">
							<c:if test="${requestScope.amlist.options_Number[4]!=v.index}">
							<td class="opt_mark" myid="${v.index}">${r}</td>
							</c:if>
							<c:if test="${requestScope.amlist.options_Number[4]==v.index}">
							<td class="opt_mark_selected opt_mark" myid="${v.index}" >${r}</td>
							</c:if>
							</c:forEach>
							</tr></tbody>
							</table>
    </div>
<c:import url="../Model/list_footer.jsp" ></c:import>

