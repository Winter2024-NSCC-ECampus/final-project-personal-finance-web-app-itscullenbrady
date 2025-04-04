<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ page import="com.example.finance.model.Budget" %>
  <%@ page import="java.util.List" %>
  <html>
  <head>
    <title>Pocket Guard</title>
 <style>
   body {
     background: linear-gradient(to right, #ffe8c2, #faefdc);
     margin: 0; padding: 0;
     font-family: Arial, Helvetica, sans-serif; color: #333;
   }
   header {
     background: #decaa3; padding: 1em; text-align: center;
     box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
     font-family: Georgia, 'Times New Roman', Times, serif;
   }
   .container {
     max-width: 800px; margin: 2em auto; background: #ffffffcc;
     border-radius: 8px; padding: 2em;
     box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
   }
   h2 { color: #b6a685; }
   table {
     width: 100%; border-collapse: collapse; margin-top: 1em;
     box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
   }
   th {
     background: #decaa3; color: #333;
     padding: 0.8em; text-align: left;
     font-family: Verdana, Geneva, sans-serif;
   }
   td, th {
     border: 1px solid #decaa3; padding: 0.8em;
   }
   td {
     font-family: 'Courier New', Courier, monospace;
   }
   tr:nth-child(even) {
     background: #f9f9f9;
   }
   tr:hover {
     background: #f1f1f1;
   }
   a {
     color: #b6a685; text-decoration: none;
   }
   a:hover {
     text-decoration: underline;
   }
   nav a {
     margin: 0 1em; padding: 0.5em 1em;
     background: #b6a685; color: #fff; border-radius: 4px;
     transition: background 0.3s;
   }
   nav a:hover {
     background: #887c62;
   }
   label, input, button {
     display: block; margin: 0.5em 0;
   }
   button {
     background: #b6a685; color: #fff; border: none;
     border-radius: 4px; padding: 0.6em 1.2em; cursor: pointer;
   }
 </style>
  </head>
  <body>
  <header>
    <h1>Pocket Guard</h1>
    <nav>
      <a href="index.jsp">Home</a>
      <a href="transactions">Transactions</a>
      <a href="recurring">Recurring Items</a>
      <a href="investments">Investments</a>
    </nav>
  </header>
  <div class="container">
    <h2>Budgets</h2>
    <form action="budgets" method="post">
      <label for="category">Category</label>
      <input type="text" name="category" id="category" required/>
      <label for="limit">Monthly Limit</label>
      <input type="number" step="0.01" name="limit" id="limit" required/>
      <button type="submit">Add Budget</button>
    </form>
    <%
      List<Budget> budgets = (List<Budget>) request.getAttribute("budgets");
      if (budgets != null && !budgets.isEmpty()) {
    %>
    <table>
      <thead>
      <tr>
        <th>Category</th>
        <th>Limit</th>
        <th>Spent</th>
        <th>Remaining</th>
      </tr>
      </thead>
      <tbody>
      <%
        for (Budget b : budgets) {
          double remaining = b.getLimit() - b.getSpent();
      %>
      <tr>
        <td><%= b.getCategory() %></td>
        <td><%= b.getLimit() %></td>
        <td><%= b.getSpent() %></td>
        <td><%= remaining %></td>
      </tr>
      <%
        }
      %>
      </tbody>
    </table>
    <%
    } else {
    %>
    <p>No budgets set yet!</p>
    <%
      }
    %>
  </div>
  </body>
  </html>