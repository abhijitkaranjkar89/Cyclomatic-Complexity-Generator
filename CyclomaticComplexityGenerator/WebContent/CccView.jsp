<%@ page language="java" contentType="application/vnd.ms-excel; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.accenture.cc.domain.*" %>
     <%@ page import="com.accenture.cc.servic.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cyclomatic Complexity</title>
</head>
<body style="font-size: 10px;">

<table id="excelTable" border="1" cellpadding="0" cellspacing="0">
<tr >
<th colspan="4" bgcolor="#A9BCF5">Demographic Information</th>
<th colspan="6" bgcolor="#A9BCF5">Conditional and Looping Statements</th>
<th colspan="2" bgcolor="#A9BCF5">Miscellanoeus Statements</th>
<th colspan="2" bgcolor="#A9BCF5">Non-Local Statements</th>
<th colspan="2" bgcolor="#A9BCF5">Event Handling Statements</th>
<th colspan="2" bgcolor="#A9BCF5">Logical Operators</th>
<th bgcolor="#A9BCF5">Others</th>
<th colspan="2" bgcolor="#A9BCF5">Output</th>
<th bgcolor="#A9BCF5"></th>
</tr>
<tr>
<th>Sr. No.</th>
<th>Release Name</th>
<th>Module Name</th>
<th>Class Name</th>
<th bgcolor="#A9BCF5">Count of "IF..THEN"
</th>
<th bgcolor="#A9BCF5">Count of "IF ..THEN..ELSE"
</th>
<th bgcolor="#A9BCF5">Count of "DO..WHILE"
</th>
<th bgcolor="#A9BCF5">Count of "WHILE.."
</th>
<th bgcolor="#A9BCF5">Count of "CASE"
</th>
<th bgcolor="#A9BCF5">Count of "FOR.."
</th>
<th bgcolor="#A9BCF5">Count of "GOTO"
</th>
<th bgcolor="#A9BCF5">Count of "LABEL"
</th>
<th bgcolor="#A9BCF5">Count of "Macro setjmp"
</th>
<th bgcolor="#A9BCF5">Count of "Function"
</th>
<th bgcolor="#A9BCF5">Count of "SIGNAL"
</th>
<th bgcolor="#A9BCF5">Count of "RAISE"
</th>
<th bgcolor="#A9BCF5">Count of "AND"
</th>
<th bgcolor="#A9BCF5">Count of "OR"
</th>
<th bgcolor="#A9BCF5">Count of Others 
</th>
<th >No of Decision Points (P)
</th>
<th>CCN (P+1)
</th>
<th>Number of Test Cases
</th>
</tr>
<%

List<ClassBO> classInfoList = (List<ClassBO>)request.getAttribute("classInfoList");

int i = 0;
int ccSum = 0, testCasesSum = 0;
  double avgComplexity = 0.0;
