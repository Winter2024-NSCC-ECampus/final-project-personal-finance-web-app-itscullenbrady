package com.example.finance.model.servlet;

                import com.example.finance.model.Transaction;
                import com.example.finance.model.Budget;
                import com.example.finance.model.util.FileStorageUtil;
                import jakarta.servlet.ServletException;
                import jakarta.servlet.annotation.WebServlet;
                import jakarta.servlet.http.*;
                import java.io.IOException;
                import java.util.ArrayList;
                import java.util.List;

                @WebServlet(name = "TransactionServlet", urlPatterns = {"/transactions"})
                public class TransactionServlet extends HttpServlet {
                    private static final List<Transaction> transactions = new ArrayList<>();
                    private static final List<Budget> budgets = BudgetServlet.getBudgets();

                    @Override
                    public void init() throws ServletException {
                        super.init();
                        try {
                            List<Transaction> loadedTransactions = FileStorageUtil.loadTransactions();
                            if (loadedTransactions != null) {
                                transactions.addAll(loadedTransactions);
                            }
                        } catch (IOException e) {
                            throw new ServletException("Failed to load transactions", e);
                        }
                    }

                    @Override
                    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException {
                        request.setAttribute("transactions", transactions);
                        request.getRequestDispatcher("viewTransactions.jsp").forward(request, response);
                    }

                    @Override
                    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException {
                        String type = request.getParameter("type");
                        String category = request.getParameter("category");
                        String amountStr = request.getParameter("amount");
                        String note = request.getParameter("note");
                        String tags = request.getParameter("tags");

                        double amount = 0.0;
                        if (amountStr != null && !amountStr.isEmpty()) {
                            amount = Double.parseDouble(amountStr);
                        }
                        Transaction t = new Transaction(type, category, amount, note, tags);
                        transactions.add(t);

                        if ("Expense".equalsIgnoreCase(type)) {
                            for (Budget b : budgets) {
                                if (b.getCategory().equalsIgnoreCase(category)) {
                                    b.addSpending(amount);
                                }
                            }
                        }
                        FileStorageUtil.saveTransactions(transactions);
                        response.sendRedirect("transactions");
                    }

                    public static List<Transaction> getTransactions() {
                        return transactions;
                    }
                }