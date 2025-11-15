<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>TrackMyTrip | البحث عن الرحلات</title>

    <style>
        /* إعدادات عامة للصفحة */
        * {
            box-sizing: border-box;
            font-variant-numeric: lining-nums; /* نحاول توحيد شكل الأرقام */
        }

        body {
            margin: 0;
            padding: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont,
                         "Segoe UI", "Tahoma", sans-serif;
            background: #f3f5f8;
            direction: rtl;
            text-align: right;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
        }

        .container {
            max-width: 1000px;
            width: 100%;
            background: #ffffff;
            padding: 32px 40px 40px;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(15, 23, 42, 0.10);
        }

        h1 {
            margin: 0 0 8px;
            font-size: 32px;
            text-align: center;
        }

        .subtitle {
            margin: 0 0 24px;
            text-align: center;
            color: #6b7280;
            font-size: 16px;
        }

        /* رسائل الأخطاء / النجاح */
        .alert {
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .alert-error {
            background: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .alert-success {
            background: #ecfdf5;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }

        /* الفورم */
        form {
            margin-top: 8px;
        }

        .form-row {
            display: flex;
            gap: 16px;
            margin-bottom: 16px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 14px;
            margin-bottom: 6px;
            color: #111827;
        }

        select,
        input[type="date"],
        input[type="number"] {
            padding: 10px 12px;
            border-radius: 10px;
            border: 1px solid #d1d5db;
            font-size: 14px;
            background-color: #ffffff;
            color: #111827;
            font-family: inherit;
        }

        select:focus,
        input[type="date"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.25);
        }

        /* نحافظ على زر التقويم، لكن نجعل الأرقام إنجليزية */
        input[type="date"] {
            direction: ltr;         /* ترتيب اليوم/الشهر/السنة */
            text-align: right;      /* الرقم يطلع يمين */
            unicode-bidi: plaintext;
        }

        /* زر البحث */
        .btn-submit {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 999px;
            background: #0069d9;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
            transition: background 0.15s ease, transform 0.05s ease;
        }

        .btn-submit:hover {
            background: #0053ae;
        }

        .btn-submit:active {
            transform: translateY(1px);
        }

        .back-link {
            margin-top: 18px;
            text-align: center;
        }

        .back-link a {
            color: #2563eb;
            text-decoration: none;
            font-size: 15px;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        /* استجابة للشاشات الصغيرة */
        @media (max-width: 768px) {
            .container {
                padding: 24px 18px 28px;
            }

            .form-row {
                flex-direction: column;
            }

            h1 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>

<div class="page-wrapper">
    <div class="container">
        <h1>البحث عن الرحلات</h1>
        <p class="subtitle">ابحث عن رحلتك بين مدن المملكة بسهولة وسرعة</p>

        <%
            String error   = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
        %>

        <% if (error != null) { %>
            <div class="alert alert-error">
                <%= error %>
            </div>
        <% } else if (success != null) { %>
            <div class="alert alert-success">
                <%= success %>
            </div>
        <% } %>

        <!-- نموذج البحث -->
        <form action="search" method="get">

            <!-- من / إلى -->
            <div class="form-row">
                <div class="form-group">
                    <label for="from">من (محطة المغادرة)</label>
                    <select id="from" name="from">
                        <option value="">-- اختر محطة المغادرة --</option>
                        <option value="Riyadh">الرياض</option>
                        <option value="Jeddah">جدة</option>
                        <option value="Dammam">الدمام</option>
                        <option value="Madinah">المدينة المنورة</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="to">إلى (محطة الوصول)</label>
                    <select id="to" name="to">
                        <option value="">-- اختر محطة الوصول --</option>
                        <option value="Riyadh">الرياض</option>
                        <option value="Jeddah">جدة</option>
                        <option value="Dammam">الدمام</option>
                        <option value="Madinah">المدينة المنورة</option>
                    </select>
                </div>
            </div>

            <!-- التاريخ وعدد الركاب -->
       <div class="form-row">
                <div class="form-group">
                    <label for="date">تاريخ السفر</label>
                    <input
                        type="date"
                        id="date"
                        name="date"
                        placeholder="YYYY-MM-DD"
        pattern="\d{4}-\d{2}-\d{2}"
        inputmode="numeric"
        lang="en"
        dir="ltr">
                </div>


                <div class="form-group">
                    <label for="qty">عدد الركاب</label>
                    <input
                        type="number"
                        id="qty"
                        name="qty"
                        min="1"
                        max="9"
                        value="1"
                        lang="en"
                        inputmode="numeric">
                </div>
            </div>

            <button type="submit" class="btn-submit">بحث</button>

            <div class="back-link">
                <!-- عدلي الرابط حسب اسم صفحتكم الرئيسية -->
                <a href="home.html">← الرجوع إلى الصفحة الرئيسية</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>




