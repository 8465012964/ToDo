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
     <div>
     <h1>ToDo Home</h1>
     <table border="1px solid black">
     <tr>
     <th>Task Name</th>
     <th>Task Description</th>
     <th>Date Created</th>
     <th>Status</th>
     <th>Delete</th>
     <th>Edit</th>
     </tr>
     <tr>
     <td>Swimming<td>
     <td>Water</td>
     <td>12-nov-2023</td>
     <td>Complete</td>
     <td><button>Delete</button></td>
     <td><button>Edit</button></td>
     </tr>
     </table>
     <br><br>
     <a href="session-add-task"><button>Add Task</button></a>
     <a href="logout"><button>Logout</button></a>
     </div>
</body>
</html>