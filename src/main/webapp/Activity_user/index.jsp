<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
<script>
function fresh() {
		location.href = "Activity_user/index";
	}
function returnobject(o) {

	}
function del(id){
	$.post("Activity_user/delete",{id:id},function(json){
		if(json.status>0){
			location.reload();
		}
},"json")
}
		
function openwin(){
	layer_show("用户新增","Activity_user/edit",620,365);
	}
function openwindao(){
	layer_show("导员新增","Activity_user/edit2",620,365);
	}
	function openedit(id,type){
		if(type==0){
	layer_show("用户编辑","Activity_user/edit?id="+id,620,365);
		}
		if(type==1){
	layer_show("导员编辑","Activity_user/edit2?id="+id,620,365);
		}
	}
function egnahc(){
	var id=$(".xuexiao").val(); 
	$.getJSON("Activity_user/getcollege",{id:id},function(json){
		$(".xueyuan").remove();
		if(json.length>0){
			$(".xuexiao").after($("<select class='inputselect xueyuan' name='college_id'></select>"));
			if(${requestScope.college_id==null}){
			for(var i=0;i<json.length;i++){
					$(".xueyuan").append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
			    }
			}
			else{
				for(var i=0;i<json.length;i++){
					if(${requetScope.college_id==json[i].id}){
				   $(".xueyuan").append($("<option selected='selected' value='"+json[i].id+"'>"+json[i].name+"</option>"));
					}else{
						$(".xueyuan").append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
					}
				}
			}
		}
	});
}	


