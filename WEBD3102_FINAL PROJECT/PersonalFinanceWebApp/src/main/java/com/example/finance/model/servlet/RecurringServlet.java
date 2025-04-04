package com.example.finance.model.servlet;

    import com.example.finance.model.RecurringTransaction;
    import com.example.finance.model.util.FileStorageUtil;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.*;
    import java.io.IOException;
    import java.util.ArrayList;
    import java.util.List;

    @WebServlet(name = "RecurringServlet", urlPatterns = {"/recurring"})
    public class RecurringServlet extends HttpServlet {
        private static final List<RecurringTransaction> recurringList = new ArrayList<>();

        @Override
        public void init() throws ServletException {
            super.init();
            try {
                List<RecurringTransaction> loadedRecurringTransactions = FileStorageUtil.loadRecurringTransactions();
                if (loadedRecurringTransactions != null) {
                    recurringList.addAll(loadedRecurringTransactions);
                }
            } catch (IOException e) {
                throw new ServletException("Failed to load recurring transactions", e);
            }
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            request.setAttribute("recurringList", recurringList);
            request.getRequestDispatcher("recurring.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String type = request.getParameter("type");
            String category = request.getParameter("category");
            String amountStr = request.getParameter("amount");
            String note = request.getParameter("note");
            String freq = request.getParameter("frequency");

            double amount = 0.0;
            if (amountStr != null && !amountStr.isEmpty()) {
                amount = Double.parseDouble(amountStr);
            }
            RecurringTransaction rt = new RecurringTransaction(type, category, amount, note, freq);
            recurringList.add(rt);

            FileStorageUtil.saveRecurringTransactions(recurringList);
            response.sendRedirect("recurring");
        }

        public static List<RecurringTransaction> getRecurringTransactions() {
            return recurringList;
        }
    }