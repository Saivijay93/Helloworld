<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ss2.sdk.SS2"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<% 

SS2 ss2Obj = new SS2();

String shieldsquare_username = "sample user";

int shieldsquare_calltype = 1;

String shieldsquare_pid = "";


com.fasterxml.jackson.databind.JsonNode ss2respJson=ss2Obj.shieldsquare_ValidateRequest(request,response,shieldsquare_pid,shieldsquare_username,shieldsquare_calltype);

//set the response to a request attribute to make it accessible to js
request.setAttribute("ss2apirespJson",ss2respJson);
	

%>

This is the Response from API:<%=ss2respJson%>
<br>

</body>
<% String userid="saivijay";%>
    <form action="update.jsp" method="post">
	<input type="text" name="uname">  
  <%
    session.setAttribute("userId", userid);
        %>
<input type="submit" value="submit" >

</form>
<script type="text/javascript">
var ss2respJson = <%= request.getAttribute("ss2apirespJson") %>;
var __uzdbm_a = ss2respJson.pid;
<%=((JsonNode)request.getAttribute("ss2apirespJson")).get("dynamic_JS")%>
</script>
<div id="ss_098786_234239_238479_190541"></div>
<script src ="https://cdn.perfdrive.com/static/jscall_min.js" async="true"></script>
</body>
</html>