<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.servlet.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="WEB-INF/resources/all_links.jsp"%>
<%@include file="WEB-INF/resources/image_form.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<hr>
	<table class="table mt-8">

		<thead>
			<tr>
				<th scope="col">Image</th>
				<th scope="col">Remark</th>
			</tr>
		</thead>


		<tbody>

			<%
			Connection conn = DbConnect.getConn();
			PreparedStatement ps = conn.prepareStatement("select * from servlet_file");

			/* use of resultset to show detail to frontend */

			ResultSet rs = ps.executeQuery();
			%>

			<%
			while (rs.next()) {
			%>
			<!-- checking the file format -->
			<tr>
				<%
				if (rs.getString("img_name").endsWith(".pdf")) {
				%>

				<th scope="col"><img alt="" src="img/pdf.png" width="100px"
					height="100px" /></th>

				<%
				} else if (rs.getString("img_name").endsWith(".docx")) {
				%>

				<th scope="col"><img alt="" src="img/doc.png" width="100px"
					height="100px" /></th>

				<%
				}

				else if (rs.getString("img_name").endsWith(".txt")) {
				%>
				<th scope="col"><img alt="" src="img/txt.png" width="100px"
					height="100px" /></th>


				<%
				} else if (rs.getString("img_name").endsWith(".xls")) {
				%>

				<th scope="col"><img alt="" src="img/excel.png" width="100px"
					height="100px" /></th>

				<%
				}

				else {
				%>




				<th scope="col"><img alt=""
					src="img/<%=rs.getString("img_name")%>" width="100px"
					height="100px" /></th>
				<%
				}
				%>
				<td><%=rs.getString("remark")%></td>

			</tr>


			<%
			}
			%>


		</tbody>
	</table>


</body>
</html>