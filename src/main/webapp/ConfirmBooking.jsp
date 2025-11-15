<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>TrackMyTrip | Confirm Booking</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <!-- نفس ملف التصميم العام -->
  <link rel="stylesheet" href="style.css">

  <style>
    /* ===== PAGE WRAPPER ===== */
    .confirm-hero {
      position: relative;
      z-index: 2;
      text-align: center;
      top: 10%;
      width: 100%;
      padding: 0 20px 50px;
    }

    .confirm-title {
      font-size: 36px;
      font-weight: 700;
    }

    .confirm-subtitle {
      margin-top: 8px;
      font-size: 15px;
      color: #e5e7eb;
    }

    .confirm-card {
      position: relative;
      z-index: 3;
      background: #ffffff;
      color: #111827;
      width: 90%;
      max-width: 1050px;
      margin: 28px auto 40px;
      padding: 22px 20px 24px;
      border-radius: 16px;
      box-shadow: 0 4px 25px rgba(0,0,0,.45);
    }

    .confirm-grid {
      display: block;          /* بدل grid نخليها بلوك عادي */
    }

    /* مسافة بسيطة بين البلوكات اللي داخل confirm-grid */
    .confirm-grid > * {
      margin-bottom: 18px;
    }


    .section-title {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 8px;
      color: #111827;
    }

    .section-sub {
      font-size: 13px;
      color: #6b7280;
      margin-bottom: 12px;
    }

    .divider {
      height: 1px;
      background: #e5e7eb;
      margin: 16px 0;
    }

    /* ===== Trip Summary + Passenger Details ===== */
    .trip-summary,
    .passenger-section {
      background: #f9fafb;
      border-radius: 14px;
      border: 1px solid #e5e7eb;
      padding: 12px 14px 14px;
      margin-bottom: 14px;
    }

    .trip-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 13px;
      margin-bottom: 6px;
    }

    .trip-row span.label {
      color: #6b7280;
    }

    .trip-row span.value {
      font-weight: 600;
      color: #111827;
    }

    .passenger-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 10px 14px;
      margin-top: 6px;
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

    .field input {
      padding: 8px 9px;
      border-radius: 10px;
      border: 1px solid #d1d5db;
      font-size: 13px;
      outline: none;
      font-family: inherit;
    }

    .field input:focus {
      border-color: #83bfff;
      box-shadow: 0 0 0 2px rgba(131,191,255,.3);
    }

    /* ===== Extras & Payment ===== */
    .extras-payment {
      background: #f9fafb;
      border-radius: 14px;
      border: 1px solid #e5e7eb;
      padding: 12px 14px 14px;
    }

    .extras-group {
      margin-bottom: 12px;
    }

    .extra-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 13px;
      padding: 6px 0;
      border-bottom: 1px dashed #e5e7eb;
    }

    .extra-item:last-child {
      border-bottom: none;
    }

    .extra-left {
      display: flex;
      flex-direction: column;
      gap: 2px;
    }

    .extra-title {
      font-weight: 500;
      color: #111827;
    }

    .extra-desc {
      color: #6b7280;
      font-size: 12px;
    }

    .extra-right {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .extra-right input[type="number"] {
      width: 70px;
      padding: 6px 7px;
      border-radius: 999px;
      border: 1px solid #d1d5db;
      font-size: 12px;
      text-align: center;
    }

    .extra-right input[type="checkbox"] {
      transform: scale(1.1);
      cursor: pointer;
    }

    .extra-price-tag {
      font-size: 12px;
      color: #111827;
      font-weight: 500;
    }

    /* ===== Summary ===== */
    .price-summary {
      background: #eef2ff;
      border-radius: 12px;
      padding: 10px 12px;
      font-size: 13px;
      margin-top: 4px;
      margin-bottom: 14px;
    }

    .price-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 4px;
    }

    .price-row.total {
      font-weight: 700;
      color: #111827;
      border-top: 1px solid #c7d2fe;
      padding-top: 6px;
      margin-top: 4px;
    }

    /* ===== Payment methods ===== */
       .payment-methods {
      margin-top: 18px;              /* زودنا المسافة فوق */
      padding-top: 10px;             /* مساحة داخلية بسيطة */
      border-top: 1px dashed #d1d5db;/* خط فاصل خفيف بين الخدمات والدفع */
      font-size: 13px;
    }


    .pay-option {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 6px;
    }

    .pay-option input[type="radio"] {
      cursor: pointer;
    }

    .pay-option label {
      cursor: pointer;
    }

    .small-note {
      font-size: 11px;
      color: #6b7280;
    }

    /* ===== Confirm button ===== */
    .confirm-actions {
      display: flex;
      justify-content: flex-end;
      margin-top: 10px;
    }

    .btn-final-confirm {
      border: none;
      background: #16a34a;
      color: #ffffff;
      padding: 9px 22px;
      border-radius: 999px;
      font-size: 14px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      cursor: pointer;
      box-shadow: 0 3px 10px rgba(21,128,61,0.45);
      transition:
        background 0.15s ease,
        transform 0.05s ease,
        box-shadow 0.15s ease;
    }

    .btn-final-confirm:hover {
      background: #15803d;
    }

    .btn-final-confirm:active {
      transform: translateY(1px);
      box-shadow: none;
    }

    @media (max-width: 900px) {
      .confirm-grid {
        grid-template-columns: minmax(0, 1fr);
      }
    }

    @media (max-width: 768px) {
      .confirm-hero {
        top: 8%;
      }
      .confirm-card {
        width: 92%;
        padding: 20px 14px;
      }
    }
  </style>
