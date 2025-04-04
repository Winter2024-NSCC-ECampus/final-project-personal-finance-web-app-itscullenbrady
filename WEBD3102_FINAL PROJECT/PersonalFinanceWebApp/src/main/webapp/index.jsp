<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                max-width: 650px; margin: 2em auto; background: #ffffffcc;
                border-radius: 8px; padding: 2em;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            h2 { color: #b6a685; }
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
            <a href="transactions">All Transactions</a>
            <a href="recurring">Recurring Items</a>
            <a href="budgets">Budgets</a>
            <a href="investments">Investments</a>
        </nav>
    </header>
    <div class="container">
        <h2>Add a Transaction</h2>
        <form action="transactions" method="post">
            <label for="type">Type</label>
            <select name="type" id="type">
                <option value="Income">Income</option>
                <option value="Expense">Expense</option>
            </select>
            <label for="category">Category</label>
            <input type="text" id="category" name="category" required/>
            <label for="amount">Amount</label>
            <input type="number" step="0.01" id="amount" name="amount" required/>
            <label for="note">Note</label>
            <input type="text" id="note" name="note"/>
            <label for="tags">Tags</label>
            <input type="text" id="tags" name="tags"/>
            <button type="submit">Save</button>
        </form>
        <button type="button" onclick="location.href='reset'">Reset All Data</button>
    </div>
    </body>
    </html>