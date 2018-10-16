<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style>
.qian{
margin-left: 80px;
margin-top: 20px;
}
.hou{
border-bottom: 1px silver #F8B200;
color: #36A3FF;
}
</style>
</head>
<script type="text/javascript">
	function openedit(id) {
		location.href="Activity_usergroup/groupcountedit?id="+id;
	}
</script>
<body style="overflow:hidden;overflow-y:auto;">
        <div>
         <label class="inputtext" style="color:#FF8238;">已经打分 </label>&nbsp;&nbsp;<label class="inputtext" >最后修改人:</label><label class="inputtext" >${requestScope.glist.oname}</label>
         <label class="inputtext">该组平均分:</label><label class="inputtext" >${requestScope.glist.score}</label>
         <button class="seachbt" onclick="openedit(${requestScope.glist.id});" type="button">修改分数</button>
         <br>
        <label class="inputtext qian">分数1:</label><label class="inputtext hou">${requestScope.glist.point1}</label>
        <label class="inputtext qian">分数2:</label><label class="inputtext hou">${requestScope.glist.point2}</label><br>
        <label class="inputtext qian">分数3:</label><label class="inputtext hou">${requestScope.glist.point3}</label>
        <label class="inputtext qian">分数4:</label><label class="inputtext hou">${requestScope.glist.point4}</label><br>
        <label class="inputtext qian">分数5:</label><label class="inputtext hou">${requestScope.glist.point5}</label>
        <label class="inputtext qian">分数6:</label><label class="inputtext hou">${requestScope.glist.point6}</label><br>
        <label class="inputtext qian">分数7:</label><label class="inputtext hou">${requestScope.glist.point7}</label>
        <label class="inputtext qian">分数8:</label><label class="inputtext hou">${requestScope.glist.point8}</label><br>
        <label class="inputtext qian">分数9:</label><label class="inputtext hou">${requestScope.glist.point9}</label>
        <label class="inputtext qian">分数10:</label><label class="inputtext hou">${requestScope.glist.point10}</label>
    </div>
  <c:import url="/Model/form_footer.jsp" >
  </c:import>
