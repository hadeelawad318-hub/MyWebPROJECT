<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>TrackMyTrip | Book</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <!-- استخدام نفس ملف الستايل الموحد -->
  <link rel="stylesheet" href="style.css">

  <style>
    /* تخصيصات خاصة بصفحة الحجز فوق style.css */

    .booking-hero {
      position: relative;
      z-index: 2;
      text-align: center;
      top: 10%;
      width: 100%;
      padding: 0 20px 50px;
    }

    .booking-title {
      font-size: 40px;
      font-weight: 700;
    }

    .booking-subtitle {
      margin-top: 8px;
      font-size: 16px;
      color: #e5e7eb;
    }

    .booking-summary {
      margin-top: 10px;
      font-size: 14px;
      color: #e5e7eb;
    }

    .booking-card {
      position: relative;
      z-index: 3;
      background: white;
      color: black;
      width: 90%;
      max-width: 1050px;
      margin: 32px auto 40px;
      padding: 24px 20px 26px;
      border-radius: 16px;
      box-shadow: 0 4px 25px rgba(0, 0, 0, 0.45);
    }

    .booking-card h2 {
      font-size: 20px;
      margin-bottom: 12px;
      color: #111827;
    }

    .booking-card .section-subtitle {
      margin: 0 0 16px;
      font-size: 14px;
      color: #6b7280;
    }

    /* نخلي الترتيب طولي (قسم الرحلات ثم المقاعد تحتها) */
    .booking-layout {
      display: grid;
      grid-template-columns: minmax(0, 1fr); /* عمود واحد */
      gap: 20px;
    }

    /* نموذج التعديل السريع للبحث (٢×٢) */
    .mini-form-grid {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 12px 16px;
      margin-bottom: 8px;
    }

    .field {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .field label {
      font-size: 13px;
      color: #374151;
      font-weight: 500;
    }

    .field select,
    .field input {
      padding: 7px 9px;
      border-radius: 10px;
      border: 1px solid #d1d5db;
      font-size: 13px;
      outline: none;
      font-family: inherit;
    }

    .field select:focus,
    .field input:focus {
      border-color: #83bfff;
      box-shadow: 0 0 0 2px rgba(131,191,255,.3);
    }

    .mini-actions {
      display: flex;
      justify-content: flex-end;
      margin-top: 6px;
      margin-bottom: 10px;
    }

    .btn-apply-search {
      border: none;
      background: #e5f0ff;
      color: #1d4ed8;
      padding: 7px 16px;
      border-radius: 999px;
      font-size: 13px;
      font-weight: 500;
      cursor: pointer;
    }

    .btn-apply-search:hover {
      background: #d0e2ff;
    }

    .divider {
      height: 1px;
      background: #e5e7eb;
      margin: 14px 0;
    }

    /* نتائج الرحلات */
    .results-title {
      font-size: 15px;
      font-weight: 600;
      color: #111827;
      margin-bottom: 8px;
    }

    .results {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .result-card {
      background: #f9fafb;
      border-radius: 14px;
      border: 1px solid #e5e7eb;
      padding: 10px 12px;
      display: flex;
      align-items: center;
      gap: 10px;
      transition: box-shadow 0.15s ease, border-color 0.15s ease, background 0.15s ease;
    }

    .result-icon {
      width: 42px;
      height: 42px;
      border-radius: 12px;
      background: #006b75;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .result-icon i {
      color: #fff;
      font-size: 18px;
    }

    .result-meta {
      flex: 1;
    }

    .result-route {
      font-weight: 600;
      color: #006b75;
      font-size: 14px;
    }

    .result-line {
      font-size: 12px;
      color: #4b5563;
      margin-top: 2px;
    }

    .result-price {
      font-size: 14px;
      font-weight: 600;
      color: #111827;
      margin-right: 6px;
    }

    .btn-select-trip {
      border: none;
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 12px;
      cursor: pointer;
      background: #83bfff;
      color: #000;
      font-weight: 600;
      transition: background 0.15s ease, color 0.15s ease;
    }

    .btn-select-trip:hover {
      opacity: .9;
    }

    .result-card.selected {
      border-color: #1d4ed8;
      box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.18);
      background: #eff6ff;
    }

    .result-card.selected .btn-select-trip {
      background: #1d4ed8;
      color: #ffffff;
    }

    /* قسم اختيار المقعد */
    .seat-section {
      background: #f9fafb;
      border-radius: 14px;
      border: 1px solid #e5e7eb;
      padding: 12px 14px 14px;
    }

    .seat-section-title {
      font-size: 15px;
      font-weight: 600;
      color: #111827;
      margin-bottom: 4px;
    }

    .seat-trip-label {
      font-size: 13px;
      color: #4b5563;
      margin-bottom: 6px;
    }

    .seat-legend {
      font-size: 11px;
      color: #6b7280;
      text-align: center;
      margin-bottom: 6px;
    }

    .seat-price {
      font-size: 12px;
      color: #111827;
      text-align: center;
      margin-bottom: 10px;
    }

    .seat-grid {
      display: grid;
      grid-template-columns: repeat(5, 40px);
      gap: 8px 10px;
      justify-content: center;
      margin-bottom: 10px;
    }

    .seat {
      width: 40px;
      height: 32px;
      border-radius: 8px;
      border: 1px solid #d1d5db;
      font-size: 11px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      background: #ffffff;
      transition: background 0.15s ease, border-color 0.15s ease, color 0.15s ease;
    }

    .seat.aisle {
      visibility: hidden;
      pointer-events: none;
    }

    .seat.selected {
      background: #1d4ed8;
      color: #ffffff;
      border-color: #1d4ed8;
    }

    .seat-selected-label {
      font-size: 13px;
      margin-bottom: 8px;
      color: #111827;
    }

    .seat-selected-label span {
      font-weight: 600;
    }

    .seat-selected-list {
      font-size: 12px;
      color: #4b5563;
      margin-bottom: 8px;
    }

    .btn-confirm {
      border: none;
      background: #16a34a;
      color: #ffffff;
      padding: 8px 16px;
      border-radius: 999px;
      font-size: 13px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      opacity: 0.6;            /* افتراضياً غير مفعّل */
      cursor: not-allowed;
      transition:
        background 0.15s ease,
        box-shadow 0.15s ease,
        transform 0.05s ease,
        opacity 0.15s ease;
    }

    .btn-confirm.ready {
      opacity: 1;
      cursor: pointer;
      box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.22);
    }

    .btn-confirm.ready:hover {
      background: #15803d;
    }

    .btn-confirm.ready:active {
      transform: translateY(1px);
      box-shadow: none;
    }

    @media (max-width: 768px) {
      .booking-hero {
        top: 8%;
      }
      .booking-card {
        width: 92%;
        padding: 20px 14px;
      }
    }
  </style>
