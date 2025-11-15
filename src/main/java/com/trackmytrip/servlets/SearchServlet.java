package com.trackmytrip.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // بيانات الاتصال بقاعدة البيانات (عدليها حسب إعداداتك)
    private static final String URL  = "jdbc:mysql://localhost:3306/train_booking?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ترميز عربي
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // قراءة القيم من الفورم
        String from  = request.getParameter("from");
        String to    = request.getParameter("to");
        String date  = request.getParameter("date");
        String qtySt = request.getParameter("qty");

        // التحقق من أن كل الحقول معبّأة
        if (isNullOrEmpty(from) || isNullOrEmpty(to) ||
            isNullOrEmpty(date) || isNullOrEmpty(qtySt)) {

            request.setAttribute("error",
                    "الرجاء إدخال جميع بيانات البحث (محطة المغادرة، محطة الوصول، التاريخ، وعدد الركاب).");
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        // التحقق من صحة عدد الركاب
        int qty;
        try {
            qty = Integer.parseInt(qtySt);
            if (qty <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException ex) {
            request.setAttribute("error", "عدد الركاب غير صحيح. الرجاء إدخال رقم موجب.");
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        // TODO: هنا لاحقاً تضيفين كود الاتصال بقاعدة البيانات وجلب الرحلات
        // مؤقتاً سنعيد نفس صفحة البحث مع رسالة نجاح بسيطة

        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("date", date);
        request.setAttribute("qty", qty);
        request.setAttribute("success", "تم استقبال طلب البحث بنجاح (backend تجريبي، بدون ربط بقاعدة البيانات بعد).");

        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    private boolean isNullOrEmpty(String s) {
        return s == null || s.trim().isEmpty();
    }
}



