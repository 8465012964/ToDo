<%-- These are imports of Java --%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dto.Task"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
		display:flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	</style>
</head>
<body>
<%-- To Receive the tasks of user --%>
	<%
	List<Task> list = (List<Task>) request.getAttribute("list");
	%>
	<div>
		<h1>Todo Home</h1>
		<table border="1px solid black">
			<tr>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Date Created</th>
				<th>Status</th>
				<th>Delete</th>
				<th>Edit</th>
			</tr>
			<%-- Making sure list is present and iterating over it --%>
			<%
			if (list != null) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM YYYY hh:mm");
				for (Task task : list) {
			%>
			<%--we can not use one tag inside another so opened for loop  --%>
			<tr>
				<th><%=task.getName()%></th>
				<th><%=task.getDescription()%></th>
				<th><%=task.getCreatedTime().format(formatter)%></th>
				<th>
					<%
					if (task.isStatus()) {
					%> Completed <%
					} else {
					%>
					<%-- Url rewriting for carrying primary key --%>
					<a href="change-status?id=<%=task.getId()%>"><button>Complete</button></a> <%
 }
 %>
				</th>
				<th><a href="delete?id=<%=task.getId()%>"><button>Delete</button></a></th>
				<th><button>Edit</button></th>
			</tr>
			<%-- Closing for loop and if here --%>
			<%
			}
			}
			%>
		</table>
		<br> <a href="session-add-task"><button>Add Task</button></a><br>
		<a href="logout"><button>Logout</button></a>
	</div>
</body>
</html>