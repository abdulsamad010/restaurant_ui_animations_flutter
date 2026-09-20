# 🍽️ Savoria — Restaurant UI & Animations Flutter

A modern restaurant-style Flutter UI project focused on smooth animations, interactive food listings, reusable widgets, and a polished user experience.

## ✨ Features

- 🏠 Modern restaurant Home screen
- 🍔 Food category selection
- 🍕 Food listing with reusable `FoodCard`
- 📱 Food Details screen
- 🛒 Add to Cart functionality
- 🗑️ Delete items from Cart
- 💳 Simple checkout confirmation dialog
- ℹ️ About screen
- 🎬 Implicit animations
- 🎮 Explicit animations
- 🦸 Hero animations
- ✨ Lottie animations
- 🖱️ Interactive hover effects for Flutter Web
- 📱 Responsive UI using `flutter_screenutil`
- 🎨 Warm restaurant-style visual design

## 🛠️ Technologies

- Flutter
- Dart
- Flutter BLoC
- Lottie
- Flutter ScreenUtil

## 📁 Project Structure

```text
restaurant_ui_animations_flutter/
├── assets/
│   ├── images/
│   └── animations/
├── lib/
│   ├── core/
│   │   ├── bloc/
│   │   ├── data/
│   │   └── widgets/
│   │       ├── cart_card.dart
│   │       └── food_card.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── food_details_screen.dart
│   │   ├── cart_screen.dart
│   │   └── about_screen.dart
│   └── main.dart
├── android/
├── ios/
├── web/
├── pubspec.yaml
└── README.md
```

## 🎬 Animations

The project demonstrates different Flutter animation approaches.

### Implicit Animations

Used for simple UI changes such as hover and interactive visual effects.

### Explicit Animations

Implemented using `AnimationController` and transition widgets such as:

- `ScaleTransition`
- `SlideTransition`
- `FadeTransition`
- `SizeTransition`

### Hero Animation

Used to create a smooth transition between food listing and food details.

### Lottie Animations

Lottie animations are used for visual feedback and decorative elements, including:

- Shopping cart
- Shopping bag
- Favorite
- Celebration
- Waving hand

## 🛒 Cart

The cart uses local application state and supports:

- Adding food items
- Displaying cart items
- Removing items
- Cart item count
- Checkout confirmation dialog

## 🎨 UI Design

Savoria follows a warm restaurant-inspired visual style with:

- Cream/warm background
- Burgundy/red accent color
- Clean cards
- Rounded corners
- Food imagery
- Smooth animations
- Responsive spacing and sizing

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/dev-ASamad/restaurant_ui_animations_flutter.git
```

### 2. Open the project

```bash
cd restaurant_ui_animations_flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

## 📱 Platforms

The project is configured for:

- Android
- iOS
- Web

## 📌 Project Scope

This project is focused on **Flutter UI, animations, interaction, and user experience**.

It does not use a backend or external database. Food data is handled locally within the application.

## 👨‍💻 Developer

**Abdul Samad Abbasi**

Flutter Developer

GitHub: https://github.com/abdulsamad010

Repository: https://github.com/dev-ASamad/restaurant_ui_animations_flutter

## 📄 License

This project is created for learning.
