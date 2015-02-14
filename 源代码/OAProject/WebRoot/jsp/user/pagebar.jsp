<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
 <form id="pageForm" onsubmit="buildpageform();" action=""request.getContextPath()"/mcMsgServlet?task=query" method="post">
共${result.allCount }条记录   共${result.allPage }页   每页显示<select name="pageSize" onchange="dofirst()">
    				<option ${result.pageSize==3?"selected":""}>3</option>
    				<option ${result.pageSize==6?"selected":""}>6</option>
    				<option ${result.pageSize==9?"selected":""}>9</option>
    				<option ${result.pageSize==20?"selected":""}>20</option>
    			</select>条   当前${result.currentPage }/${result.allPage }页 

  		<c:if test="${result.currentPage<=1 }">
  			首页  上一页
  		</c:if>
  		<c:if test="${result.currentPage>1}">
  			<a href="javascript:dofirst();" >首页</a><a href="javascript:dodown();" >上一页</a>
  		</c:if>
  		<c:if test="${result.currentPage<result.allPage }">
  			<a href="javascript:doup();" >下一页</a><a href="javascript:doend();" >尾页</a>
  		</c:if>
  		<c:if test="${result.currentPage>=result.allPage }">
  			下一页  尾页
  		</c:if>

  跳转到<input type="text" name="currentPage" id="currentPage" value="${result.currentPage}" maxlength="3" size="3">页
<script>
	function buildpageform(){
    				//获取外围的表单
    		
    				var outform = document.getElementById("page_form_search");
    				var innerform =document.getElementById("pageForm");
    				
    				//拷贝 action和method
    				innerform.action=outform.action;
    				innerform.method=outform.method;
    				//拷贝隐藏域，查询条件
    				var allhidden = outform.elements;
    				for(var i=0;i<allhidden.length;i++){
    					var hiden = document.createElement("input");
    					if(allhidden[i].name==""){
    						continue;
    					}
    					hiden.type="hidden";
    					hiden.name=allhidden[i].name;
    					hiden.value=allhidden[i].value;
    					innerform.appendChild(hiden);
    				}
    			}
	function dofirst(){
	buildpageform();
		document.getElementById("currentPage").value=1;
		document.getElementById("pageForm").submit();
	}
	function dodown(){
	buildpageform();
		document.getElementById("currentPage").value=${result.currentPage-1};
		document.getElementById("pageForm").submit();
	}
	function doup(){
	buildpageform();
		document.getElementById("currentPage").value=${result.currentPage+1};
		document.getElementById("pageForm").submit();
	}
	function doend(){
	buildpageform();
		document.getElementById("currentPage").value=${result.allPage};
		document.getElementById("pageForm").submit();
	}

</script>
</form>
</div>
