<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head_index.jsp" ></c:import>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    user-select: none;
}

#desk {
    position: absolute;
    top: 0;
    bottom: 30px;
    width: 100%;
    overflow: hidden;
}

element.style {
    left: 20px;
    top: 20px;
}
#desk ul li {
    width: 80px;
    height: 57px;
    padding: 10px 0;
    text-align: center;
    position: absolute;
    cursor: pointer;
}
#desk ul li, #desk ul li span, .title-bar {
    -moz-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
form, ul, ol, li, dl, dt, dd, h1, h2, h3, h4, h5, p {
    list-style: none outside none;
}
* {
    margin: 0;
    padding: 0;
    -moz-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
#desk ul li img {
    border-radius: 3px 3px 3px 3px;
    display: block;
    height:60px;
    width:60px;
    margin: auto;
}
* {
    margin: 0;
    padding: 0;
    -moz-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
#desk ul li {
    width: 80px;
    height: 57px;
    padding: 10px 0;
    text-align: center;
    position: absolute;
    cursor: pointer;
}
.personnal{
 width: 150px;
 height: 80px;
 background-color:white;
 margin-left: 100px;
 margin-top: 800px;
 padding:10px 25px 10px 25px;
}
.personnal>p{
color:#FF7233;
}
</style>
<script type="text/javascript">

function xuexiao() {
	layer_show("学校信息","Activity_school/index",1000,600);
}
function college() {
	layer_show("学院信息","Activity_college/index",1000,600);
}
function operator() {
	layer_show("操作员信息","Activity_operator/index",1000,600);
}
function user() {
	layer_show("用户信息","Activity_user/index",1600,600);
}
function time() {
	layer_show("活动时间","Activity_time/index",1000,600);
}
function usergroup(){
	layer_show("活动分组","Activity_usergroup/index",1200,600);
}
function checkwork(){
	layer_show("考勤状况","Activity_checkwork/index",1200,600);
}
function activity(){
	layer_show("活动信息","Activity/index",1500,600);
}
function summary(){
	layer_show("活动总结","Activity_summary/index",1500,600);
}
function evaluation(){
	layer_show("活动测评","Activity_evaluation/index",1500,600);
}
function feedback(){
	layer_show("活动反馈","Activity_feedback/index",1500,600);
}
function market(){
	layer_show("活动市场","Activity_market/index",1500,600);
}
function report(){
	layer_show("活动市场","Activity_report/index",1500,600);
}
function person(qufen,id){
	if(qufen==3||qufen==4)
	{
	$.getJSON("Activity_user/operator",{id:id},function(json){
		$(".personnal").empty();
		if(json.id>0){
			$(".maindesk").append($("<div class='personnal'></div>"));
			$(".personnal").append($("<p>名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+json.name+"</p>"));
			$(".personnal").append($("<p>电话:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+json.tel+"</p>"));
		}
	});
	}
	
	if(qufen==1||qufen==2){
		$.getJSON("Activity_user/getuser",{id:id},function(json){
			if(json.length>0){
				for(var i=0;i<json.length;i++){
					$(".xueyuan").append($("<span value='"+json[i].id+"'>"+json[i].name+"</span>"));
				}
			}
		});
	}
}
function personremove(){
	$(".personnal").remove();
}
function changepass(){
	if(confirm("确定要修改密码吗？"))
	 {
		layer_show("密码修改","password.jsp",300,300);
	 }
}
</script>
</head>
<body>
<div>
	<div id="desk" class="maindesk" style="background-color: #A0E7FF;">
	<c:if test="${sessionScope.qufen==4||sessionScope.qufen==3}">
     		<ul>
		    <li style="left: 20px; top: 800px" onmouseleave="personremove();" onclick="changepass();"  onmouseover="person(${sessionScope.qufen},${sessionScope.sdetail.id});"><img 
		     src="/practicaltraining/images/ten.png" ><span>个人信息</span><em></em></li>
	   		<li style="left: 20px; top: 20px"  onclick="xuexiao();"><img 
				src="/practicaltraining/images/pageone.jpg" ><span>学校表</span><em></em></li>
			<li style="left: 20px; top: 110px"  onclick="college();"><img 
				src="/practicaltraining/images/pagetwo.jpg"><span>学院表</span><em></em></li>
				<c:if test="${sessionScope.sdetail.power==0}">
			<li style="left: 20px; top: 200px" onclick="operator();"><img 
				src="/practicaltraining/images/pagethree.jpg"><span>操作员</span><em></em></li>
				</c:if>
			<li style="left: 20px; top: 290px"  onclick="user();"><img
				src="/practicaltraining/images/pagefive.jpg"><span>用户表</span><em></em></li>
				
			<li style="left: 20px; top: 380px"  onclick="summary();">
			<img src="/practicaltraining/images/six.jpg"><span>总结表</span><em></em></li>

			<li style="left: 20px; top: 470px" onclick="time();">
			<img src="/practicaltraining/images/seven.jpg"><span>时间表</span><em></em></li>
			
		    <li style="left: 20px; top: 560px"  onclick="evaluation();">
			<img src="/practicaltraining/images/ten.jpg"><span>测评表</span><em></em></li>
			
			<li style="left: 20px; top: 650px" onclick="checkwork();">
			<img src="/practicaltraining/images/eight.jpg"><span>考勤表</span><em></em></li>
			
			<li style="left: 100px; top: 20px" onclick="activity();">
			<img src="/practicaltraining/images/eight.jpg"><span>活动表</span><em></em></li>
		   
            <li style="left: 100px; top: 110px"  onclick="usergroup();">
			<img src="/practicaltraining/images/pagefour.jpg"><span>分组表</span><em></em></li>
            
            <li style="left: 100px; top: 200px"  onclick="feedback();">
			<img src="/practicaltraining/images/eleven.jpg"><span>反馈表</span><em></em></li>
            
            <li style="left: 100px; top: 290px"  onclick="market();">
			<img src="/practicaltraining/images/twelve.jpg"><span>市场表</span><em></em></li>
            
            <li style="left: 100px; top: 380px"  onclick="report();">
			<img src="/practicaltraining/images/thrteen.jpg"><span>日报表</span><em></em></li>
		</ul>
		</c:if>
	</div>
</div>
<c:import url="/Model/list_footer.jsp" ></c:import>
</html>