</head>
<body>

<%
  String from = (String) request.getAttribute("from");
  String to   = (String) request.getAttribute("to");
  String date = (String) request.getAttribute("date");
  Object qtyObj = request.getAttribute("qty");
  String qty  = (qtyObj != null) ? String.valueOf(qtyObj) : null;

  boolean hasSearch = (from != null && to != null && date != null && qty != null);
%>

<!-- ===== Navbar ===== -->
<nav>
  <div class="logo">TrackMyTrip</div>

  <div class="top-links">
    <a href="home.html" class="nav-home">Home</a>
    <a href="book.jsp" class="nav-book active">Book</a>
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

<!-- ===== Booking Hero ===== -->
<div class="booking-hero">
  <h1 class="booking-title">Book a Train</h1>
  <p class="booking-subtitle">
    Review your trip details, choose a train, and select your seat.
  </p>

  <% if (hasSearch) { %>
    <p class="booking-summary">
      You searched for:
      <strong><%= from %> → <%= to %></strong>,
      date: <strong><%= date %></strong>,
      passengers: <strong><%= qty %></strong>.
    </p>
  <% } %>

  <!-- ===== Booking Card ===== -->
  <div class="booking-card">
    <h2>Trip options</h2>
    <p class="section-subtitle">
      Adjust your search if needed, then choose one of the available trains and pick your seat.
    </p>

    <div class="booking-layout">
      <!-- قسم الرحلات + الميني فورم -->
      <div>
        <!-- نموذج مصغّر لتعديل البحث (٢×٢) -->
        <form action="search" method="get" class="mini-form">
          <div class="mini-form-grid">
            <!-- From -->
            <div class="field">
              <label for="fromStation">From</label>
              <select id="fromStation" name="from">
                <option value="">-- Select departure --</option>
                <option value="Riyadh"  <%= "Riyadh".equals(from)  ? "selected" : "" %>>Riyadh</option>
                <option value="Jeddah"  <%= "Jeddah".equals(from)  ? "selected" : "" %>>Jeddah</option>
                <option value="Dammam"  <%= "Dammam".equals(from)  ? "selected" : "" %>>Dammam</option>
                <option value="Madinah" <%= "Madinah".equals(from) ? "selected" : "" %>>Madinah</option>
              </select>
            </div>

            <!-- To -->
            <div class="field">
              <label for="toStation">To</label>
              <select id="toStation" name="to">
                <option value="">-- Select arrival --</option>
                <option value="Riyadh"  <%= "Riyadh".equals(to)  ? "selected" : "" %>>Riyadh</option>
                <option value="Jeddah"  <%= "Jeddah".equals(to)  ? "selected" : "" %>>Jeddah</option>
                <option value="Dammam"  <%= "Dammam".equals(to)  ? "selected" : "" %>>Dammam</option>
                <option value="Madinah" <%= "Madinah".equals(to) ? "selected" : "" %>>Madinah</option>
              </select>
            </div>

            <!-- Date -->
            <div class="field">
              <label for="travelDate">Date</label>
              <input type="date"
                     id="travelDate"
                     name="date"
                     value="<%= (date != null ? date : "") %>">
            </div>

            <!-- Passengers -->
            <div class="field">
              <label for="passengers">Passengers</label>
              <input type="number"
                     id="passengers"
                     name="qty"
                     min="1"
                     value="<%= (qty != null ? qty : "1") %>">
            </div>
          </div>

          <div class="mini-actions">
            <button type="submit" class="btn-apply-search">
              Apply changes
            </button>
          </div>
        </form>

        <div class="divider"></div>

        <div class="results-title">Available trains</div>


