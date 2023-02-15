<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
</head>
<body>
Enc PersonalInfo : <%=request.getParameter("encPsnlInfo")%><br>
dupInfo : <%=request.getParameter("dupinfo")%><br>
coinfo1 : <%=request.getParameter("coinfo1")%><br>
coinfo2 : <%=request.getParameter("coinfo2")%><br>
ciupdate : <%=request.getParameter("ciupdate")%><br>
virtualno : <%=request.getParameter("virtualno")%><br>
cpcode : <%=request.getParameter("cpcode")%><br>
realname : <%=new String(request.getParameter("realname").getBytes("8859_1"))%><br>
cpRequestNumber : <%=request.getParameter("cprequestnumber")%><br>
age : <%=request.getParameter("age")%><br>
sex : <%=request.getParameter("sex")%><br>
nationalityInfo : <%=request.getParameter("nationalinfo")%><br>
birthdate : <%=request.getParameter("birthdate")%><br>
authinfo : <%=request.getParameter("authinfo")%>
</body>
</html>