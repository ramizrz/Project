<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("id");
String cmt=request.getParameter("cmt");
String email=(String)session.getAttribute("email");
System.out.println(n);
System.out.println(cmt);
System.out.println(email);
if(n.length()>0){
try{

java.sql.Connection con;
Class.forName("org.gjt.mm.mysql.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/globe");
PreparedStatement ps=con.prepareStatement("insert into forumtadvc(tid,cmt,email) values(?,?,?)");
ps.setString(1,n);
ps.setString(2,cmt);
ps.setString(3,email);

int rs=ps.executeUpdate();
if(rs>0){

}
else{
%>

<jsp:forward page="viewtopic.jsp"></jsp:forward>
<%

}
con.close();


}catch(Exception e){e.printStackTrace();}
}//end of if
%>
