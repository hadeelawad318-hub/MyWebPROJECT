<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>TrackMyTrip | Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f5f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 60px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
        }

        p.subtitle {
            text-align: center;
            color: #555;
            margin-bottom: 25px;
        }

        .error {
            background: #ffe5e5;
            color: #b00020;
            border: 1px solid #ffb3b3;
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 14px;
            margin-bottom: 4px;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            padding: 8px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            background: #0069d9;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background: #0053ae;
        }

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            text-decoration: none;
            color: #0069d9;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Search Trips</h1>
    <p class="subtitle">ابحث عن رحلتك بين مدن المملكة</p>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="error">
        <%= error %>
    </div>
    <% } %>

    <!-- form يرسل البيانات إلى السيرفلت /search -->
    <form action="search" method="get">
        <div class="form-row">
            <div class="form-group">
                <label for="from">From (Departure)</label>
                <select id="from" name="from">
                    <option value="">-- اختر محطة المغادرة --</option>
                    <option value="Riyadh">Riyadh</option>
                    <option value="Jeddah">Jeddah</option>
                    <option value="Dammam">Dammam</option>
                    <option value="Madinah">Madinah</option>
                </select>
            </div>

            <div class="form-group">
                <label for="to">To (Arrival)</label>
                <select id="to" name="to">
                    <option value="">-- اختر محطة الوصول --</option>
                    <option value="Riyadh">Riyadh</option>
                    <option value="Jeddah">Jeddah</option>
                    <option value="Dammam">Dammam</option>
                    <option value="Madinah">Madinah</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="date">Travel Date</label>
                <input type="date" id="date" name="date">
            </div>

            <div class="form-group">
                <label for="qty">Passengers</label>
                <input type="number" id="qty" name="qty" min="1" max="9" value="1">
            </div>
        </div>

        <button type="submit">Search</button>
    </form>

    <div class="back-link">
        <!-- لاحقاً تقدرون تربطونه بصفحة Home الرئيسية -->
     <a href="home.html">← Back to Home</a>
    </div>
</div>

</body>
</html>
