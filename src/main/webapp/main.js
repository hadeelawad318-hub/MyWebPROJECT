// ===== Modals =====
const loginModal = document.getElementById('loginModal');
const signupModal = document.getElementById('signupModal');

const loginBtn = document.querySelector('.login');
const signupBtn = document.querySelector('.signup');
const closeButtons = document.querySelectorAll('.close');

loginBtn.addEventListener('click', () => loginModal.style.display = 'flex');
signupBtn.addEventListener('click', () => signupModal.style.display = 'flex');

closeButtons.forEach(btn => {
  btn.addEventListener('click', () => {
    loginModal.style.display = 'none';
    signupModal.style.display = 'none';
  });
});

window.addEventListener('click', (e) => {
  if(e.target === loginModal) loginModal.style.display = 'none';
  if(e.target === signupModal) signupModal.style.display = 'none';
});

// ===== Language Toggle =====
const langBtn = document.querySelector('.language-toggle');

const heroTitle = document.querySelector('.hero-title');
const heroText = document.querySelector('.hero-text');

const fromToTitle = document.querySelector('.from-to-title');
const fromToText = document.querySelector('.from-to-text');

const travelDateTitle = document.querySelector('.travel-date-title');
const travelDateText = document.querySelector('.travel-date-text');

const passengersTitle = document.querySelector('.passengers-title');
const passengersText = document.querySelector('.passengers-text');

const navHome = document.querySelector('.nav-home');
const navBook = document.querySelector('.nav-book');
const navBookings = document.querySelector('.nav-bookings');
const navSupport = document.querySelector('.nav-support');

const loginBtnText = document.querySelector('.login');
const signupBtnText = document.querySelector('.signup');

let isEnglish = true;

langBtn.addEventListener('click', () => {
  if (isEnglish) {
    // ===== العربية =====
    heroTitle.textContent = "تتبع رحلتي ";
    heroText.textContent = "سافر بأمان وراحة وفي الوقت المناسب في جميع أنحاء المملكة.";

    fromToTitle.textContent = "من → إلى";
    fromToText.textContent = "اختر محطات المغادرة والوصول";

    travelDateTitle.textContent = "تاريخ السفر";
    travelDateText.textContent = "12 نوفمبر 2025";

    passengersTitle.textContent = "المسافرون";
    passengersText.textContent = "1 بالغ";

    navHome.textContent = "الرئيسية";
    navBook.textContent = "الحجز";
    navBookings.textContent = "حجوزاتي";
    navSupport.textContent = "الدعم";

    loginBtnText.textContent = "تسجيل الدخول";
    signupBtnText.textContent = "تسجيل جديد";

    // ===== ترجمة Modals =====
    document.querySelector("#loginModal h2").textContent = "تسجيل الدخول";
    document.querySelector("#loginModal input[type=text]").placeholder = "اسم المستخدم";
    document.querySelector("#loginModal input[type=password]").placeholder = "كلمة المرور";
    document.querySelector("#loginModal .submit-btn").textContent = "تسجيل الدخول";

    document.querySelector("#signupModal h2").textContent = "تسجيل جديد";
    document.querySelector("#signupModal input[type=text]").placeholder = "الاسم الكامل";
    document.querySelector("#signupModal input[type=email]").placeholder = "البريد الإلكتروني";
    document.querySelector("#signupModal input[type=password]").placeholder = "كلمة المرور";
    document.querySelector("#signupModal .submit-btn").textContent = "تسجيل جديد";

    isEnglish = false;
  } else {
    // ===== الإنجليزية =====
    heroTitle.textContent = "TrackMyTrip";
    heroText.textContent = "Travel safely, comfortably, and on time across the Kingdom.";

    fromToTitle.textContent = "From → To";
    fromToText.textContent = "Select departure and arrival stations";

    travelDateTitle.textContent = "Travel Date";
    travelDateText.textContent = "12 November 2025";

    passengersTitle.textContent = "Passengers";
    passengersText.textContent = "1 Adult";

    navHome.textContent = "Home";
    navBook.textContent = "Book";
    navBookings.textContent = "My Bookings";
    navSupport.textContent = "Support";

    loginBtnText.textContent = "Login";
    signupBtnText.textContent = "Sign Up";

    // ===== ترجمة Modals =====
    document.querySelector("#loginModal h2").textContent = "Login";
    document.querySelector("#loginModal input[type=text]").placeholder = "Username";
    document.querySelector("#loginModal input[type=password]").placeholder = "Password";
    document.querySelector("#loginModal .submit-btn").textContent = "Login";

    document.querySelector("#signupModal h2").textContent = "Sign Up";
    document.querySelector("#signupModal input[type=text]").placeholder = "Full Name";
    document.querySelector("#signupModal input[type=email]").placeholder = "Email";
    document.querySelector("#signupModal input[type=password]").placeholder = "Password";
    document.querySelector("#signupModal .submit-btn").textContent = "Sign Up";

    isEnglish = true;
  }
});

// ===== From → To Dropdown =====
const fromToOption = document.querySelector('.from-to-option');
const fromToDropdown = document.querySelector('.from-to-dropdown');
const fromCity = document.getElementById('fromCity');
const toCity = document.getElementById('toCity');

fromToOption.addEventListener('click', () => {
  fromToDropdown.style.display = fromToDropdown.style.display === 'block' ? 'none' : 'block';
});
fromToDropdown.addEventListener('click', (e) => e.stopPropagation());

function updateFromToText() {
  const fromOption = fromCity.options[fromCity.selectedIndex];
  const toOption = toCity.options[toCity.selectedIndex];

  const from = isEnglish ? fromOption.value || "From" : fromOption.dataset.ar || "من";
  const to = isEnglish ? toOption.value || "To" : toOption.dataset.ar || "إلى";

  fromToText.textContent = `${from} → ${to}`;
}

fromCity.addEventListener('change', updateFromToText);
toCity.addEventListener('change', updateFromToText);

// ===== Travel Date Dropdown =====
const dateOption = document.querySelector('.date-option');
const dateDropdown = document.querySelector('.date-dropdown');
const travelDateInput = document.getElementById('travelDate');

dateOption.addEventListener('click', () => {
  dateDropdown.style.display = dateDropdown.style.display === 'block' ? 'none' : 'block';
});
dateDropdown.addEventListener('click', (e) => e.stopPropagation());

travelDateInput.addEventListener('change', () => {
  travelDateText.textContent = travelDateInput.value;
});

// ===== Passengers Dropdown =====
const passengersOption = document.querySelector('.passengers-option');
const passengersDropdown = document.querySelector('.passengers-dropdown');
const adultCount = document.getElementById('adultCount');
const childCount = document.getElementById('childCount');
const infantCount = document.getElementById('infantCount');
const applyPassengersBtn = document.getElementById('applyPassengers');

passengersOption.addEventListener('click', () => {
  passengersDropdown.style.display = passengersDropdown.style.display === 'block' ? 'none' : 'block';
});
passengersDropdown.addEventListener('click', (e) => e.stopPropagation());

applyPassengersBtn.addEventListener('click', () => {
  passengersText.textContent = `${adultCount.value} Adult, ${childCount.value} Child, ${infantCount.value} Infant`;
  passengersDropdown.style.display = 'none';
});


