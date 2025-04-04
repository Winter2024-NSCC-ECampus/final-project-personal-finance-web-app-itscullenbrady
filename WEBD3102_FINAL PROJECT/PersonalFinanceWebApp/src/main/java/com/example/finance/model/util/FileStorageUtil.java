package com.example.finance.model.util;

        import com.example.finance.model.Budget;
        import com.example.finance.model.Investment;
        import com.example.finance.model.Transaction;
        import com.example.finance.model.RecurringTransaction;
        import com.fasterxml.jackson.databind.ObjectMapper;

        import java.io.File;
        import java.io.IOException;
        import java.util.List;

        public class FileStorageUtil {
            private static final String JSON_DIRECTORY = "PersonalFinanceWebApp/json/files/";
            private static final String INVESTMENTS_FILE_PATH = JSON_DIRECTORY + "investments.json";
            private static final String BUDGETS_FILE_PATH = JSON_DIRECTORY + "budgets.json";
            private static final String TRANSACTIONS_FILE_PATH = JSON_DIRECTORY + "transactions.json";
            private static final String RECURRING_TRANSACTIONS_FILE_PATH = JSON_DIRECTORY + "recurring_transactions.json";
            private static final ObjectMapper objectMapper = new ObjectMapper();

            private static File getFile(String filePath) {
                File file = new File(filePath);
                File parentDir = file.getParentFile();
                if (!parentDir.exists()) {
                    parentDir.mkdirs();
                }
                return file;
            }

            public static void saveInvestments(List<Investment> investments) throws IOException {
                objectMapper.writeValue(getFile(INVESTMENTS_FILE_PATH), investments);
            }

            public static List<Investment> loadInvestments() throws IOException {
                File file = getFile(INVESTMENTS_FILE_PATH);
                if (file.exists()) {
                    return objectMapper.readValue(file, objectMapper.getTypeFactory().constructCollectionType(List.class, Investment.class));
                } else {
                    return null;
                }
            }

            public static void saveBudgets(List<Budget> budgets) throws IOException {
                objectMapper.writeValue(getFile(BUDGETS_FILE_PATH), budgets);
            }

            public static List<Budget> loadBudgets() throws IOException {
                File file = getFile(BUDGETS_FILE_PATH);
                if (file.exists()) {
                    return objectMapper.readValue(file, objectMapper.getTypeFactory().constructCollectionType(List.class, Budget.class));
                } else {
                    return null;
                }
            }

            public static void saveTransactions(List<Transaction> transactions) throws IOException {
                objectMapper.writeValue(getFile(TRANSACTIONS_FILE_PATH), transactions);
            }

            public static List<Transaction> loadTransactions() throws IOException {
                File file = getFile(TRANSACTIONS_FILE_PATH);
                if (file.exists()) {
                    return objectMapper.readValue(file, objectMapper.getTypeFactory().constructCollectionType(List.class, Transaction.class));
                } else {
                    return null;
                }
            }

            public static void saveRecurringTransactions(List<RecurringTransaction> recurringTransactions) throws IOException {
                objectMapper.writeValue(getFile(RECURRING_TRANSACTIONS_FILE_PATH), recurringTransactions);
            }

            public static List<RecurringTransaction> loadRecurringTransactions() throws IOException {
                File file = getFile(RECURRING_TRANSACTIONS_FILE_PATH);
                if (file.exists()) {
                    return objectMapper.readValue(file, objectMapper.getTypeFactory().constructCollectionType(List.class, RecurringTransaction.class));
                } else {
                    return null;
                }
            }
        }