<% if (hasSearch) { %>
  <div class="results">
    <!-- result 1 -->
    <div class="result-card"
         data-from="<%= from %>"
         data-to="<%= to %>"
         data-dep="08:10 AM"
         data-arr="01:55 PM"
         data-class="Economy"
         data-price="180">
      <div class="result-icon">
        <i class="fa-solid fa-train-subway"></i>
      </div>
      <div class="result-meta">
        <div class="result-route">
          <%= from %> → <%= to %>
        </div>
        <div class="result-line">
          08:10 AM – 01:55 PM · SAR 180 · Economy
        </div>
      </div>
      <span class="result-price">SAR 180</span>
      <button class="btn-select-trip" type="button">
        Choose
      </button>
    </div>

    <!-- result 2 -->
    <div class="result-card"
         data-from="<%= from %>"
         data-to="<%= to %>"
         data-dep="01:20 PM"
         data-arr="06:00 PM"
         data-class="Business"
         data-price="220">
      <div class="result-icon">
        <i class="fa-solid fa-train-subway"></i>
      </div>
      <div class="result-meta">
        <div class="result-route">
          <%= from %> → <%= to %>
        </div>
        <div class="result-line">
          01:20 PM – 06:00 PM · SAR 220 · Business
        </div>
      </div>
      <span class="result-price">SAR 220</span>
      <button class="btn-select-trip" type="button">
        Choose
      </button>
    </div>
  </div>
<% } else { %>
  <p style="font-size:13px; color:#6b7280; margin-top:4px;">
    No trips to show yet. Please search for a trip first.
  </p>
<% } %>

      </div>

      <!-- عمود / قسم المقاعد: يظهر فقط إذا فيه بحث -->
      <% if (hasSearch) { %>
      <div class="seat-section" id="seatSection">
        <div class="seat-section-title">Seat selection</div>
        <p class="seat-trip-label" id="seatTripLabel">
          Select a train from the left to choose your seats.
        </p>

        <div class="seat-legend">
          Click on seats to select them. You must select seats for all passengers.
        </div>

        <p class="seat-price" id="seatPriceInfo">
          Select a train to see the price.
        </p>

        <!-- شبكة المقاعد (تشبه مقصورة القطار) -->
        <div class="seat-grid" id="seatGrid">
          <!-- Row 1 -->
          <button class="seat" data-seat="1A">1A</button>
          <button class="seat" data-seat="1B">1B</button>
          <div class="seat aisle"></div>
          <button class="seat" data-seat="1C">1C</button>
          <button class="seat" data-seat="1D">1D</button>

          <!-- Row 2 -->
          <button class="seat" data-seat="2A">2A</button>
          <button class="seat" data-seat="2B">2B</button>
          <div class="seat aisle"></div>
          <button class="seat" data-seat="2C">2C</button>
          <button class="seat" data-seat="2D">2D</button>

          <!-- Row 3 -->
          <button class="seat" data-seat="3A">3A</button>
          <button class="seat" data-seat="3B">3B</button>
          <div class="seat aisle"></div>
          <button class="seat" data-seat="3C">3C</button>
          <button class="seat" data-seat="3D">3D</button>

          <!-- Row 4 -->
          <button class="seat" data-seat="4A">4A</button>
          <button class="seat" data-seat="4B">4B</button>
          <div class="seat aisle"></div>
          <button class="seat" data-seat="4C">4C</button>
          <button class="seat" data-seat="4D">4D</button>
        </div>

        <p class="seat-selected-label">
          Selected seats:
          <span id="selectedSeatsCount">0</span> /
          <span id="totalPassengers"><%= (qty != null ? qty : "1") %></span>
        </p>

        <p class="seat-selected-list">
          Seats: <span id="selectedSeatsList">None</span>
        </p>

        <button type="button" class="btn-confirm" id="confirmBookingBtn">
          <i class="fa-solid fa-ticket"></i>
         Review and payment
        </button>
      </div>
      <% } %>
    </div> <!-- نهاية booking-layout -->
  </div>   <!-- نهاية booking-card -->
