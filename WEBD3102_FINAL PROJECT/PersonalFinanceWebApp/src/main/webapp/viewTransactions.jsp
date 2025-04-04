<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.finance.model.Transaction" %>
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
</style>
</head>
<body>
<header>
    <h1>Pocket Guard</h1>
    <nav>
        <a href="index.jsp">Add Transaction</a>
        <a href="recurring">Recurring Items</a>
        <a href="budgets">Budgets</a>
        <a href="investments">Investments</a>
    </nav>
</header>
<div class="container">
    <h2>All Transactions</h2>
    <%
        List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
        if (transactions != null && !transactions.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Type</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Note</th>
            <th>Tags</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Transaction t : transactions) {
        %>
        <tr>
            <td><%= t.getType() %></td>
            <td><%= t.getCategory() %></td>
            <td><%= t.getAmount() %></td>
            <td><%= t.getNote() %></td>
            <td><%= t.getTags() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>No transactions yet!</p>
    <%
        }
    %>
</div>
</body>
</html>