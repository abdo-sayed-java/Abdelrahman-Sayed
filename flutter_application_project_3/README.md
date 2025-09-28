# 🛒 Flutter Shopping App

A complete bilingual shopping app built with **Flutter** and **Dart**, simulating a real-world e-commerce experience.  
The project covers everything from basic Dart programming to advanced Flutter concepts such as UI design, navigation, animations, form validation, and localization (Arabic/English).

---

## 📌 Project Overview

This project demonstrates the full lifecycle of a mobile shopping application.  
It includes **user authentication (Sign Up / Sign In)**, a **welcome screen**, a **shopping home screen with products and offers**, and **bilingual support** for English and Arabic.

The app is designed to simulate a professional shopping interface and provide a solid foundation for intermediate Flutter development.

---

## ✨ Features

- **Welcome Page**

  - AppBar with title
  - Local + online images in a row
  - App name and description with custom font
  - Buttons to Sign Up / Sign In

- **Authentication**

  - **Sign Up Form** with validation:
    - Name (first letter uppercase)
    - Email (must include @)
    - Password (min 6 chars)
    - Confirm password (must match)
  - Success dialog + navigation to Home screen

  - **Sign In Form** with validation:
    - Email (must include @)
    - Password (min 6 chars)
  - Success dialog + navigation to Home screen

- **Navigation & Animations**

  - Smooth fade transition between Sign In/Sign Up and Home

- **Shopping Home Screen**

  - AppBar titled “Our Products”
  - Horizontal PageView with featured images
  - GridView (2 per row) showing product cards:
    - Product image, title, and Add to Cart button
    - Snackbar confirmation on cart actions
  - **Hot Offers Section**
    - Built with `ListView.builder`
    - 5 scrollable cards, each with image + description using `Expanded`

- **Localization (Bonus)**
  - Full Arabic language support (no hardcoded strings)
  - Translations stored in JSON files via `easy_localization`
  - Toggle language from Drawer or AppBar

---

## 🛠️ Setup Instructions

1. **Clone this repository**

   ```bash
   git clone https://github.com/abdo-sayed-java/Abdelrahman-Sayed.git
   cd Abdelrahman-Sayed

   ```

2. Install Flutter dependencies
   flutter pub get

3. Check connected device or emulator
   flutter devices

4. Run the app
   Run the app

5. Add assets if missing
   Make sure your pubspec.yaml includes:
   assets: - assets/