if(classInfoList != null) {
  response.setHeader("Content-Disposition", "attachment; filename=\"Cyclomatic_Complexity_"+classInfoList.get(0).getReleaseName()+"_"+classInfoList.get(0).getModuleName()+".xls\"");
for(ClassBO clsbo : classInfoList)  {
ccSum += clsbo.getCcn();
   testCasesSum += clsbo.getTestCasesCount();
i++;
 %>
 <tr>
 <td><%=i %></td>
 <td><%=clsbo.getReleaseName() %></td>
 <td><%=clsbo.getModuleName() %></td>
 <td><%=clsbo.getClassName() %></td>
 <td>
 <%
  if(clsbo.getIfCount()>0)
  out.println(clsbo.getIfCount());
  %> 
 </td>
 <td>
 <%
  if(clsbo.getIfElseCount()>0)
  out.println(clsbo.getIfElseCount());
  %> 

 </td>
 <td>
 <%
  if(clsbo.getDoWhileCount()>0)
  out.println(clsbo.getDoWhileCount());
  %> 

 </td>
 <td>
 <%
  if(clsbo.getWhileCount()>0)
  out.println(clsbo.getWhileCount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getSwitchCount()>0)
  out.println(clsbo.getSwitchCount());
  %> 

 </td>
 <td>
 <%
  if(clsbo.getForCount()>0)
  out.println(clsbo.getForCount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getGotocount()>0)
  out.println(clsbo.getGotocount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getLabelCount()>0)
  out.println(clsbo.getLabelCount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getSetJmpcount()>0)
  out.println(clsbo.getSetJmpcount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getFunctioncount()>0)
  out.println(clsbo.getFunctioncount());
  %> 
 
 </td>
 
 <td>
 <%
  if(clsbo.getSignalCount()>0)
  out.println(clsbo.getSignalCount());
  %> 
 
 </td>
 <td>
 <%
  if(clsbo.getRaiseCount()>0)
  out.println(clsbo.getRaiseCount());
  %>  
 </td>
 
 <td>
 <%
  if(clsbo.getConditionalAndCount() > 0)
  out.println(clsbo.getConditionalAndCount());
  %> 
 </td>
 <td>
 <%
  if(clsbo.getConditionalOrCount()>0)
  out.println(clsbo.getConditionalOrCount());
  %> 
 </td>
 <td></td>
 <td bgcolor="#BDBDBD"><%=clsbo.getDecisionPts() %></td>
 <td bgcolor="#A9F5D0"><%=clsbo.getCcn() %></td>
 <td><%=clsbo.getTestCasesCount() %></td>
 </tr>
 <%
 }
 avgComplexity = ccSum*1.0/classInfoList.size();
 }
  %>
  </table>
  
  <br>
  <br></br><br>
  <table id="summaryTable" border="1" cellpadding="0" cellspacing="0" width="400">
  <tr>
  <th bgcolor="#CEF6F5">Details of the Cyclomatic Complexity obtained based on the data provided above</th>
  </tr>
  
  <tr>
  <th>
  <br>
  <table id="summaryTable1" border="1" cellpadding="0" cellspacing="0" width="250" align="center">
  <tr>
  <th bgcolor="#A9BCF5">Release
  </th>
  <th><%=classInfoList.get(0).getReleaseName() %></th>
  <th bgcolor="#A9BCF5">Work Stream 
  </th>
  <th>    
  </th>
  </tr>
  </table>
  <br>
  <br>
  
  <table id="summaryTable2" border="1" cellpadding="0" cellspacing="0" width="250" align="center">
  <tr>
  <th colspan="3" bgcolor="#CEF6F5">(A)Cyclomatic Complexity of top 3 programs/methods in the release with highest complexity</th>
  </tr>
  <tr>
  <th bgcolor="#A9BCF5">Sr. No.
  </th>
  <th bgcolor="#A9BCF5">Method/Program Name (Optional)</th>
  <th bgcolor="#A9BCF5">Cyclomatic Complexity (Mandatory)   
  </th>
  </tr>
  
  <%
  
   if(classInfoList != null) {
     Collections.sort(classInfoList, new SortingHelper());
    for(int j = 0; j < classInfoList.size() && j<3; j++) {
    
   %>
  <tr>
  <th><%=j+1 %></th>
  <th><%=classInfoList.get(j).getClassName() %></th>
  <th><%=classInfoList.get(j).getCcn() %></th>
  </tr>
  <%
  }
  
  
  }
   %>
  </table>
  
  <br>
  <br>
  <table id="summaryTable3" border="1" cellpadding="0" cellspacing="0" width="250" align="center">
  <tr>
  <th colspan="4">(B) Average Cyclomatic Complexity</th>
  </tr>
  <tr>
  <th bgcolor="#A9BCF5">No. of programs/methods in the release      
  </th>
  <th><%=classInfoList.size() %></th>
  <th bgcolor="#A9BCF5"><br>Sum of Cyclomatic Complexity <br>of all methods/programs in the release<br><br>     
  </th>
  <th><%=ccSum %></th>
  
  </tr>
  <tr>
  <th bgcolor="#A9BCF5"><br>Average Cyclomatic Complexity   <br>  <br>
  </th>
  <th><%=Math.round(avgComplexity*100.0)/100.0 %></th>
  <th bgcolor="#A9BCF5"><br>Number of Unit Test Cases  <br><br> 
  </th>
  <th><%=testCasesSum %></th>
  </tr>
  </table>
  
  
  
  </th>
  </tr>
  </table>
  
</body>
</html>