function valuezero() {
	$.getJSON("Activity_user/getschool",{},function(json){
		if(json.length>0){
			$("#myselect").after($("<select class='inputselect xuexiao' name='school_id' onchange='egnahc();'></select>"));
			if(${requestScope.school_id==null}){
			for(var i=0;i<json.length;i++){
					$(".xuexiao").append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
			}
			else{
				for(var i=0;i<json.length;i++){
					if(${requetScope.school_id==json[i].id}){
						$(".xuexiao").append($("<option  selected='selected' value='"+json[i].id+"'>"+json[i].name+"</option>"));
					}
					else{
						$(".xuexiao").append($("<option  value='"+json[i].id+"'>"+json[i].name+"</option>"));
					}
					}
			}
		}
	 egnahc(); 
	});
}
function valueone() {
	  if(${requestScope.name==null}){
	 $("#myselect").after($(" <input class='searchinput mingzi' placeholder='名字' name='name'/> "));
	  }
	  if(${requestScope.name!=null}){
	$("#myselect").after($(" <input class='searchinput mingzi' placeholder='名字' name='name' value='"+${requestScope.name} +"'/>"));
	  }
}
function valuetwo() {
	if(${requestScope.tel==null}){
	 $("#myselect").after($(" <input class='searchinput mingzi' placeholder='电话' name='tel'/> "));
	}
	if(${requestScope.tel!=null}){
	 $("#myselect").after($(" <input class='searchinput mingzi' placeholder='电话' name='tel' value='"+${requestScope.tel} +"'/> "));
	}
	
}
function valuethree() {
	$.getJSON("Activity_user/getylevel",{},function(json){
		if(json.length>0){
			$("#myselect").after($("<select class='inputselect ylevel' name='ylevel'></select>"));
			if(${requestScope.ylevel==null})
			{
			  for (var i = 0; i <json.length; i++) {
				  $(".ylevel").append($("<option value='"+i+"'>"+json[i]+"</option>"));
			}
			}
			if(${requestScope.ylevel!=null}){
				for (var i = 0; i <json.length; i++) {
					if(${requestScope.ylevel==i}){
					  $(".ylevel").append($("<option selected='selected' value='"+i+"'>"+json[i]+"</option>"));
						}else{
					  $(".ylevel").append($("<option  value='"+i+"'>"+json[i]+"</option>"));
						}
					}
				}
		}
	});
}
function valuefour() {
	 $.getJSON("Activity_user/getglevel",{},function(json){
			if(json.length>0){
				$("#myselect").after($("<select class='inputselect glevel' name='glevel'></select>"));
				for(var i=0;i<json.length;i++){
					$(".glevel").append($("<option value='"+i+"'>"+json[i]+"</option>"));
				}
			}
		});
}
function valuefive() {
	$.getJSON("Activity_user/getslevel",{},function(json){
		if(json.length>0){
			$("#myselect").after($("<select class='inputselect slevel' name='slevel'></select>"));
			for(var i=0;i<json.length;i++){
				$(".slevel").append($("<option value='"+i+"'>"+json[i]+"</option>"));
			}
		}
	});
}
function change(){
	  var idd=$("#myselect").val(); 
		$(".xuexiao").remove();
	    $(".xueyuan").remove();
		$(".mingzi").remove();
		$(".ylevel").remove();
		$(".glevel").remove();
		$(".slevel").remove();
	  if(idd==0){
		  valuezero();
         }
	  if(idd==1){
		  valueone();
	  }
	  if(idd==2){
		  valuetwo();
	  }
	  if(idd==3){
		  valuethree();
	  }
	  if(idd==4){
		  valuefour();
	  }
	  if(idd==5){
		  valuefive();
	  }
}	

	$(function() {
		
		if(${requestScope.statuscount==null}){
			valuezero();
		};
		if(${requestScope.statuscount==0}){
		    valuezero();
		};
		if(${requestScope.statuscount==1}){
			  valueone();
		};
		if(${requestScope.statuscount==2}){
			 valuetwo();
		};
		if(${requestScope.statuscount==3}){
			 valuethree();
		}
		if(${requestScope.statuscount==4}){
			 valuefour();
		};
		if(${requestScope.statuscount==5}){
			 valuefive();
		};
		
	});
</script>

</head>

<body>
    <span class="printtitle"></span>
<div class="searchview">
     <form action="Activity_user/select" method="post" >
     <label class="searchtext">选择查询:</label>
       <select name="text" class="inputselect" onchange="change();" id="myselect">
       <c:if test="${requestScope.statuscount==0}">
       <option selected="selected" value="0">学校学院</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=0}">
       <option  value="0">学校学院</option>
       </c:if>
       <c:if test="${requestScope.statuscount==1}">
       <option selected="selected" value="1">名字</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=1}">
       <option  value="1">名字</option>
       </c:if>
       <c:if test="${requestScope.statuscount==2}">
       <option  selected="selected" value="2">电话</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=2}">
       <option value="2">电话</option>
       </c:if>
       <c:if test="${requestScope.statuscount==3}">
       <option selected="selected" value="3">未来意向</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=3}">
       <option value="3">未来意向</option>
       </c:if>
       <c:if test="${requestScope.statuscount==4}">
       <option selected="selected" value="4">关注程度</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=4}">
       <option value="4">关注程度</option>
       </c:if>
       <c:if test="${requestScope.statuscount==5}">
       <option selected="selected" value="5">联系等级</option>
       </c:if>
       <c:if test="${requestScope.statuscount!=5}">
       <option value="5">联系等级</option>
       </c:if>
       </select>
        <button class="seachbt" type="submit">查询</button>
        <button class="seachbt" type="button" onclick="openwin();">新增学生</button>
        <button class="seachbt" type="button" onclick="openwindao();">新增导员</button>
        </form>
        </div>
    
    <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th >用户名</th>
        <th >姓名</th>
        <th >性别</th>
        <th  >电话</th>
        <th >qq</th>
        <th >类型</th>
        <th  >专业</th>
        <th >学校</th>
        <th >学院</th>
        <th >未来意向</th>
        <th >关注程度</th>
        <th >联系等级</th>
        <th >状态</th>
        <th >了解信息</th>
        <th >创建时间</th>
        <th >添加人</th>
        <th >备注</th>
        <th width="8%">操作</th>
        </tr>
        </thead>
        
        <tbody>
        <c:forEach items="${requestScope.list}" var="row" >
        <tr>
        <td class="bigtext">${row.niki}</td>
        <td class="bigtext">${row.name}</td>
        <td class="bigtext">${row.sex_Name}</td>
        <td class="bigtext">${row.tel}</td>
        <td class="bigtext">${row.qq}</td>
        <td class="bigtext">${row.type_Name}</td>
        <td class="bigtext">${row.classinfo}</td>
        <td class="bigtext">${row.sname}</td>
        <td class="bigtext">${row.cname}</td>
        <td class="bigtext">${row.ylevel_Name}</td>
        <td class="bigtext">${row.glevel_Name}</td>
        <td class="bigtext">${row.slevel_Name}</td>
        <td class="bigtext">${row.status_Name}</td>
        <td class="bigtext">${row.info}</td>
        <td class="bigtext">${row.createdate}</td>
        <td class="bigtext">${row.operator_id}</td>
        <td>${row.comments}</td>
        <td><a href="javascript:openedit(${row.id},${row.type});" class="tablelink" ">修改</a>
            <a href="javascript:del(${row.id});" class="tablelink">删除</a>
        </td>
        
        </tr>  
        </c:forEach>
        </tbody>
    </table>
       
    <div class="pagin">
			<div class="message">
				共<i class="blue">${requestScope.result.size}</i>条记录，共${requestScope.result.last_pageno}页，当前显示第&nbsp;
				<i class="blue">${requestScope.result.pageno}&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a
					href="Activity_user/index?pageno=${requestScope.result.first_pageno}">首页</a>
				</li>
				<li class="paginItem"><a
					href="Activity_user/index?pageno=${requestScope.result.pro_pageno}">上一页</a>
				</li>
				<li class="paginItem"><a
					href="Activity_user/index?pageno=${requestScope.result.next_pageno}">下一页</a>
				</li>
				<li class="paginItem"><a
					href="Activity_user/index?pageno=${requestScope.result.last_pageno}">末页</a>
				</li>
			</ul>
		</div>
  <c:import url="/Model/list_footer.jsp" ></c:import>