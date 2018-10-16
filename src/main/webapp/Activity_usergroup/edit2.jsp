<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<style>
</style>
</head>
<script type="text/javascript">
	function removethis(id,group_id) {
      $.post("Activity_usergroup/removethisid",{id:id,group_id:group_id},function(json){
    	  if(json.status>0){
    		  location.reload();
    	  }
      },"json")
	}
</script>
<body style="overflow:hidden;overflow-y:auto;">
              <table  class="tablelist" style="width: 400px;margin-left: 100px;margin-top: 20px;">
              <thead>
              <tr>
              <th>id</th>
              <th>名字</th>
              <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${requestScope.list}" var="r">
              <tr>
              <td>${r.id}</td>
              <td>${r.name}</td>
              <td><a href="javascript:removethis(${r.id},${requestScope.group_id});" class="tablelink" >移除</a></td>
              </tr>
              </c:forEach>
              </tbody>
              </table>    
              <button class="seachbt1"  onclick="layer_close();" style="margin-left: 250px;">取消</button>
  <c:import url="/Model/form_footer.jsp" ></c:import>
