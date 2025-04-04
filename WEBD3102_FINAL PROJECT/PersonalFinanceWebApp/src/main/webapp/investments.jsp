<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.finance.model.Investment" %>
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
        <a href="budgets">Budgets</a>
    </nav>
</header>
<div class="container">
    <h2>Investments</h2>
    <form action="investments" method="post">
        <label for="name">Investment Name</label>
        <input type="text" name="name" id="name" required/>
        <label for="type">Type</label>
        <input type="text" name="type" id="type" placeholder="Stocks, Crypto, etc." required/>
        <label for="amount">Amount Invested</label>
        <input type="number" step="0.01" name="amount" id="amount" required/>
        <button type="submit">Add Investment</button>
    </form>
    <%
        List<Investment> investments = (List<Investment>) request.getAttribute("investments");
        if (investments != null && !investments.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Investment i : investments) {
        %>
        <tr>
            <td><%= i.getName() %></td>
            <td><%= i.getType() %></td>
            <td><%= i.getAmount() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>No investments yet!</p>
    <%
        }
    %>
</div>
</body>
</html>