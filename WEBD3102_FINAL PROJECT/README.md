# Personal Finance Web Application

## Overview
The Personal Finance Web Application is a simple, self-contained tool designed for tracking personal financial transactions, budgets, investments, and recurring transactions. The application is locally hosted and does not include authentication or multi-user support. It is designed primarily for individual use and educational purposes.

## Target Audience
The primary audience for this application is the course professor, who will review it from both a developer and system administrator perspective. The application demonstrates key software development concepts, including:
- Web application structure using Java Servlets and JSP.
- File-based storage persistence with JSON.
- Basic exception handling for error management.

## Hosting and Security
- **Local Hosting:** The application runs on a local server (e.g., Apache Tomcat) and is not designed for remote or shared access.
- **Security Considerations:** Since the application is single-user and runs in a self-contained environment, security features like authentication and encryption are not implemented.

## Data Storage & Persistence
### Previous Approach
Initially, data was stored in static lists within Servlet classes. This meant that all transactions, budgets, investments, and recurring transactions were only available in memory and lost once the application was stopped or restarted.

### Current Approach: File-Based Storage
To ensure data persistence across application restarts, JSON files are used to store financial data. The **FileStorageUtil** class handles reading and writing data to JSON files using the Jackson library.

#### FileStorageUtil.java
The `FileStorageUtil` class provides utility methods to store and retrieve financial data. It ensures data is persisted across application sessions and reloads it upon startup.

**Key Methods:**
- `saveInvestments(List<Investment> investments)`: Saves investments to a JSON file.
- `loadInvestments()`: Loads investments from a JSON file.
- `saveBudgets(List<Budget> budgets)`: Saves budgets to a JSON file.
- `loadBudgets()`: Loads budgets from a JSON file.
- `saveTransactions(List<Transaction> transactions)`: Saves transactions to a JSON file.
- `loadTransactions()`: Loads transactions from a JSON file.
- `saveRecurringTransactions(List<RecurringTransaction> recurringTransactions)`: Saves recurring transactions to a JSON file.
- `loadRecurringTransactions()`: Loads recurring transactions from a JSON file.

**Comparison to Alternative Storage Methods:**
| Storage Method | Description | Advantages | Disadvantages |
|--------------|-------------|-------------|--------------|
| In-Memory (Initial Approach) | Data stored in static lists within Servlets. | Simple and fast. | Data lost on restart. |
| File-Based (Current Approach) | Data stored in JSON files using Jackson. | Data persists across restarts. | Parsing overhead; potential file corruption. |
| Database (Alternative) | Data stored in a relational (MySQL) or NoSQL (MongoDB) database. | Scalable, efficient queries. | Requires database setup and maintenance. |

### Data Reset Functionality
To allow users to clear all stored financial data, the application includes a reset feature implemented via the `ResetServlet` class.

#### ResetServlet.java
The `ResetServlet` class deletes all JSON files from the storage directory and invalidates the session to remove session-specific data.

**Key Functionality:**
- Deletes all JSON files located in `PersonalFinanceWebApp/json/files/`.
- Invalidates the current session.
- Redirects the user to `index.jsp` after reset.

## Application Structure
The application follows a structured MVC-like approach with the following main components:

### Servlets
Servlets handle requests, process data, and communicate with the file storage utility.
- **TransactionServlet.java:** Handles transactions (add, retrieve, display).
- **InvestmentServlet.java:** Manages investment records.
- **BudgetServlet.java:** Stores budget information.
- **RecurringServlet.java:** Handles recurring transactions.
- **ResetServlet.java:** Resets all stored financial data.

### JSP Pages
The JSP pages provide the user interface and interact with the servlets.
- `index.jsp`: Home page.
- `viewTransactions.jsp`: Displays transactions.
- `investments.jsp`: Shows investment details.
- `budgets.jsp`: Displays budgets.
- `recurring.jsp`: Lists recurring transactions.

## Error Handling
The application includes basic exception handling using standard Java try-catch blocks. Exceptions are caught and logged to prevent crashes, ensuring a smooth user experience.

## Testing
- Currently, the application does not include automated unit tests.
- Manual testing is performed by interacting with the web interface and verifying data persistence across restarts.

## Future Enhancements
While the current implementation meets the project's requirements, potential improvements include:
- Implementing a relational database for better scalability.
- Adding authentication and multi-user support.
- Enhancing the UI for improved user experience.

## Conclusion
This personal finance application demonstrates core web development concepts, including servlet-based request handling, JSON-based data persistence, and session management. While simple, it effectively tracks financial data and persists it using file-based storage.

---
