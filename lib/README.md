# Software Persona E-Commerce

A simple product catalog mobile app I built during a 5-day Flutter training. It pulls product data from an API and lets you browse products, view details, and add them to a cart.

---

## Screenshots

> *(Add your screenshots here)*

---

## Features

- Product listing with GridView
- Search / filter by product name
- Product detail page (description, specs, price)
- Add to cart & remove from cart
- Checkout simulation

---

## Tech Stack

- Flutter `3.41.9`
- Dart
- Only uses built-in `material.dart` — no extra packages

---

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── product_model.dart
├── services/
│   └── api_service.dart
├── components/
│   ├── product_card.dart
│   └── custom_card.dart
└── views/
    ├── home_screen.dart
    ├── product_detail_screen.dart
    └── cart_screen.dart
```

---

## Getting Started

**Requirements:**
- Flutter SDK 3.41.9
- Android Studio (for emulator) or a physical Android device
- VS Code or any IDE

**Steps:**

```bash
# 1. Clone the repo
git clone https://github.com/osmandmr099/software-persona-ecommerce.git

# 2. Go into the project folder
cd software-persona-ecommerce

# 3. Get dependencies
flutter pub get

# 4. Run the app
flutter run
```

> Make sure your emulator is running or a device is connected before `flutter run`.

---

## API

Product data is fetched from `https://wantapi.com/products.php` (used for educational/demo purposes only).

Alternative APIs you can swap in:
- [Fake Store API](https://fakestoreapi.com/products)
- [DummyJSON](https://dummyjson.com/products)

---

## Notes

This was my first Flutter project — built it in a week as part of a training program. It's not perfect but it works! 🙂