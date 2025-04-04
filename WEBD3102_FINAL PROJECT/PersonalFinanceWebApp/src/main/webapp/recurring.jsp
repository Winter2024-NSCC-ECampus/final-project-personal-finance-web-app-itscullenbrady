<%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%@ page import="com.example.finance.model.RecurringTransaction" %>
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
             label {
                 display: block; margin: 0.5em 0;
                 font-family: Verdana, Geneva, sans-serif;
             }
             input, select, button {
                 display: block; margin: 0.5em 0;
                 font-family: 'Courier New', Courier, monospace;
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
                    <a href="budgets">Budgets</a>
                    <a href="investments">Investments</a>
                </nav>
            </header>
            <div class="container">
                <h2>Recurring Transactions</h2>
                <form action="recurring" method="post">
                    <label for="type">Type</label>
                    <select name="type" id="type">
                        <option value="Income">Income</option>
                        <option value="Expense">Expense</option>
                    </select>
                    <label for="category">Category</label>
                    <input type="text" name="category" id="category" required/>
                    <label for="amount">Amount</label>
                    <input type="number" step="0.01" name="amount" id="amount" required/>
                    <label for="note">Note</label>
                    <input type="text" name="note" id="note"/>
                    <label for="frequency">Frequency</label>
                    <select name="frequency" id="frequency">
                        <option value="Monthly">Monthly</option>
                        <option value="Weekly">Weekly</option>
                    </select>
                    <button type="submit">Add</button>
                </form>
                <%
                    List<RecurringTransaction> recurringList = (List<RecurringTransaction>) request.getAttribute("recurringList");
                    if (recurringList != null && !recurringList.isEmpty()) {
                %>
                <table>
                    <thead>
                    <tr>
                        <th>Type</th>
                        <th>Category</th>
                        <th>Amount</th>
                        <th>Note</th>
                        <th>Frequency</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (RecurringTransaction rt : recurringList) {
                    %>
                    <tr>
                        <td><%= rt.getType() %></td>
                        <td><%= rt.getCategory() %></td>
                        <td><%= rt.getAmount() %></td>
                        <td><%= rt.getNote() %></td>
                        <td><%= rt.getFrequency() %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <%
                } else {
                %>
                <p>No recurring items yet!</p>
                <%
                    }
                %>
            </div>
            </body>
            </html>