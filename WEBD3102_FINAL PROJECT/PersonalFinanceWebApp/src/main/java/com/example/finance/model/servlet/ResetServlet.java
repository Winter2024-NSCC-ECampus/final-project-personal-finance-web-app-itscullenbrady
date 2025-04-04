package com.example.finance.model.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/reset")
public class ResetServlet extends HttpServlet {
    private static final String JSON_DIRECTORY = "PersonalFinanceWebApp/json/files/";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        File directory = new File(JSON_DIRECTORY);
        if (directory.exists() && directory.isDirectory()) {
            for (File file : directory.listFiles()) {
                if (file.isFile() && file.getName().endsWith(".json")) {
                    file.delete();
                }
            }
        }

        // Refresh system memory (e.g., clear session attributes)
        request.getSession().invalidate();

        // Redirect back to the index page
        response.sendRedirect("index.jsp");
    }
}