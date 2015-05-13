<%@ page language="java" contentType="text/html; charset=EUC-KR"
    import="java.sql.*" pageEncoding="EUC-KR"%>
 <%@ page import="com.snl.service.domain.User" %>    
<%
	
	String userid = request.getParameter("id");
 	System.out.print(userid);
 
 String str = "";
 
 try {
	 boolean isCheck =false;
	 if(request.getAttribute("isCheck") != null){
	 	isCheck=((Boolean)request.getAttribute("isCheck")).booleanValue();
	 }
	 if(isCheck) {
		 
		 str="NO";
		 out.print(str);
	 }else {
		 str="YES";
		 out.print(str);
	 }
	
 }catch(Exception e) {
	 e.printStackTrace();
 }
%>