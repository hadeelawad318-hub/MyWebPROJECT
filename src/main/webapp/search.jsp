<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>TrackMyTrip | Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <!-- نفس ملف التصميم المستخدم في الهوم -->
  <link rel="stylesheet" href="style.css">

  <style>
    /* تخصيص بسيط لصفحة البحث فوق style.css */

    .search-hero {
      position: relative;
      z-index: 2;
      text-align: center;
      top: 10%;
      width: 100%;
      padding: 0 20px 40px;
    }

    .search-hero-title {
      font-size: 40px;
      font-weight: 700;
    }

    .search-hero-text {
      margin-top: 8px;
      font-size: 16px;
      color: #ddd;
    }

    .search-box h2 {
      font-size: 20px;
      margin-bottom: 10px;
      color: #111827;
    }

    .search-box .search-subtitle {
      margin: 0 0 18px;
      font-size: 14px;
      color: #6b7280;
    }

    .alert {
      padding: 10px 14px;
      border-radius: 10px;
      margin-bottom: 14px;
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

    form {
      margin-top: 4px;
    }

    .form-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 16px;
    }

    .field {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    .field label {
      font-size: 14px;
      color: #374151;
      font-weight: 500;
    }

    .field select,
    .field input[type="date"],
    .field input[type="number"] {
      padding: 9px 10px;
      border-radius: 10px;
      border: 1px solid #d1d5db;
      font-size: 14px;
      outline: none;
      font-family: inherit;
    }

    .field select:focus,
    .field input[type="date"]:focus,
    .field input[type="number"]:focus {
      border-color: #83bfff;
      box-shadow: 0 0 0 2px rgba(131,191,255,.3);
    }

    .field input[type="date"] {
      direction: ltr;
      text-align: left;
    }

    .search-actions {
      margin-top: 18px;
      display: flex;
      justify-content: flex-end;
    }

    .btn-search {
      border: none;
      background: #83bfff;
      color: #000;
      padding: 10px 26px;
      border-radius: 999px;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      box-shadow: 0 3px 10px rgba(0,0,0,.25);
    }

    .btn-search:hover {
      opacity: .92;
    }

    @media (max-width: 768px) {
      .search-hero {
        top: 8%;
      }
      .search-box {
        width: 90%;
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>

<%
  String error   = (String) request.getAttribute("error");
  String success = (String) request.getAttribute("success");

  String fromVal = (String) request.getAttribute("from");
  String toVal   = (String) request.getAttribute("to");
  String dateVal = (String) request.getAttribute("date");
  Object qtyObj  = request.getAttribute("qty");
  String qtyVal  = (qtyObj != null) ? String.valueOf(qtyObj) : "";
%>

<!-- ===== Navbar (نفس الهوم + كلاس للغة) ===== -->
<nav>
  <div class="logo">TrackMyTrip</div>

  <div class="top-links">
    <a href="home.html" class="nav-home">Home</a>
    <a href="book.html" class="nav-book">Book</a>
    <a href="my_bookings_design.html" class="nav-bookings">My Bookings</a>
    <a href="support.html" class="nav-support">Support</a>
  </div>

  <div class="auth-buttons">
    <button class="login" type="button">Login</button>
    <button class="signup" type="button">Sign Up</button>
    <button class="language-toggle" type="button">
      <i class="fa-solid fa-globe"></i>
    </button>
  </div>
</nav>

<!-- ===== Hero + Search Box ===== -->
<div class="search-hero">
  <h1 class="search-hero-title">Search for a trip</h1>
  <p class="search-hero-text">
    Choose departure and arrival stations, date, and passengers to find your train.
  </p>

  <div class="search-box">
    <h2 class="search-box-title">Trip search details</h2>
    <p class="search-subtitle">Fill in the fields below, then click "Search trains".</p>

    <% if (error != null) { %>
      <div class="alert alert-error"><%= error %></div>
    <% } else if (success != null) { %>
      <div class="alert alert-success"><%= success %></div>
    <% } %>

    <!-- الفورم متصل مع SearchServlet (@WebServlet("/search")) -->
    <form action="search" method="get">
      <div class="form-grid">

        <!-- From -->
        <div class="field">
          <label for="from" class="label-from">From (departure station)</label>
          <select id="from" name="from">
            <option value="">-- Select departure --</option>
            <option value="Riyadh"  <%= "Riyadh".equals(fromVal)  ? "selected" : "" %>>Riyadh</option>
            <option value="Jeddah"  <%= "Jeddah".equals(fromVal)  ? "selected" : "" %>>Jeddah</option>
            <option value="Dammam"  <%= "Dammam".equals(fromVal)  ? "selected" : "" %>>Dammam</option>
            <option value="Madinah" <%= "Madinah".equals(fromVal) ? "selected" : "" %>>Madinah</option>
          </select>
        </div>

        <!-- To -->
        <div class="field">
          <label for="to" class="label-to">To (arrival station)</label>
          <select id="to" name="to">
            <option value="">-- Select arrival --</option>
            <option value="Riyadh"  <%= "Riyadh".equals(toVal)  ? "selected" : "" %>>Riyadh</option>
            <option value="Jeddah"  <%= "Jeddah".equals(toVal)  ? "selected" : "" %>>Jeddah</option>
            <option value="Dammam"  <%= "Dammam".equals(toVal)  ? "selected" : "" %>>Dammam</option>
            <option value="Madinah" <%= "Madinah".equals(toVal) ? "selected" : "" %>>Madinah</option>
          </select>
        </div>

        <!-- Date -->
        <div class="field">
          <label for="date" class="label-date">Travel date</label>
          <input
            type="date"
            id="date"
            name="date"
            value="<%= (dateVal != null ? dateVal : "") %>"
            placeholder="YYYY-MM-DD"
            pattern="\\d{4}-\\d{2}-\\d{2}"
            inputmode="numeric"
            lang="en">
        </div>

        <!-- Passengers -->
        <div class="field">
          <label for="qty" class="label-qty">Passengers</label>
          <input
            type="number"
            id="qty"
            name="qty"
            min="1"
            max="9"
            value="<%= (!qtyVal.isEmpty() ? qtyVal : "1") %>"
            lang="en"
            inputmode="numeric">
        </div>

      </div>

      <div class="search-actions">
        <button type="submit" class="btn-search search-btn-text">
          Search trains
        </button>
      </div>
    </form>
  </div>
</div>

<!-- نفس ملف الجافاسكربت حق الهوم (زر اللغة والمودالات) -->
<script src="main.js"></script>
</body>
</html>






