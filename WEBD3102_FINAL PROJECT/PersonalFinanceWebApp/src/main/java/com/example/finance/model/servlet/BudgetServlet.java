package com.example.finance.model.servlet;

            import com.example.finance.model.Budget;
            import com.example.finance.model.util.FileStorageUtil;
            import jakarta.servlet.ServletException;
            import jakarta.servlet.annotation.WebServlet;
            import jakarta.servlet.http.*;
            import java.io.IOException;
            import java.util.ArrayList;
            import java.util.List;

            @WebServlet(name = "BudgetServlet", urlPatterns = {"/budgets"})
            public class BudgetServlet extends HttpServlet {
                private static final List<Budget> budgets = new ArrayList<>();

                @Override
                public void init() throws ServletException {
                    super.init();
                    try {
                        List<Budget> loadedBudgets = FileStorageUtil.loadBudgets();
                        if (loadedBudgets != null) {
                            budgets.addAll(loadedBudgets);
                        }
                    } catch (IOException e) {
                        throw new ServletException("Failed to load budgets", e);
                    }
                }

                @Override
                protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                    request.setAttribute("budgets", budgets);
                    request.getRequestDispatcher("budgets.jsp").forward(request, response);
                }

                @Override
                protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                    String category = request.getParameter("category");
                    String limitStr = request.getParameter("limit");

                    double limit = 0.0;
                    if (limitStr != null && !limitStr.isEmpty()) {
                        limit = Double.parseDouble(limitStr);
                    }
                    budgets.add(new Budget(category, limit));
                    FileStorageUtil.saveBudgets(budgets);
                    response.sendRedirect("budgets");
                }

                public static List<Budget> getBudgets() {
                    return budgets;
                }
            }