</div>     <!-- نهاية booking-hero -->

<script>
// قيم البحث القادمة من السيرفلت
const initialFrom = "<%= (from != null ? from : "") %>";
const initialTo   = "<%= (to   != null ? to   : "") %>";
const initialDate = "<%= (date != null ? date : "") %>";
const initialQty  = "<%= (qty  != null ? qty  : "1") %>";

let selectedTrain = null;
let selectedSeats = [];

// موجود دائماً لأن الميني فورم ظاهر دائماً
const passengersInput = document.getElementById("passengers");
let passengersCount   = parseInt(passengersInput.value || initialQty || "1", 10);

// هل قسم المقاعد موجود في الصفحة (يعني فيه بحث)؟
const hasSeatsSection = !!document.getElementById("seatSection");

if (hasSeatsSection) {
  const totalPassengersSpan    = document.getElementById("totalPassengers");
  const selectedSeatsCountSpan = document.getElementById("selectedSeatsCount");
  const selectedSeatsListSpan  = document.getElementById("selectedSeatsList");
  const seatTripLabel          = document.getElementById("seatTripLabel");
  const seatPriceInfo          = document.getElementById("seatPriceInfo");
  const confirmBtn             = document.getElementById("confirmBookingBtn");

  // تحديث حالة زر التأكيد (مفعّل / غير مفعّل)
  const updateConfirmState = () => {
    const ready =
      selectedTrain &&
      passengersCount > 0 &&
      selectedSeats.length === passengersCount;

    confirmBtn.disabled = !ready;
    confirmBtn.classList.toggle("ready", ready);
  };

  // تحديث سطر السعر (سطر واحد بين العنوان وشبكة المقاعد)
  const updatePriceInfo = () => {
    if (!seatPriceInfo) return;

    if (!selectedTrain) {
      seatPriceInfo.textContent = "Select a train to see the price.";
      return;
    }

    const base = parseFloat(selectedTrain.price);
    if (isNaN(base)) {
      seatPriceInfo.textContent = "Price information is not available.";
      return;
    }

    const seatCount = selectedSeats.length;

    if (seatCount === 0) {
      seatPriceInfo.textContent = "Price per seat: SAR " + base;
      return;
    }

    const total = base * seatCount;
    const seatsWord = (seatCount === 1 ? "seat" : "seats");

    seatPriceInfo.textContent =
      "Total price: SAR " + base + " × " +
      seatCount + " " + seatsWord + " = SAR " + total;
  };

  // تحديث معلومات المقاعد والسعر والزر
  const updateSeatsInfo = () => {
    totalPassengersSpan.textContent    = passengersCount;
    selectedSeatsCountSpan.textContent = selectedSeats.length;
    selectedSeatsListSpan.textContent  =
      selectedSeats.length ? selectedSeats.join(", ") : "None";

    updateConfirmState();
    updatePriceInfo();
  };

  // تحديث عدد الركاب عند التغيير
  passengersInput.addEventListener("change", () => {
    let n = parseInt(passengersInput.value, 10);
    if (Number.isNaN(n) || n <= 0) n = 1;
    passengersCount = n;

    // لو كان المقاعد المختارة أكثر من عدد الركاب، نقصها
    while (selectedSeats.length > passengersCount) {
      const removedSeat = selectedSeats.pop();
      const btn = document.querySelector('.seat[data-seat="' + removedSeat + '"]');
      if (btn) btn.classList.remove("selected");
    }

    updateSeatsInfo();
  });

  updateSeatsInfo(); // أول تشغيل

  // اختيار رحلة من البطاقات
  document.querySelectorAll(".btn-select-trip").forEach(btn => {
    btn.addEventListener("click", () => {
      const card = btn.closest(".result-card");

      selectedTrain = {
        from: card.dataset.from || initialFrom,
        to:   card.dataset.to   || initialTo,
        dep:  card.dataset.dep,
        arr:  card.dataset.arr,
        travelClass: card.dataset.class,
        price: card.dataset.price
      };

      // تظليل الكرت المختار وتحديث نص الزر
      document.querySelectorAll(".result-card").forEach(c => c.classList.remove("selected"));
      document.querySelectorAll(".btn-select-trip").forEach(b => b.textContent = "Choose");

      card.classList.add("selected");
      btn.textContent = "Selected";

      // كل ما نغير الرحلة، نفضي المقاعد المختارة
      selectedSeats = [];
      document.querySelectorAll(".seat.selected").forEach(s => s.classList.remove("selected"));
      updateSeatsInfo();

      // تحديث نص الرحلة في قسم المقاعد
      seatTripLabel.textContent =
        selectedTrain.from + " \u2192 " + selectedTrain.to + " · " +
        selectedTrain.dep + " – " + selectedTrain.arr + " · " +
        selectedTrain.travelClass + " · SAR " + selectedTrain.price;

      // ننزل تلقائيًا لقسم المقاعد
      document.getElementById("seatSection").scrollIntoView({ behavior: "smooth" });
    });
  });

  // اختيار المقاعد (عدة مقاعد = عدد الركاب)
  document.querySelectorAll(".seat").forEach(seatBtn => {
    if (seatBtn.classList.contains("aisle")) return;

    seatBtn.addEventListener("click", () => {
      const seatId = seatBtn.dataset.seat;

      if (seatBtn.classList.contains("selected")) {
        // إلغاء اختيار مقعد
        seatBtn.classList.remove("selected");
        selectedSeats = selectedSeats.filter(s => s !== seatId);
      } else {
        // مقعد جديد
        if (selectedSeats.length >= passengersCount) {
          alert("You already selected seats for all " + passengersCount + " passenger(s).");
          return;
        }
        seatBtn.classList.add("selected");
        selectedSeats.push(seatId);
      }

      updateSeatsInfo();
    });
  });

  // حفظ الحجز في localStorage عند التأكيد
  const addBooking = (booking) => {
    let list = [];
    try {
      list = JSON.parse(localStorage.getItem("trackMyTripBookings") || "[]");
    } catch(e) {
      list = [];
    }
    list.push(booking);
    localStorage.setItem("trackMyTripBookings", JSON.stringify(list));
  };

  confirmBtn.addEventListener("click", () => {
    if (!selectedTrain) {
      alert("Please choose a train first.");
      return;
    }
    if (selectedSeats.length !== passengersCount) {
      alert("Please select " + passengersCount + " seat(s) before confirming.");
      return;
    }

    const dateInput   = document.getElementById("travelDate").value || initialDate;
    const passengersV = passengersInput.value || initialQty;

    const booking = {
      id: "TMP-" + Date.now(),
      date: dateInput,
      status: "confirmed",
      from: selectedTrain.from,
      to: selectedTrain.to,
      dep: selectedTrain.dep,
      arr: selectedTrain.arr,
      seats: selectedSeats.join(", "),
      travelClass: selectedTrain.travelClass,
      coach: "2",
      passengers: passengersV,
      price: "SAR " + selectedTrain.price
    };

    addBooking(booking);

 // بدل ما نقول له راح لماي بوكينق، نقول له راح نراجع الحجز وندفع
 // ولو حابة تقدرين حتى تشيلين الـ alert كامل
 alert("Your seats are selected. Next step: review and payment.");

 // نروح لصفحة تأكيد الحجز والخدمات
 window.location.href = "ConfirmBooking.jsp";

  });
}
</script>

<!-- لو تبون يكون زر اللغة والمودالات اشتغلوا هنا بعدين: -->
<!-- <script src="main.js"></script> -->

</body>
</html>
