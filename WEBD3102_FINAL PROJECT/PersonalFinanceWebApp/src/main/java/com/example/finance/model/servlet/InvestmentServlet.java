package com.example.finance.model.servlet;

            import com.example.finance.model.Investment;
            import com.example.finance.model.util.FileStorageUtil;
            import jakarta.servlet.ServletException;
            import jakarta.servlet.annotation.WebServlet;
            import jakarta.servlet.http.*;
            import java.io.IOException;
            import java.util.ArrayList;
            import java.util.List;

            @WebServlet(name = "InvestmentServlet", urlPatterns = {"/investments"})
            public class InvestmentServlet extends HttpServlet {
                private static final List<Investment> investments = new ArrayList<>();

                @Override
                public void init() throws ServletException {
                    super.init();
                    try {
                        List<Investment> loadedInvestments = FileStorageUtil.loadInvestments();
                        if (loadedInvestments != null) {
                            investments.addAll(loadedInvestments);
                        }
                    } catch (IOException e) {
                        throw new ServletException("Failed to load investments", e);
                    }
                }

                @Override
                protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                    request.setAttribute("investments", investments);
                    request.getRequestDispatcher("investments.jsp").forward(request, response);
                }

                @Override
                protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                    String name = request.getParameter("name");
                    String type = request.getParameter("type");
                    String amountStr = request.getParameter("amount");

                    double amount = 0.0;
                    if (amountStr != null && !amountStr.isEmpty()) {
                        amount = Double.parseDouble(amountStr);
                    }
                    investments.add(new Investment(name, type, amount));
                    FileStorageUtil.saveInvestments(investments);
                    response.sendRedirect("investments");
                }

                public static List<Investment> getInvestments() {
                    return investments;
                }
            }