</head>
<body>

<!-- ===== Navbar (نفس نمط الهوم) ===== -->
<nav>
  <div class="logo">TrackMyTrip</div>

  <div class="top-links">
    <a href="home.html" class="nav-home">Home</a>
    <a href="book.jsp" class="nav-book">Book</a>
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

<!-- ===== Confirm Hero ===== -->
<div class="confirm-hero">
  <h1 class="confirm-title">Confirm your booking</h1>
  <p class="confirm-subtitle">
    Review the trip, fill passenger details, choose extra services, and select a payment method.
  </p>

  <div class="confirm-card">
    <div class="confirm-grid">
      <!-- ===== Left side: Trip & Passenger ===== -->
      <div>
        <!-- Trip summary -->
        <div class="trip-summary">
          <div class="section-title">Trip summary</div>
          <div class="section-sub">
            This is a demo summary. You can adjust the values manually for now.
          </div>

          <!-- هنا الآن بيانات ثابتة، لاحقاً ممكن تربطينها من الحجز -->
          <div class="trip-row">
            <span class="label">Route</span>
            <span class="value">Riyadh → Qurayyat</span>
          </div>
          <div class="trip-row">
            <span class="label">Date</span>
            <span class="value">2025-11-12</span>
          </div>
          <div class="trip-row">
            <span class="label">Time</span>
            <span class="value">08:10 AM – 01:55 PM</span>
          </div>
          <div class="trip-row">
            <span class="label">Class</span>
            <span class="value">Economy</span>
          </div>
          <div class="trip-row">
            <span class="label">Passengers</span>
            <span class="value" id="summaryPassengers">1</span>
          </div>
        </div>

        <!-- Passenger details -->
        <div class="passenger-section">
          <div class="section-title">Passenger details</div>
          <div class="section-sub">
            Main passenger details (demo form – single passenger).
          </div>

          <div class="passenger-grid">
            <div class="field">
              <label for="fullName">Full name</label>
              <input type="text" id="fullName" placeholder="Example: Nora Al Saud">
            </div>
            <div class="field">
              <label for="idNumber">ID / Passport</label>
              <input type="text" id="idNumber" placeholder="National ID or passport">
            </div>
            <div class="field">
              <label for="phone">Mobile number</label>
              <input type="text" id="phone" placeholder="+9665xxxxxxxx">
            </div>
            <div class="field">
              <label for="email">Email</label>
              <input type="email" id="email" placeholder="name@example.com">
            </div>
          </div>
        </div>
      </div>

      <!-- ===== Right side: Extras + Payment ===== -->
      <div class="extras-payment">
        <div class="section-title">Extras and payment</div>
        <div class="section-sub">
          Choose optional services. First 10kg of baggage is free; extra weight is charged.
        </div>

        <!-- Extras -->
        <div class="extras-group">
          <!-- Baggage -->
          <div class="extra-item">
            <div class="extra-left">
              <span class="extra-title">Extra baggage</span>
              <span class="extra-desc">
                First 10kg free. Extra: 30 SAR per 10kg.
              </span>
            </div>
            <div class="extra-right">
              <input type="number"
                     id="extraKg"
                     min="0"
                     step="10"
                     value="0">
              <span class="extra-price-tag">SAR 30 / 10kg</span>
            </div>
          </div>

          <!-- Meal -->
          <div class="extra-item">
            <div class="extra-left">
              <span class="extra-title">Onboard meal</span>
              <span class="extra-desc">
                Simple hot meal per passenger.
              </span>
            </div>
            <div class="extra-right">
              <input type="checkbox" id="mealCheckbox">
              <span class="extra-price-tag">SAR 25 / passenger</span>
            </div>
          </div>

          <!-- Wi-Fi -->
          <div class="extra-item">
            <div class="extra-left">
              <span class="extra-title">Wi-Fi</span>
              <span class="extra-desc">
                Internet access for the full trip.
              </span>
            </div>
            <div class="extra-right">
              <input type="checkbox" id="wifiCheckbox">
              <span class="extra-price-tag">SAR 15 / passenger</span>
            </div>
          </div>
        </div>

        <!-- Price summary -->
        <div class="price-summary">
          <div class="price-row">
            <span>Base fare</span>
            <span id="baseFareText">SAR 180</span>
          </div>
          <div class="price-row">
            <span>Extras total</span>
            <span id="extrasTotalText">SAR 0</span>
          </div>
          <div class="price-row total">
            <span>Grand total</span>
            <span id="grandTotalText">SAR 180</span>
          </div>
        </div>

        <!-- Payment methods -->
        <div class="payment-methods">
          <div class="section-title" style="font-size:15px; margin-bottom:4px;">
            Payment method
          </div>

          <div class="pay-option">
            <input type="radio" id="payMada" name="payMethod" value="Mada" checked>
            <label for="payMada"><i class="fa-solid fa-credit-card"></i> Mada</label>
          </div>
          <div class="pay-option">
            <input type="radio" id="payCard" name="payMethod" value="Card">
            <label for="payCard"><i class="fa-regular fa-credit-card"></i> Credit / Debit card</label>
          </div>
          <div class="pay-option">
            <input type="radio" id="payApple" name="payMethod" value="Apple Pay">
            <label for="payApple"><i class="fa-brands fa-apple"></i> Apple Pay</label>
          </div>

          <p class="small-note">
            This is a prototype page. No real payment will be processed.
          </p>
        </div>

        <!-- Final confirm -->
        <div class="confirm-actions">
          <button type="button" class="btn-final-confirm" id="finalConfirmBtn">
            <i class="fa-solid fa-check-circle"></i>
            Confirm booking
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // ===== إعداد قيم تجريبية للأسعار والركاب =====
  // تقدرين فيما بعد تربطين هذه القيم من book.jsp أو من السيرفلت
  let passengersCount = 1;          // عدد الركاب (تجريبي)
  let baseFarePerPassenger = 180;   // سعر الراكب الواحد (تجريبي)

  const summaryPassengersSpan = document.getElementById("summaryPassengers");
  const baseFareText          = document.getElementById("baseFareText");
  const extrasTotalText       = document.getElementById("extrasTotalText");
  const grandTotalText        = document.getElementById("grandTotalText");

  const extraKgInput   = document.getElementById("extraKg");
  const mealCheckbox   = document.getElementById("mealCheckbox");
  const wifiCheckbox   = document.getElementById("wifiCheckbox");

  // تحديث نص عدد الركاب وسعر الأساس
  function initBase() {
    summaryPassengersSpan.textContent = passengersCount;

    const baseTotal = baseFarePerPassenger * passengersCount;
    baseFareText.textContent = "SAR " + baseTotal;
  }

  function calculateExtras() {
    const baseTotal = baseFarePerPassenger * passengersCount;

    // أمتعة إضافية: 30 ريال لكل 10 كيلو
    let extraKg = parseInt(extraKgInput.value, 10);
    if (isNaN(extraKg) || extraKg < 0) extraKg = 0;

    // عدد البكجات (10kg blocks)
    const baggageBlocks = Math.ceil(extraKg / 10);
    const baggageCost   = baggageBlocks * 30;

    // Meal: 25 لكل راكب لو تم اختيارها
    const mealCost = mealCheckbox.checked ? (25 * passengersCount) : 0;

    // Wi-Fi: 15 لكل راكب لو تم اختياره
    const wifiCost = wifiCheckbox.checked ? (15 * passengersCount) : 0;

    const extrasTotal = baggageCost + mealCost + wifiCost;
    const grandTotal  = baseTotal + extrasTotal;

    extrasTotalText.textContent = "SAR " + extrasTotal;
    grandTotalText.textContent  = "SAR " + grandTotal;
  }

  // أول تشغيل
  initBase();
  calculateExtras();

  // الأحداث
  extraKgInput.addEventListener("change", calculateExtras);
  mealCheckbox.addEventListener("change", calculateExtras);
  wifiCheckbox.addEventListener("change", calculateExtras);

  // زر التأكيد النهائي (Prototype)
 document.getElementById("finalConfirmBtn").addEventListener("click", () => {
  alert("Your payment is confirmed (demo). Your booking is now active.");

  // بعد “الدفع” نروح لصفحة ماي بوكينق
  window.location.href = "my_bookings_design.html";
});
</script>

<!-- لو حابة تفعّلين زر اللغة والمودالات هنا لاحقاً: -->
<!-- <script src="main.js"></script> -->

</body>
</html>
