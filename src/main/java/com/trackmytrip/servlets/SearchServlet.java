package com.trackmytrip.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    // عدّلي معلومات الاتصال حسب قاعدة بياناتك
    private static final String URL  =
            "jdbc:mysql://localhost:3306/train_booking?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";      // اسم المستخدم في MySQL
    private static final String PASS = "password";  // كلمة المرور في MySQL

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String from  = request.getParameter("from");
        String to    = request.getParameter("to");
        String date  = request.getParameter("date");
        String qtySt = request.getParameter("qty");

        // تحقق بسيط من المدخلات
        if (from == null || to == null || date == null || qtySt == null ||
            from.isEmpty() || to.isEmpty() || date.isEmpty()) {

            request.setAttribute("error", "الرجاء إدخال جميع بيانات البحث.");
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        int qty;
        try {
            qty = Integer.parseInt(qtySt);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "عدد الركّاب غير صحيح.");
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        StringBuilder rows = new StringBuilder();
        int count = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // تحميل درايفر MySQL (يتطلب وجود mysql-connector-j في WEB-INF/lib)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);

            String sql =
                "SELECT id, from_code, to_code, depart_time, arrive_time, class, price, available_seats " +
                "FROM trips " +
                "WHERE from_code = ? AND to_code = ? AND travel_date = ? AND available_seats >= ? " +
                "ORDER BY depart_time";

            ps = conn.prepareStatement(sql);
            ps.setString(1, from);
            ps.setString(2, to);
            ps.setString(3, date);   // لو نوع العمود DATE هذا يكفي
            ps.setInt(4, qty);

            rs = ps.executeQuery();

            while (rs.next()) {
                count++;

                int id             = rs.getInt("id");
                String fromCode    = rs.getString("from_code");
                String toCode      = rs.getString("to_code");
                String departTime  = rs.getString("depart_time");
                String arriveTime  = rs.getString("arrive_time");
                String seatClass   = rs.getString("class");
                double price       = rs.getDouble("price");
                int availableSeats = rs.getInt("available_seats");

                // نبني صف HTML للجدول
                rows.append("<tr>");
                rows.append("<td>").append(fromCode).append("</td>");
                rows.append("<td>").append(toCode).append("</td>");
                rows.append("<td>").append(departTime).append("</td>");
                rows.append("<td>").append(arriveTime).append("</td>");
                rows.append("<td>").append(seatClass).append("</td>");
                rows.append("<td>").append(price).append("</td>");
                rows.append("<td>").append(availableSeats).append("</td>");
                rows.append("<td>")
                        .append("<form action='select' method='post'>")
                        .append("<input type='hidden' name='tripId' value='").append(id).append("'>")
                        .append("<input type='hidden' name='qty' value='").append(qty).append("'>")
                        .append("<button type='submit'>اختيار</button>")
                        .append("</form>")
                        .append("</td>");
                rows.append("</tr>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "حدث خطأ أثناء الاتصال بقاعدة البيانات.");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }

        // إرسال النتائج إلى صفحة JSP
        request.setAttribute("rowHtml", rows.toString());
        request.setAttribute("count", count);
        request.setAttribute("qty", qty);

        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}


